open Std

exception Nothing_to_do

let () =
  Location.register_error_of_exn (function
    | Nothing_to_do -> Some (Location.error "Nothing to do")
    | _ -> None)

type type_decl =
  { rec_flag : Asttypes.rec_flag;
    decls : Typedtree.type_declaration list;
    loc : Location.t;
    side : [ `ML | `MLI ]
  }

let first_type_name { decls; _ } =
  match decls with
  | decl :: _ -> decl.typ_name.txt
  | [] -> assert false

let rename_first_type new_name typ_decl =
  match typ_decl.decls with
  | decl :: ds ->
    { typ_decl with
      decls = { decl with Typedtree.typ_name = Location.mknoloc new_name } :: ds
    }
  | [] -> assert false

module Gen = struct
  let untype_type_decl td =
    Untypeast.(default_mapper.type_declaration default_mapper) td

  let module_item name { rec_flag; decls; _ } =
    let open Ast_helper in
    let name = Location.mknoloc (Some name) in
    let body = List.map ~f:untype_type_decl decls |> Str.type_ rec_flag in
    Str.module_ (Mb.mk name (Mod.structure [ body ]))

  let module_sig_item name { rec_flag; decls; _ } =
    let open Ast_helper in
    let name = Location.mknoloc (Some name) in
    let body = List.map ~f:untype_type_decl decls |> Sig.type_ rec_flag in
    Sig.module_ (Md.mk name (Mty.signature [ body ]))
end

let select_type_decl enclosing =
  match
    Stdlib.List.find_map
      (fun (_, (node : Browse_raw.node)) ->
        match node with
        | Structure_item
            ({ str_desc = Tstr_type (rec_flag, decls); str_loc; _ }, _) ->
          Some { rec_flag; decls; loc = str_loc; side = `ML }
        | Signature_item
            ({ sig_desc = Tsig_type (rec_flag, decls); sig_loc; _ }, _) ->
          Some { rec_flag; decls; loc = sig_loc; side = `MLI }
        | _ -> None)
      enclosing
  with
  | Some infos -> infos
  | None -> raise Nothing_to_do

let wrap ~pos typedtree =
  let mbrowse =
    match typedtree with
    | `Interface signature -> Mbrowse.of_signature signature
    | `Implementation structure -> Mbrowse.of_structure structure
  in
  let enclosing = Mbrowse.enclosing pos [ mbrowse ] in
  let type_decl = select_type_decl enclosing in
  let type_name = first_type_name type_decl |> String.capitalize_ascii in
  let type_decl = rename_first_type "t" type_decl in
  let content =
    match type_decl.side with
    | `ML ->
      Gen.module_item type_name type_decl
      |> Format.asprintf "%a" Pprintast.structure_item
    | `MLI ->
      Gen.module_sig_item type_name type_decl
      |> Format.asprintf "%a" Pprintast.signature_item
  in
  { Query_protocol.loc = type_decl.loc; content }
