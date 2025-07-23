type bleh
and b = Foo of (module Set.S) | Bar of string

type nonrec m = ()

type f = { foo : m * m; mutable bar : è }

and è = |

type exn += Foo
type (+'a, 'foo) m_list = < foo : ('a * 'foo) list ; error : bool >

type wrapper = Wrap : 'a -> wrapper

type 'x t = Foo of 'x constraint 'x = < x : 'a ; y : 'a list >

type foo = b

module Outer = struct
  module Inner = struct
    module Record = struct
      type t = { foo : int; bar : int }
    end
  end
end

module Foo = struct
  type ('a, 'b, _) result3 = ('a, 'b) Result.t
end

module Module = struct
  module Foo = struct
    type ('a, 'b) t = { a : 'a; b : 'b }
  end
end

type ('a, 'b) _mehhh = ('a, 'b) Module.Foo.t = { a : 'a; b : 'b }

type abc = [ `foo | `bar | `foobar ] [@@deriving sexp]

module X : sig
  type foo
  and bar
end = struct
  type foo = A''''''
  and bar = foo
end

module Make () = struct
  type coord = { lat : float; long : float }
end

module type NUM = sig
  type int
end

type entry = { label : label; content : content }

and content = Plain_text of string | Markdown of string
and label = string
and double_entry = entry * entry
