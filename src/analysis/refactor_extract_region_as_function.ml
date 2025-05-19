module Diff = struct
  let add loc content = Query_protocol.Addition (loc, content)
  let delete loc = Query_protocol.Deletion loc
end
module FreshName = struct
  (* Generate a fresh name that does not already exists in given environment. *)
  let gen_val_name basename env =
    let rec loop n =
      let guess = basename ^ Int.to_string n in
      if Env.bound_value guess env then succ n |> loop else guess
    in
    loop 1
end

module CodeGen = struct
  let toplevel_let_binding name body =
    let open Ast_helper in
    let pattern = Pat.mk (Ppat_var { txt = name; loc = Location.none }) in
    Str.value Nonrecursive [ Vb.mk pattern body ]

  let let_const_toplevel_binding name const =
    Ast_helper.Exp.constant const |> toplevel_let_binding name

  let let_unit_toplevel_binding name body =
    let open Ast_helper in
    let unit_param =
      { Parsetree.pparam_loc = Location.none;
        pparam_desc =
          Pparam_val
            ( Nolabel,
              None,
              Pat.construct (Location.mknoloc (Longident.Lident "()")) None )
      }
    in
    let body = Exp.function_ [ unit_param ] None (Pfunction_body body) in
    toplevel_let_binding name body

  let toplevel_function name params body =
    let open Ast_helper in
    let params =
      List.map
        (fun name ->
          { Parsetree.pparam_loc = Location.none;
            pparam_desc =
              Pparam_val
                ( Nolabel,
                  None,
                  Pat.construct (Location.mknoloc (Longident.Lident name)) None
                )
          })
        params
    in
    let body = Exp.function_ params None (Pfunction_body body) in
    toplevel_let_binding name body
end

let free_variables node env =
  (* Find all variable which appears in [node]. *)
  let rec find_vars node env =
    Mbrowse.fold_node
      (fun env node acc ->
        match node with
        | Expression { exp_desc = Texp_ident (path, _, _); _ } ->
          let () = prerr_endline (Path.last path) in
          Path.Set.add path acc
        | _ ->
          let node = Browse_tree.of_node ~env node in
          let child = Lazy.force node.t_children in
          List.fold_left
            (fun acc child ->
              find_vars child.Browse_tree.t_node env |> Path.Set.union acc)
            acc child)
      env node Path.Set.empty
  in
  let rec find_bounded_vars node env =
    let concat_set f children =
      List.fold_left
        (fun acc child -> f child |> Path.Set.union acc)
        Path.Set.empty children
    in
    Mbrowse.fold_node
      (fun env node acc ->
        let node = Browse_tree.of_node ~env node in
        match node.t_node with
        | Pattern p ->
          let () =
            prerr_endline @@ Int.to_string (List.length (Lazy.force node.t_children))
          in
          concat_set
            (fun child -> find_bounded_vars child.Browse_tree.t_node env)
            (Lazy.force node.t_children)
        (* | Value_binding
            { vb_pat =
                { pat_desc = Tpat_var (ident, _, _) | Tpat_alias (_, ident, _, _);
                  _
                };
              _
            } -> assert false
        | Tpat_tuple pats
        TODO: pattern handle Class_declaration, méthode *)
        | _ ->
          let node = Browse_tree.of_node ~env node in
          let child = Lazy.force node.t_children in
          List.fold_left
            (fun acc child ->
              find_bounded_vars child.Browse_tree.t_node env
              |> Path.Set.union acc)
            acc child)
      env node Path.Set.empty
  in
  Path.Set.diff (find_vars node env) (find_bounded_vars node env)
  |> Path.Set.to_list

(* Returns the surrounding location which include all given items. *)
let rec items_span = function
  | [] -> None
  | [ l ] -> Some l.pstr_loc
  | [ { Parsetree.pstr_loc = { Location.loc_start; _ }; _ };
      { pstr_loc = { loc_end; _ }; _ }
    ] -> Some { loc_start; loc_end; loc_ghost = false }
  | l :: _ :: r -> items_span (l :: r)

