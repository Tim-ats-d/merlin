  $ $MERLIN single refactoring-wrap-type-inside-mod -position 1:5 < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 1,
        "col": 0
      },
      "end": {
        "line": 2,
        "col": 17
      },
      "content": "module Bleh = struct type t
                       and b =
                         | Foo 
                         | Bar  end"
    },
    "notifications": []
  }

  $ $MERLIN single refactoring-wrap-type-inside-mod -position 2:8 < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 1,
        "col": 0
      },
      "end": {
        "line": 2,
        "col": 17
      },
      "content": "module Bleh = struct type t
                       and b =
                         | Foo 
                         | Bar  end"
    },
    "notifications": []
  }

  $ $MERLIN single refactoring-wrap-type-inside-mod -position 4:7 -filename test.mli < ./test.ml
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

  $ $MERLIN single refactoring-wrap-type-inside-mod -position 6:3 < ./test.ml
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
  $ $MERLIN single refactoring-wrap-type-inside-mod -position 10:4 < ./test.ml
  {
    "class": "error",
    "value": "Nothing to do",
    "notifications": []
  }

  $ $MERLIN single refactoring-wrap-type-inside-mod -position 11:10 < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 11,
        "col": 0
      },
      "end": {
        "line": 11,
        "col": 52
      },
      "content": "module M_list = struct type (+'a, 'foo) t = < foo: ('a * 'foo) list   >  end"
    },
    "notifications": []
  }

  $ $MERLIN single refactoring-wrap-type-inside-mod -position 13:6 -filename test.mli < ./test.ml
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

  $ $MERLIN single refactoring-wrap-type-inside-mod -position 15:2 < ./test.ml
  {
    "class": "return",
    "value": {
      "start": {
        "line": 15,
        "col": 0
      },
      "end": {
        "line": 15,
        "col": 48
      },
      "content": "module T = struct type 'x t =
                      | Foo of 'x  constraint 'x = < x: 'a   >  end"
    },
    "notifications": []
  }
