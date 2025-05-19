let all_empty l =
  List.for_all
    (function
      | [] -> true
      | _ -> false)
    l
