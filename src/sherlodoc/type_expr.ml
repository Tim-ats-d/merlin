(* {{{ COPYING *(

     This file is part of Merlin, an helper for ocaml editors

     Copyright (C) 2013 - 2024  Xavier Van de Woestyne <xaviervdw(_)gmail.com>
                                Arthur Wendling <arthur(_)tarides.com>


     Permission is hereby granted, free of charge, to any person obtaining a
     copy of this software and associated documentation files (the "Software"),
     to deal in the Software without restriction, including without limitation the
     rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
     sell copies of the Software, and to permit persons to whom the Software is
     furnished to do so, subject to the following conditions:

     The above copyright notice and this permission notice shall be included in
     all copies or substantial portions of the Software.

     The Software is provided "as is", without warranty of any kind, express or
     implied, including but not limited to the warranties of merchantability,
     fitness for a particular purpose and noninfringement. In no event shall
     the authors or copyright holders be liable for any claim, damages or other
     liability, whether in an action of contract, tort or otherwise, arising
     from, out of or in connection with the software or the use or other dealings
     in the Software.

   )* }}} *)

type t =
  | Arrow of { label : string option; ty : t * t }
  | Tycon of string * t list
  | Tuple of t list
  | Object of (string * t) list
  | Poly_variant of (string * t option) list
  | Tyvar of int
  | Wildcard
  | Unhandled

let rec equal a b =
  match (a, b) with
  | Unhandled, Unhandled | Wildcard, Wildcard -> true
  | Tyvar a, Tyvar b -> Int.equal a b
  | Poly_variant a, Poly_variant b ->
    List.equal
      (fun (method_name, typ) (method_name', typ') ->
        String.equal method_name method_name' && Option.equal equal typ typ')
      a b
  | Object a, Object b ->
    List.equal
      (fun (method_name, typ) (method_name', typ') ->
        String.equal method_name method_name' && equal typ typ')
      a b
  | Tuple a, Tuple b -> List.equal equal a b
  | Tycon (ka, a), Tycon (kb, b) -> String.equal ka kb && List.equal equal a b
  | Arrow { label = il; ty = ia, oa }, Arrow { label = ol; ty = ib, ob } ->
    Option.equal String.equal il ol && equal ia ib && equal oa ob
  | Arrow _, _
  | Tycon (_, _), _
  | Tuple _, _
  | Poly_variant _, _
  | Object _, _
  | Tyvar _, _
  | Wildcard, _
  | Unhandled, _ -> false

let parens x = "(" ^ x ^ ")"

let tyvar_to_string x =
  let rec aux acc i =
    let c = Char.code 'a' + (i mod 26) |> Char.chr in
    let acc = acc ^ String.make 1 c in
    if i < 26 then acc else aux acc (i - 26)
  in
  aux "'" x

let unhandled = "?"

let rec to_string = function
  | Unhandled -> unhandled
  | Wildcard -> "_"
  | Tyvar i -> tyvar_to_string i
  | Tycon (constr, []) -> constr
  | Tycon (constr, [ x ]) -> with_parens x ^ " " ^ constr
  | Tycon (constr, xs) -> (xs |> as_list "" |> parens) ^ " " ^ constr
  | Tuple xs -> as_tuple "" xs
  | Poly_variant cs -> "[ " ^ as_poylvar "" cs ^ " ]"
  | Object [] -> "< >"
  | Object methods -> "< " ^ as_object "" methods ^ " >"
  | Arrow { label = None; ty = a, b } -> with_parens a ^ " -> " ^ to_string b
  | Arrow { label = Some label; ty = a, b } ->
    label ^ ":" ^ with_parens a ^ " -> " ^ to_string b

and with_parens = function
  | (Arrow _ | Tuple _) as t -> t |> to_string |> parens
  | t -> to_string t

and as_list acc = function
  | [] -> acc ^ unhandled
  | [ x ] -> acc ^ to_string x
  | x :: xs ->
    let acc = acc ^ to_string x ^ ", " in
    as_list acc xs

and as_tuple acc = function
  | [] -> acc ^ unhandled
  | [ x ] -> acc ^ with_parens x
  | x :: xs ->
    let acc = acc ^ with_parens x ^ " * " in
    as_tuple acc xs

and as_object acc =
  let fmt_method (name, typ) = name ^ " : " ^ to_string typ in
  function
  | [] -> acc
  | [ meth ] -> acc ^ fmt_method meth
  | meth :: xs ->
    let acc = acc ^ fmt_method meth ^ "; " in
    as_object acc xs

and as_poylvar acc =
  let fmt_constr (name, typ_opt) =
    "`" ^ name
    ^ Option.fold typ_opt ~none:"" ~some:(fun typ -> " of " ^ to_string typ)
  in
  function
  | [] -> acc
  | [ constr ] -> acc ^ fmt_constr constr
  | constr :: xs ->
    let acc = acc ^ fmt_constr constr ^ " | " in
    as_poylvar acc xs

module SMap = Map.Make (String)

let map_with_state f i map list =
  let i, map, r =
    list
    |> List.fold_left
         (fun (i, map, acc) x ->
           let i, map, elt = f i map x in
           (i, map, elt :: acc))
         (i, map, [])
  in
  (i, map, List.rev r)

let map_snd_pair_with_state f i map list =
  map_with_state
    (fun i map (x, y) ->
      let i, map, elt = f i map y in
      (i, map, (x, elt)))
    i map list

let map_snd_pair_opt_with_state f i map list =
  map_snd_pair_with_state
    (fun i map -> function
      | None -> (i, map, None)
      | Some y ->
        let i, map, elt = f i map y in
        (i, map, Some elt))
    i map list

let normalize_type_parameters ty =
  let rec aux i map = function
    | Type_parsed.Unhandled -> (i, map, Unhandled)
    | Type_parsed.Wildcard -> (i, map, Wildcard)
    | Type_parsed.Arrow { label; ty = a, b } ->
      let i, map, a = aux i map a in
      let i, map, b = aux i map b in
      (i, map, Arrow { label; ty = (a, b) })
    | Type_parsed.Tycon (s, r) ->
      let i, map, r = map_with_state aux i map r in
      (i, map, Tycon (s, r))
    | Type_parsed.Poly_variant cs ->
      let i, map, ms = map_snd_pair_opt_with_state aux i map cs in
      (i, map, Poly_variant ms)
    | Type_parsed.Tuple r ->
      let i, map, r = map_with_state aux i map r in
      (i, map, Tuple r)
    | Type_parsed.Object ms ->
      let i, map, ms = map_snd_pair_with_state aux i map ms in
      (i, map, Object ms)
    | Type_parsed.Tyvar var ->
      let i, map, value =
        match SMap.find_opt var map with
        | Some value -> (i, map, value)
        | None ->
          let i = succ i in
          let map = SMap.add var i map in
          (i, map, i)
      in
      (i, map, Tyvar value)
  in
  let _, _, normalized = aux ~-1 SMap.empty ty in
  normalized

let from_string str =
  try
    str |> Lexing.from_string
    |> Type_parser.main Type_lexer.token
    |> normalize_type_parameters |> Option.some
  with _ -> None
