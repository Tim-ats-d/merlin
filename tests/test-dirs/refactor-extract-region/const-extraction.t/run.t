  $ $MERLIN single refactoring-extract-region -start 3:25 -end 3:34 < const.ml
  {
    "class": "return",
    "value": [
      {
        "start": {
          "line": 3,
          "col": 25
        },
        "end": {
          "line": 3,
          "col": 32
        },
        "kind": "deletion"
      },
      {
        "start": {
          "line": 3,
          "col": 25
        },
        "end": {
          "line": 3,
          "col": 32
        },
        "kind": "addition",
        "content": "const_name2"
      },
      {
        "start": {
          "line": 3,
          "col": 0
        },
        "end": {
          "line": 3,
          "col": 50
        },
        "kind": "addition",
        "content": "let const_name2 = 3.14159"
      },
      {
        "start": {
          "line": 4,
          "col": 0
        },
        "end": {
          "line": 4,
          "col": 0
        },
        "kind": "addition",
        "content": "
  
  let read ?(chunk_size = 4096) ic =
    let buf = Bytes.create chunk_size in
    In_channel.input ic buf 0 (Bytes.length buf)
  
  (* My commentary *)
  let my_nested_long_int =
    let o =
      let c =
        let a =
          let m =
            let l = 1_000_000_000L in
            l
          in
          m
        in
        a
      in
      c
    in
    o
  
  let log ppf msg = Format.pp_print_string ppf (\"CRITICAL: \" ^ msg)
  
  module type EMPTY = sig end
  let f () : (module EMPTY) =
    (module struct
      let const_name2 = assert false
      let secret = String.make 100 '@'
    end)
  
  let g () =
    let multilines_cst = {foo|
  multi
  lines
  constant
  |foo} in
    print_endline multilines_cst
  "
      }
    ],
    "notifications": []
  }

  $ $MERLIN single refactoring-extract-region -start 15:18 -end 15:32 < const.ml
  {
    "class": "return",
    "value": [
      {
        "start": {
          "line": 15,
          "col": 18
        },
        "end": {
          "line": 15,
          "col": 32
        },
        "kind": "deletion"
      },
      {
        "start": {
          "line": 15,
          "col": 18
        },
        "end": {
          "line": 15,
          "col": 32
        },
        "kind": "addition",
        "content": "const_name2"
      },
      {
        "start": {
          "line": 10,
          "col": 0
        },
        "end": {
          "line": 24,
          "col": 3
        },
        "kind": "addition",
        "content": "let const_name2 = 1000000000L"
      },
      {
        "start": {
          "line": 25,
          "col": 0
        },
        "end": {
          "line": 25,
          "col": 0
        },
        "kind": "addition",
        "content": "
  
  let log ppf msg = Format.pp_print_string ppf (\"CRITICAL: \" ^ msg)
  
  module type EMPTY = sig end
  let f () : (module EMPTY) =
    (module struct
      let const_name2 = assert false
      let secret = String.make 100 '@'
    end)
  
  let g () =
    let multilines_cst = {foo|
  multi
  lines
  constant
  |foo} in
    print_endline multilines_cst
  "
      }
    ],
    "notifications": []
  }

  $ $MERLIN single refactoring-extract-region -start 5:24 -end 5:28 < const.ml
  {
    "class": "return",
    "value": [
      {
        "start": {
          "line": 5,
          "col": 24
        },
        "end": {
          "line": 5,
          "col": 28
        },
        "kind": "deletion"
      },
      {
        "start": {
          "line": 5,
          "col": 24
        },
        "end": {
          "line": 5,
          "col": 28
        },
        "kind": "addition",
        "content": "const_name2"
      },
      {
        "start": {
          "line": 5,
          "col": 0
        },
        "end": {
          "line": 7,
          "col": 46
        },
        "kind": "addition",
        "content": "let const_name2 = 4096"
      },
      {
        "start": {
          "line": 8,
          "col": 0
        },
        "end": {
          "line": 8,
          "col": 0
        },
        "kind": "addition",
        "content": "
  
  (* My commentary *)
  let my_nested_long_int =
    let o =
      let c =
        let a =
          let m =
            let l = 1_000_000_000L in
            l
          in
          m
        in
        a
      in
      c
    in
    o
  
  let log ppf msg = Format.pp_print_string ppf (\"CRITICAL: \" ^ msg)
  
  module type EMPTY = sig end
  let f () : (module EMPTY) =
    (module struct
      let const_name2 = assert false
      let secret = String.make 100 '@'
    end)
  
  let g () =
    let multilines_cst = {foo|
  multi
  lines
  constant
  |foo} in
    print_endline multilines_cst
  "
      }
    ],
    "notifications": []
  }

  $ $MERLIN single refactoring-extract-region -start 26:46 -end 26:58 < const.ml
  {
    "class": "return",
    "value": [
      {
        "start": {
          "line": 26,
          "col": 46
        },
        "end": {
          "line": 26,
          "col": 58
        },
        "kind": "deletion"
      },
      {
        "start": {
          "line": 26,
          "col": 46
        },
        "end": {
          "line": 26,
          "col": 58
        },
        "kind": "addition",
        "content": "const_name2"
      },
      {
        "start": {
          "line": 26,
          "col": 0
        },
        "end": {
          "line": 26,
          "col": 65
        },
        "kind": "addition",
        "content": "let const_name2 = \"CRITICAL: \""
      },
      {
        "start": {
          "line": 27,
          "col": 0
        },
        "end": {
          "line": 27,
          "col": 0
        },
        "kind": "addition",
        "content": "
  
  module type EMPTY = sig end
  let f () : (module EMPTY) =
    (module struct
      let const_name2 = assert false
      let secret = String.make 100 '@'
    end)
  
  let g () =
    let multilines_cst = {foo|
  multi
  lines
  constant
  |foo} in
    print_endline multilines_cst
  "
      }
    ],
    "notifications": []
  }

  $ $MERLIN single refactoring-extract-region -start 32:33 -end 32:36 < const.ml
  {
    "class": "return",
    "value": [
      {
        "start": {
          "line": 32,
          "col": 33
        },
        "end": {
          "line": 32,
          "col": 36
        },
        "kind": "deletion"
      },
      {
        "start": {
          "line": 32,
          "col": 33
        },
        "end": {
          "line": 32,
          "col": 36
        },
        "kind": "addition",
        "content": "const_name3"
      },
      {
        "start": {
          "line": 29,
          "col": 0
        },
        "end": {
          "line": 33,
          "col": 6
        },
        "kind": "addition",
        "content": "let const_name3 = '@'"
      },
      {
        "start": {
          "line": 34,
          "col": 0
        },
        "end": {
          "line": 34,
          "col": 0
        },
        "kind": "addition",
        "content": "
  
  let g () =
    let multilines_cst = {foo|
  multi
  lines
  constant
  |foo} in
    print_endline multilines_cst
  "
      }
    ],
    "notifications": []
  }

  $ $MERLIN single refactoring-extract-region -start 36:23 -end 40:5 < const.ml
  {
    "class": "return",
    "value": [
      {
        "start": {
          "line": 36,
          "col": 23
        },
        "end": {
          "line": 40,
          "col": 5
        },
        "kind": "deletion"
      },
      {
        "start": {
          "line": 36,
          "col": 23
        },
        "end": {
          "line": 40,
          "col": 5
        },
        "kind": "addition",
        "content": "const_name2"
      },
      {
        "start": {
          "line": 35,
          "col": 0
        },
        "end": {
          "line": 41,
          "col": 30
        },
        "kind": "addition",
        "content": "let const_name2 = {foo|
  multi
  lines
  constant
  |foo}"
      },
      {
        "start": {
          "line": 42,
          "col": 0
        },
        "end": {
          "line": 42,
          "col": 0
        },
        "kind": "addition",
        "content": "
  "
      }
    ],
    "notifications": []
  }
