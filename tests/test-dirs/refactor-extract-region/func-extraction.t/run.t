  $ $MERLIN single refactoring-extract-region -start 5:4 -end 7:19 < func.ml
  {
    "class": "return",
    "value": [
      {
        "start": {
          "line": 3,
          "col": 0
        },
        "end": {
          "line": 8,
          "col": 5
        },
        "kind": "deletion"
      },
      {
        "start": {
          "line": 3,
          "col": 0
        },
        "end": {
          "line": 8,
          "col": 5
        },
        "kind": "addition",
        "content": "let fun_name2 = function | [] -> true | _ -> false
  let all_empty l =
    List.for_all
      fun_name2
      l"
      }
    ],
    "notifications": []
  }

  $ $MERLIN single refactoring-extract-region -start 10:20 -end 10:70 < func.ml
  {
    "class": "return",
    "value": [
      {
        "start": {
          "line": 10,
          "col": 0
        },
        "end": {
          "line": 10,
          "col": 70
        },
        "kind": "deletion"
      },
      {
        "start": {
          "line": 10,
          "col": 0
        },
        "end": {
          "line": 10,
          "col": 70
        },
        "kind": "addition",
        "content": "let fun_name2 acc x = if x > acc then x else acc
  let max l = List.fold_left fun_name2 l"
      }
    ],
    "notifications": []
  }

  $ $MERLIN single refactoring-extract-region -start 17:12 -end 17:37 < func.ml
  {
    "class": "return",
    "value": [
      {
        "start": {
          "line": 14,
          "col": 0
        },
        "end": {
          "line": 20,
          "col": 3
        },
        "kind": "deletion"
      },
      {
        "start": {
          "line": 14,
          "col": 0
        },
        "end": {
          "line": 20,
          "col": 3
        },
        "kind": "addition",
        "content": "let fun_name3 x y = print_endline (x ^ (y ^ z))
  let test x y =
    let fun_name2 = Fun.id in
    let m =
      let m = fun_name3 x y in
      m
    in
    m"
      }
    ],
    "notifications": []
  }