let extract_to_toplevel name expr let_binding struct_items ~toplevel_env
    ~extract_region ~insert_region =
  let name = FreshName.gen_val_name name toplevel_env in
  let delete_extract_region = Diff.delete extract_region in
  let insert_ref_to_new_binding = Diff.add extract_region name in
  let insert_toplevel_let =
    let_binding name expr
    |> Format.asprintf "%a" Pprintast.structure_item
    |> Diff.add insert_region
  in
  let refactor =
    [ delete_extract_region; insert_ref_to_new_binding; insert_toplevel_let ]
  in
  let rest_of_buffer =
    match items_span struct_items with
    | None -> []
    | Some del_loc ->
      let loc =
        { del_loc.loc_end with pos_lnum = del_loc.loc_end.pos_lnum + 1 }
      in
      let insert_loc =
        { Location.loc_start = loc; loc_end = loc; loc_ghost = false }
      in
      let buffer =
        struct_items
        |> List.map (Format.asprintf "%a" Pprintast.structure_item)
        |> String.concat " "
      in
      [ Diff.delete del_loc; Diff.add insert_loc buffer ]
  in
  refactor @ rest_of_buffer

let extract_const_to_toplevel const =
  extract_to_toplevel "const_name" (Untypeast.constant const)
    CodeGen.let_const_toplevel_binding

let extract_expr_to_toplevel node expr ~expr_env =
  match free_variables node expr_env with
  | [] ->
    extract_to_toplevel "fun_name"
      (Untypeast.untype_expression expr)
      CodeGen.let_unit_toplevel_binding
  | free_vars ->
    (* TODO: extract without unit *)
    let () = List.iter (fun v -> prerr_endline (Path.last v)) free_vars in
    assert false

let is_contains loc ~inside:{ Location.loc_start; loc_end; _ } =
  let _, start_line, start_char = Location.get_pos_info loc.Location.loc_start
  and _, stop_line, stop_char = Location.get_pos_info loc.loc_end in
  let _, inner_start_line, inner_start_char = Location.get_pos_info loc_start
  and _, inner_stop_line, inner_stop_char = Location.get_pos_info loc_end in
  (start_line, start_char) >= (inner_start_line, inner_start_char)
  && (stop_line, stop_char) <= (inner_stop_line, inner_stop_char)

let is_after loc { Location.loc_start; loc_end; _ } =
  let _, start_line, start_char = Location.get_pos_info loc.Location.loc_start
  and _, stop_line, stop_char = Location.get_pos_info loc.loc_end in
  let _, inner_start_line, inner_start_char = Location.get_pos_info loc_start
  and _, inner_stop_line, inner_stop_char = Location.get_pos_info loc_end in
  (start_line, start_char) <= (inner_start_line, inner_start_char)
  && (stop_line, stop_char) <= (inner_stop_line, inner_stop_char)

(* We select the most inclusive expression contained entirely within the given region. *)
let select_suitable_expr ~start ~stop nodes =
  let region =
    { Location.loc_start = start; loc_end = stop; loc_ghost = false }
  in
  nodes |> List.rev
  |> List.find_map (fun (env, node) ->
         let node_loc = Mbrowse.node_loc node in
         let is = is_contains node_loc ~inside:region in
         Format.asprintf "Candidate: %S, contains: %b, loc: %a"
           (Browse_raw.string_of_node node)
           is Location.print_loc node_loc
         |> prerr_endline;
         match node with
         | Browse_raw.Expression expr when is_contains node_loc ~inside:region
           -> Some (node, expr, env)
         | _ -> None)

let diffs ~start ~stop structure =
  let nodes = Mbrowse.enclosing start [ Mbrowse.of_structure structure ] in
  match select_suitable_expr ~start ~stop nodes with
  | None -> failwith "nothing to do"
  | Some (node, expr, expr_env) -> begin
    let parent_item =
      List.find
        (fun item ->
          is_contains expr.Typedtree.exp_loc ~inside:item.Typedtree.str_loc)
        structure.str_items
    in
    let struct_items =
      { structure with
        str_items =
          List.filter
            (fun item -> is_after expr.exp_loc item.Typedtree.str_loc)
            structure.str_items
      }
      |> Untypeast.untype_structure
    in
    match expr.exp_desc with
    | Typedtree.Texp_constant const ->
      (* Special case for constant. We know that they can't produce side effect
         so it's not necessary to add a trailing unit parameter to the let binding. *)
      extract_const_to_toplevel const struct_items
        ~toplevel_env:structure.str_final_env ~extract_region:expr.exp_loc
        ~insert_region:parent_item.str_loc
    | _ ->
      extract_expr_to_toplevel node expr struct_items ~expr_env
        ~toplevel_env:structure.str_final_env ~extract_region:expr.exp_loc
        ~insert_region:parent_item.str_loc
  end

(* TODO: detect free variable in expression and generates function param accordly *)
(* TODO: add function application trailing unit when there are no free variable *)
