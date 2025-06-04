  $ $MERLIN single refactoring-extract-region -start 3:25 -end 3:34 < const.ml
  {
    "class": "return",
    "value": [
      {
        "start": {
          "line": 3,
          "col": 0
        },
        "end": {
          "line": 3,
          "col": 50
        },
        "kind": "deletion"
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
        "content": "let const_name2 = 3.14159
  let circle_area radius = const_name2 *. (radius ** 2.)"
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
          "col": 0
        },
        "end": {
          "line": 7,
          "col": 46
        },
        "kind": "deletion"
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
        "content": "let const_name2 = 4096
  let read ?(chunk_size = const_name2) ic =
    let buf = Bytes.create chunk_size in
    In_channel.input ic buf 0 (Bytes.length buf)"
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
          "line": 10,
          "col": 0
        },
        "end": {
          "line": 24,
          "col": 3
        },
        "kind": "deletion"
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
        "content": "let const_name2 = 1000000000L
  let my_nested_long_int =
    let o =
      let c =
        let a =
          let m =
            let l = const_name2 in
            l
          in
          m
        in
        a
      in
      c
    in
    o"
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
          "col": 0
        },
        "end": {
          "line": 26,
          "col": 65
        },
        "kind": "deletion"
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
        "content": "let const_name2 = \"CRITICAL: \"
  let log ppf msg = Format.pp_print_string ppf (const_name2 ^ msg)"
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
          "line": 29,
          "col": 0
        },
        "end": {
          "line": 33,
          "col": 6
        },
        "kind": "deletion"
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
        "content": "let const_name3 = '@'
  let f () : (module EMPTY) =
    (module struct
      let const_name2 = assert false
      let secret = String.make 100 const_name3
    end)"
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
          "line": 35,
          "col": 0
        },
        "end": {
          "line": 41,
          "col": 30
        },
        "kind": "deletion"
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
  |foo}
  let g () =
    let multilines_cst = const_name2 in
    print_endline multilines_cst"
      }
    ],
    "notifications": []
  }
