module StructureItemBefore = struct end

let max l = List.fold_left (fun acc x -> if x > acc then x else acc) l

let z = "10"
