let z = "z"

module M = struct
  type t
end

let test x y =
  let w =
    let m = print_endline (x ^ y ^ z) in
    m
  in
  w

let _ = assert false
