  $ $MERLIN single refactoring-extract-region -start 5:4 -end 7:19 < func.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 3,
        "col": 0
      },
      "end": {
        "line": 8,
        "col": 5
      },
      "content": "let fun_name2 = function | [] -> true | _ -> false
  let all_empty l =
    List.for_all
      fun_name2
      l",
      "selection-range": {
        "start": {
          "line": 3,
          "col": 4
        },
        "end": {
          "line": 5,
          "col": 19
        }
      }
    },
    "notifications": []
  }

  $ $MERLIN single refactoring-extract-region -start 10:20 -end 10:70 < func.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 10,
        "col": 0
      },
      "end": {
        "line": 10,
        "col": 70
      },
      "content": "let fun_name2 (acc) (x) = if x > acc then x else acc
  let max l = List.fold_left fun_name2 l",
      "selection-range": {
        "start": {
          "line": 1,
          "col": 27
        },
        "end": {
          "line": 1,
          "col": 68
        }
      }
    },
    "notifications": []
  }

  $ $MERLIN single refactoring-extract-region -start 17:12 -end 17:37 < func.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 17,
        "col": 0
      },
      "end": {
        "line": 17,
        "col": 3
      },
      "content": "let fun_name3 (x) (y) = print_endline (x ^ (y ^ z))
  let test x y =
    let fun_name2 = Fun.id in
    let m =
      let m = fun_name3 in
      m
    in
    m",
      "selection-range": {
        "start": {
          "line": 4,
          "col": 12
        },
        "end": {
          "line": 4,
          "col": 37
        }
      }
    },
    "notifications": []
  }
