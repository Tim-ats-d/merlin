type bleh
and b = Foo | Bar

type nonrec m = ()

type f = { foo : m * m; mutable bar : è }

and è = |

type exn += Foo
type (+'a, 'foo) m_list = < foo : ('a * 'foo) list >

type wrapper = Wrap : 'a -> wrapper

type 'x t = Foo of 'x constraint 'x = < x : 'a >
