  $ $MERLIN single refactoring-extract-region -start 5:4 -end 7:19 < func.ml
  {
    "class": "return",
    "value": [
      {
        "start": {
          "line": 5,
          "col": 4
        },
        "end": {
          "line": 7,
          "col": 19
        },
        "kind": "deletion"
      },
      {
        "start": {
          "line": 5,
          "col": 4
        },
        "end": {
          "line": 7,
          "col": 19
        },
        "kind": "addition",
        "content": "fun_name2"
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
        "content": "let fun_name2 =
    function | [] -> ((true)[@merlin.loc ]) | _ -> ((false)[@merlin.loc ])"
      },
      {
        "start": {
          "line": 9,
          "col": 0
        },
        "end": {
          "line": 9,
          "col": 0
        },
        "kind": "addition",
        "content": "
  
  let max l = List.fold_left (fun acc x -> if x > acc then x else acc) l
  
  let z = \"...\"
  
  let test x y =
    let w =
      let m = print_endline (x ^ y ^ z) in
      m
    in
    w
  
  let _ = assert false
  "
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
          "col": 27
        },
        "end": {
          "line": 10,
          "col": 68
        },
        "kind": "deletion"
      },
      {
        "start": {
          "line": 10,
          "col": 27
        },
        "end": {
          "line": 10,
          "col": 68
        },
        "kind": "addition",
        "content": "fun_name2"
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
        "content": "let fun_name2 acc x =
    if x > acc then (x) else (acc)"
      },
      {
        "start": {
          "line": 11,
          "col": 0
        },
        "end": {
          "line": 11,
          "col": 0
        },
        "kind": "addition",
        "content": "
  
  let z = \"...\"
  
  let test x y =
    let w =
      let m = print_endline (x ^ y ^ z) in
      m
    in
    w
  
  let _ = assert false
  "
      }
    ],
    "notifications": []
  }

  $ $MERLIN single refactoring-extract-region -start 16:12 -end 16:37 < func.ml
  {
    "class": "return",
    "value": [
      {
        "start": {
          "line": 16,
          "col": 12
        },
        "end": {
          "line": 16,
          "col": 37
        },
        "kind": "deletion"
      },
      {
        "start": {
          "line": 16,
          "col": 12
        },
        "end": {
          "line": 16,
          "col": 37
        },
        "kind": "addition",
        "content": "fun_name2"
      },
      {
        "start": {
          "line": 14,
          "col": 0
        },
        "end": {
          "line": 19,
          "col": 3
        },
        "kind": "addition",
        "content": "let fun_name2 (x) (y) = print_endline (x ^ (y ^ z))"
      },
      {
        "start": {
          "line": 20,
          "col": 0
        },
        "end": {
          "line": 20,
          "col": 0
        },
        "kind": "addition",
        "content": "
  
  let _ = assert false
  "
      }
    ],
    "notifications": []
  }
