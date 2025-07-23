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
    side : [ `signature | `structure ]
  }

let first_type_infos { decls; _ } =
  match decls with
  | decl :: _ -> (decl.typ_name.txt, Ident.stamp decl.typ_id)
  | [] ->
    (* Each type declaration carries at least one declaration. *)
    assert false

let rename_type stamp ~new_name typ_decl =
  let rename mapper typ_decl =
    prerr_endline (Ident.name typ_decl.Typedtree.typ_id);
    let typ_stamp = Ident.stamp typ_decl.Typedtree.typ_id in
    if Int.equal typ_stamp stamp then
      { typ_decl with typ_name = Location.mknoloc new_name }
    else Tast_mapper.default.type_declaration mapper typ_decl
  in
  let mapper =
    { Tast_mapper.default with
      type_declaration = rename;
      typ =
        (fun mapper typ ->
          match typ.ctyp_desc with
          | Ttyp_var var -> prerr_endline var; typ
          | _ -> Tast_mapper.default.typ mapper typ)
    }
  in
  { typ_decl with
    decls =
      List.map ~f:(mapper.type_declaration Tast_mapper.default) typ_decl.decls
  }

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
  Stdlib.List.find_map
    (fun (_, (node : Browse_raw.node)) ->
      match node with
      | Structure_item
          ({ str_desc = Tstr_type (rec_flag, decls); str_loc; _ }, _) ->
        Some { rec_flag; decls; loc = str_loc; side = `structure }
      | Signature_item
          ({ sig_desc = Tsig_type (rec_flag, decls); sig_loc; _ }, _) ->
        Some { rec_flag; decls; loc = sig_loc; side = `signature }
      | _ -> None)
    enclosing

let is_type_decl_wrappable ~pos mbrowse =
  let enclosing = Mbrowse.enclosing pos [ mbrowse ] in
  match select_type_decl enclosing with
  | Some _ -> true
  | None -> false

let wrap ~pos typedtree =
  let mbrowse =
    match typedtree with
    | `Interface signature -> Mbrowse.of_signature signature
    | `Implementation structure -> Mbrowse.of_structure structure
  in
  let enclosing = Mbrowse.enclosing pos [ mbrowse ] in
  match select_type_decl enclosing with
  | None -> raise Nothing_to_do
  | Some type_decl ->
    let type_name, type_stamp = first_type_infos type_decl in
    let capitalized_tyname = String.capitalize_ascii type_name in
    let type_decl = rename_type type_stamp ~new_name:"t" type_decl in
    let content =
      match type_decl.side with
      | `structure ->
        Gen.module_item capitalized_tyname type_decl
        |> Format.asprintf "%a" Pprintast.structure_item
      | `signature ->
        Gen.module_sig_item capitalized_tyname type_decl
        |> Format.asprintf "%a" Pprintast.signature_item
    in
    { Query_protocol.loc = type_decl.loc; content }
