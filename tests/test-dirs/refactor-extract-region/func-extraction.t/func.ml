let fun_name1 () = ()

let all_empty l =
  List.for_all
    (function
      | [] -> true
      | _ -> false)
    l

let max l = List.fold_left (fun acc x -> if x > acc then x else acc) l

let z = "..."

let test x y =
  let fun_name2 = Fun.id in
  let m =
    let m = print_endline (x ^ y ^ z) in
    m
  in
  m

let _ = assert false
