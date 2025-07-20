  $ $MERLIN single refactoring-extract-region -start 4:2 -end 4:18 < let.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 1,
        "col": 0
      },
      "end": {
        "line": 5,
        "col": 7
      },
      "content": "let z (x) (y) = x + y
  let f = 
    let x = 1 in 
    let y = 2 in 
    (z x y) + 1",
      "selection-range": {
        "start": {
          "line": 1,
          "col": 4
        },
        "end": {
          "line": 1,
          "col": 5
        }
      }
    },
    "notifications": []
  }
