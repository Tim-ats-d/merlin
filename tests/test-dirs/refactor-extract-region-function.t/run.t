  $ $MERLIN single refactoring-extract-region-as-function -start 8:25 -end 8:33 < foo.ml
  {
    "class": "return",
    "value": [
      {
        "start": {
          "line": 8,
          "col": 25
        },
        "end": {
          "line": 8,
          "col": 32
        },
        "kind": "deletion"
      },
      {
        "start": {
          "line": 8,
          "col": 25
        },
        "end": {
          "line": 8,
          "col": 32
        },
        "kind": "addition",
        "content": "const_name1"
      },
      {
        "start": {
          "line": 8,
          "col": 0
        },
        "end": {
          "line": 8,
          "col": 50
        },
        "kind": "addition",
        "content": "let const_name1 = 3.14159"
      },
      {
        "start": {
          "line": 10,
          "col": 0
        },
        "end": {
          "line": 10,
          "col": 23
        },
        "kind": "deletion"
      },
      {
        "start": {
          "line": 11,
          "col": 23
        },
        "end": {
          "line": 11,
          "col": 23
        },
        "kind": "addition",
        "content": "let separator = \"testt\""
      }
    ],
    "notifications": []
  }

$ $MERLIN single refactoring-extract-region-as-function -start 12:6 -end 14:20 < foo.ml

$ $MERLIN single refactoring-extract-region-as-function -start 20:27 -end 20:70 < foo.ml

  $ $MERLIN single refactoring-extract-region-as-function -start 23:10 -end 23:35 < foo.ml

