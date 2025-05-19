let all_empty l =
  List.for_all
    (function
      | [] -> true
      | _ -> false)
    l

let circle_area radius = 3.14159 *. (radius ** 2.)

let separator = "testt"

let f x =
  print_endline x;
  1 :: [ 2; 3; 4 ]

module M = struct
  type t
end

let max l = List.fold_left (fun acc x -> if x > acc then x else acc) l

let test x y z =
  let w = print_endline (x ^ y ^ z) in
  w
