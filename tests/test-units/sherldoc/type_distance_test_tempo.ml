open Merlin_sherlodoc

let () =
  match
    Sys.argv.(1) |> Type_expr.from_string |> Option.map Type_distance.make_path
  with
  | None -> prerr_endline "Invalid type expression"
  | Some expr ->
    let pp_steps = Fmt.Dump.list (Fmt.Dump.list Type_distance.pp) in
    Fmt.pr "%s\n[@[<hov>%a@]]\n" Sys.argv.(1) pp_steps expr

(*
  "int"
   [[Tyname "int"]]'

   "int -> string"
   [[Left_arrow; Tyname "int"]; [Right_arrow; Tyname "string"]]

  "bool -> string option"
   [[Left_arrow; Tyname "bool"];
    [Right_arrow; Tyname "option";
     Argument { position = 0; length = 6 }; Tyname "string"]]

  "bool -> (string, int) result"
    [[Left_arrow; Tyname "bool"];
                 [Right_arrow; Tyname "result";
                  Argument { position = 1; length = 6 }; Tyname "int"];
                 [Right_arrow; Tyname "result";
                  Argument { position = 0; length = 6 }; Tyname "string"]]

  (* [[Left_arrow; Product { position = 0; length = 2 };
                  Tyname "int"];
                 [Left_arrow; Product { position = 1; length = 2 };
                  Tyname "string"];
                 [Right_arrow; Tyname "list";
                  Argument { position = 0; length = 4 }; Tyname "int"]]int -> string -> float *)
                  [[Left_arrow; Tyname "int"];
                 [Right_arrow; Left_arrow; Tyname "string"];
                 [Right_arrow; Right_arrow; Tyname "float"]]


                 [[Left_arrow; Product { position = 0; length = 2 };
                  Tyname "int"];
                 [Left_arrow; Product { position = 1; length = 2 };
                  Tyname "string"];
                 [Right_arrow; Tyname "list";
                  Argument { position = 0; length = 4 }; Tyname "int"]]

                  *)
