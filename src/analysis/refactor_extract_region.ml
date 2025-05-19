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

module Gen = struct
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

  let toplevel_function params name body =
    let open Ast_helper in
    let params =
      List.map
        (fun param ->
          let pattern =
            Pat.construct
              (Location.mknoloc (Untypeast.lident_of_path param))
              None
          in
          { Parsetree.pparam_loc = Location.none;
            pparam_desc = Pparam_val (Nolabel, None, pattern)
          })
        params
    in
    let body = Exp.function_ params None (Pfunction_body body) in
    toplevel_let_binding name body
end

let free_variables node env =
  let concat_set f children =
    List.fold_left
      (fun acc child -> f child |> Path.Set.union acc)
      Path.Set.empty children
  in
  let rec find_pattern_var : type a. a Typedtree.general_pattern -> Path.Set.t =
   fun { Typedtree.pat_desc; _ } ->
    match pat_desc with
    | Typedtree.Tpat_var (ident, _, _) -> Path.Set.singleton (Pident ident)
    | Tpat_tuple pats -> concat_set (fun p -> find_pattern_var p) pats
    | Tpat_alias (pat, ident, _, _) ->
      let open Path.Set in
      union (singleton (Pident ident)) (find_pattern_var pat)
    | Tpat_construct (_, _, pats, _) -> concat_set find_pattern_var pats
    | Tpat_variant (_, Some pat, _) -> find_pattern_var pat
    | Tpat_record (fields, _) ->
      concat_set (fun (_, _, field) -> find_pattern_var field) fields
    | Tpat_array arr -> concat_set find_pattern_var arr
    | Tpat_lazy pat | Tpat_exception pat -> find_pattern_var pat
    | Tpat_value pat ->
      find_pattern_var (pat :> Typedtree.value Typedtree.general_pattern)
    | Tpat_or (l, r, _) ->
      Path.Set.union (find_pattern_var l) (find_pattern_var r)
    | _ -> Path.Set.empty
  in
  let rec find_vars node env =
    (* Find all variable which appears in [node]. *)
    Mbrowse.fold_node
      (fun env node acc ->
        match node with
        | Expression { exp_desc = Texp_ident (path, _, _); _ } ->
          (* Filter Stdlib declarations. *)
          if Path.head path |> Ident.name = "Stdlib" then acc
          else Path.Set.add path acc
        | Pattern pat -> find_pattern_var pat |> Path.Set.union acc
        | _ ->
          (* let () =
            match n with
            | Expression ({ exp_desc = Texp_apply _; _ } as e) ->
              let node = Browse_tree.of_node ~env node in
              Format.asprintf "Repr: %i %a"
                (List.length (Lazy.force node.t_children))
                Printtyped.expression e
              |> prerr_endline
            | _ -> ()
          in
          let () =
            prerr_endline
            @@ Format.asprintf "%a" Location.print_loc
            @@ Mbrowse.node_loc n
          in
          let () = prerr_endline @@ Browse_raw.string_of_node n ^ "\n" in
 *)
          let node = Browse_tree.of_node ~env node in
          let child = Lazy.force node.t_children in
          concat_set (fun c -> find_vars c.Browse_tree.t_node env) child
          |> Path.Set.union acc)
      env node Path.Set.empty
  in
  let rec find_bounded_vars node env =
    (* Find all variable definition which appears in [node]. *)
    Mbrowse.fold_node
      (fun env node acc ->
        let node = Browse_tree.of_node ~env node in
        let nodes_vars =
          match node.t_node with
          | Pattern pat -> find_pattern_var pat
          | Value_binding { vb_pat; _ } ->
            let children =
              concat_set
                (fun child -> find_bounded_vars child.Browse_tree.t_node env)
                (Lazy.force node.t_children)
            in
            Path.Set.union (find_pattern_var vb_pat) children
          | _ ->
            concat_set
              (fun child -> find_bounded_vars child.Browse_tree.t_node env)
              (Lazy.force node.t_children)
        in
        Path.Set.union acc nodes_vars)
      env node Path.Set.empty
  in
  let mentionned_vars = find_vars node env in
  let bounded_vars = find_bounded_vars node env in

  let _ =
    prerr_endline "Mentionned";
    Path.Set.iter (fun p -> prerr_endline ("  " ^ Path.name p)) mentionned_vars;
    prerr_endline "Defined";
    Path.Set.iter (fun p -> prerr_endline ("  " ^ Path.name p)) bounded_vars
  in

  Path.Set.diff mentionned_vars bounded_vars |> Path.Set.to_list

