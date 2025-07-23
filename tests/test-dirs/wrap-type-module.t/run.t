  $ $MERLIN single refactor-wrap-type-inside-mod -position 1:5 < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 1,
        "col": 0
      },
      "end": {
        "line": 2,
        "col": 45
      },
      "content": "module Bleh =
    struct type t
           and b =
             | Foo of (module Set.S) 
             | Bar of string  end"
    },
    "notifications": []
  }

  $ $MERLIN single refactor-wrap-type-inside-mod -position 2:8 < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 1,
        "col": 0
      },
      "end": {
        "line": 2,
        "col": 45
      },
      "content": "module Bleh =
    struct type t
           and b =
             | Foo of (module Set.S) 
             | Bar of string  end"
    },
    "notifications": []
  }

  $ $MERLIN single refactor-wrap-type-inside-mod -position 4:7 -filename test.mli < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 4,
        "col": 0
      },
      "end": {
        "line": 4,
        "col": 18
      },
      "content": "module M : sig type nonrec t =
                   | ()  end"
    },
    "notifications": []
  }

  $ $MERLIN single refactor-wrap-type-inside-mod -position 6:3 < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 6,
        "col": 0
      },
      "end": {
        "line": 8,
        "col": 10
      },
      "content": "module F = struct type t = {
                      foo: (m * m) ;
                      mutable bar: è }
                    and è = | end"
    },
    "notifications": []
  }

It doesn't make sense to wrap an extensible type into a module.
  $ $MERLIN single refactor-wrap-type-inside-mod -position 10:4 < ./test.ml
  {
    "class": "error",
    "value": "Nothing to do",
    "notifications": []
  }

  $ $MERLIN single refactor-wrap-type-inside-mod -position 11:10 < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 11,
        "col": 0
      },
      "end": {
        "line": 11,
        "col": 67
      },
      "content": "module M_list =
    struct type (+'a, 'foo) t = < foo: ('a * 'foo) list  ;error: bool   >  end"
    },
    "notifications": []
  }

  $ $MERLIN single refactor-wrap-type-inside-mod -position 13:6 -filename test.mli < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 13,
        "col": 0
      },
      "end": {
        "line": 13,
        "col": 35
      },
      "content": "module Wrapper : sig type t =
                         | Wrap: 'a -> wrapper  end"
    },
    "notifications": []
  }

  $ $MERLIN single refactor-wrap-type-inside-mod -position 15:2 < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 15,
        "col": 0
      },
      "end": {
        "line": 15,
        "col": 62
      },
      "content": "module T =
    struct
      type 'x t =
        | Foo of 'x  constraint 'x = < x: 'a  ;y: 'a list   > 
    end"
    },
    "notifications": []
  }

  $ $MERLIN single refactor-wrap-type-inside-mod -position 17:1 -filename test.mli < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 17,
        "col": 0
      },
      "end": {
        "line": 17,
        "col": 12
      },
      "content": "module Foo : sig type t = b end"
    },
    "notifications": []
  }

  $ $MERLIN single refactor-wrap-type-inside-mod -position 22:15 < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 22,
        "col": 6
      },
      "end": {
        "line": 22,
        "col": 39
      },
      "content": "module T = struct type t = {
                      foo: int ;
                      bar: int } end"
    },
    "notifications": []
  }

  $ $MERLIN single refactor-wrap-type-inside-mod -position 28:16 < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 28,
        "col": 2
      },
      "end": {
        "line": 28,
        "col": 46
      },
      "content": "module Result3 = struct type ('a, 'b, _) t = ('a, 'b) Result.t end"
    },
    "notifications": []
  }

  $ $MERLIN single refactor-wrap-type-inside-mod -position 37:20 < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 37,
        "col": 0
      },
      "end": {
        "line": 37,
        "col": 65
      },
      "content": "module _mehhh =
    struct type ('a, 'b) t = ('a, 'b) Module.Foo.t = {
             a: 'a ;
             b: 'b } end"
    },
    "notifications": []
  }

  $ $MERLIN single refactor-wrap-type-inside-mod -position 39:49 < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 39,
        "col": 0
      },
      "end": {
        "line": 39,
        "col": 54
      },
      "content": "module Abc = struct type t = [ `foo  | `bar  | `foobar ][@@deriving sexp] end"
    },
    "notifications": []
  }

  $ $MERLIN single refactor-wrap-type-inside-mod -position 43:9 < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 42,
        "col": 2
      },
      "end": {
        "line": 43,
        "col": 9
      },
      "content": "module Foo : sig type t
                   and bar end"
    },
    "notifications": []
  }

  $ $MERLIN single refactor-wrap-type-inside-mod -position 45:10 < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 45,
        "col": 2
      },
      "end": {
        "line": 46,
        "col": 15
      },
      "content": "module Foo = struct type t =
                        | A'''''' 
                      and bar = foo end"
    },
    "notifications": []
  }

  $ $MERLIN single refactor-wrap-type-inside-mod -position 50:8 < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 50,
        "col": 2
      },
      "end": {
        "line": 50,
        "col": 44
      },
      "content": "module Coord = struct type t = {
                          lat: float ;
                          long: float } end"
    },
    "notifications": []
  }

  $ $MERLIN single refactor-wrap-type-inside-mod -position 54:5 < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 54,
        "col": 2
      },
      "end": {
        "line": 54,
        "col": 10
      },
      "content": "module Int : sig type t end"
    },
    "notifications": []
  }

  $ $MERLIN single refactor-wrap-type-inside-mod -position 58:10 < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 57,
        "col": 0
      },
      "end": {
        "line": 61,
        "col": 32
      },
      "content": "module Entry =
    struct
      type t = {
        label: label ;
        content: content }
      and content =
        | Plain_text of string 
        | Markdown of string 
      and label = string
      and double_entry = (t * t)
    end"
    },
    "notifications": []
  }