(* Maybe add this function in Msource? *)
let buffer_sub source start stop =
  let (`Offset start_offset) = Msource.get_offset source start in
  let (`Offset end_offset) = Msource.get_offset source stop in
  let buffer = Msource.text source in
  String.sub buffer start_offset (end_offset - start_offset)

let extract_to_toplevel name expr let_binding source ~expr_env ~src ~dst =
  let name = FreshName.gen_val_name name expr_env in
  let substitution = [ Diff.delete src; Diff.add src name ] in
  let fresh_let_binding =
    let_binding name expr
    |> Format.asprintf "%a" Pprintast.structure_item
    |> Diff.add dst
  in
  let end_of_buffer =
    let _, line, col = Location.get_pos_info dst.loc_end in
    buffer_sub source (`Logical (line, col)) `End
  in
  let buffer_dst =
    let loc =
      { dst.loc_end with
        pos_cnum = 0;
        pos_bol = 0;
        pos_lnum = dst.loc_end.pos_lnum + 1
      }
    in
    { Location.loc_start = loc; loc_end = loc; loc_ghost = false }
  in
  let insertion = [ fresh_let_binding; Diff.add buffer_dst end_of_buffer ] in
  substitution @ insertion

let extract_const_to_toplevel const =
  extract_to_toplevel "const_name" (Untypeast.constant const)
    Gen.let_const_toplevel_binding

let extract_expr_to_toplevel node expr ~expr_env =
  let generated_let =
    match (free_variables node expr_env, expr.Typedtree.exp_desc) with
    | [], Texp_function _ -> Gen.toplevel_let_binding
    | [], _ -> Gen.let_unit_toplevel_binding
    | fun_params, _ -> Gen.toplevel_function fun_params
  in
  extract_to_toplevel "fun_name"
    (Untypeast.untype_expression expr)
    generated_let ~expr_env

(* We select the most inclusive expression contained entirely within the given region. *)
let select_suitable_expr ~start ~stop nodes =
  let region =
    { Location.loc_start = start; loc_end = stop; loc_ghost = true }
  in
  nodes |> List.rev
  |> List.find_map (fun (env, node) ->
         let node_loc = Mbrowse.node_loc node in
         (* let is = Location_aux.included node_loc ~into:region in
         Format.asprintf "Candidate: %S, contains: %b, loc: %a"
           (Browse_raw.string_of_node node)
           is Location.print_loc node_loc
         |> prerr_endline; *)
         match node with
         | Expression expr when Location_aux.included node_loc ~into:region ->
           Some (node, expr, env)
         | _ -> None)

let diffs ~start ~stop raw_source structure =
  let enclosing = Mbrowse.enclosing start [ Mbrowse.of_structure structure ] in
  match select_suitable_expr ~start ~stop enclosing with
  | None -> failwith "nothing to do"
  | Some (node, expr, expr_env) -> begin
    let toplevel_parent_item =
      List.find
        (fun item ->
          Location_aux.included expr.exp_loc ~into:item.Typedtree.str_loc)
        structure.str_items
    in
    let src = expr.exp_loc in
    let dst = toplevel_parent_item.str_loc in
    match expr.exp_desc with
    | Texp_constant const ->
      (* Special case for constant. They can't produce side effect so it's not
         necessary to add a trailing unit parameter to the let binding. *)
      extract_const_to_toplevel const raw_source ~expr_env ~src ~dst
    | _ -> extract_expr_to_toplevel node expr raw_source ~expr_env ~src ~dst
  end

(*
- Better commit history
- Utiliser environnement local pour savoir
*)

(*
Identifier les variables référencées et récupérer leur loc avec project wide occurence

récupérer localisation des vars de l'expression toplevel extraite

Si la loc est en dehors du buffer -> considéré comme lié
Si la loc est au dessus de l'expression toplevel extraite -> libre
Sinon tout ce qui est compris dans l'enclosing -> variable libre

demander à ulysse si l'euphorisme lui paraît correcte

regarder Env.diff *)

(* ajouter test récursion mutuelle *)
