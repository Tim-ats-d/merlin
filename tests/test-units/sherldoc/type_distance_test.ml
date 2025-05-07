open Merlin_sherlodoc

let expected_distance query entry expected =
  let open Alcotest in
  test_case
    ("distance between `" ^ query ^ "` and `" ^ entry ^ "`")
    `Quick
    (fun () ->
      let query = query |> Type_expr.from_string |> Option.get in
      let entry = entry |> Type_expr.from_string |> Option.get in
      let computed = Type_distance.compute ~query ~entry in
      check int
        ("a. distance should be " ^ string_of_int expected)
        expected computed
      (* ;
      check int
        ("b. distance should be " ^ string_of_int expected)
        computed expected *))

let cases =
  ( "type_distance",
    [ expected_distance "int" "int" 0;
      expected_distance "string" "string" 0;
      expected_distance "string -> int" "string -> int" 0;
      expected_distance "string -> int -> float" "string -> int -> float" 0;
      expected_distance "int -> srting -> float" "int -> string -> float" 2;
      expected_distance "('a -> 'b) -> 'a list -> 'b list"
        "('a -> 'b) -> 'a list -> 'b list" 0;
      expected_distance "('foo -> 'bar) -> 'foo list -> 'bar list"
        "('a -> 'b) -> 'a list -> 'b list" 0;
      expected_distance "'foo list -> ('foo -> 'bar) -> 'bar list"
        "('a -> 'b) -> 'a list -> 'b list" 0;
      expected_distance "foo -> bar -> baz" "int -> string" 1000;
      expected_distance "('a -> 'b) * 'a list -> 'b list"
        "('a -> 'b) -> 'a list -> 'b list" 3;
      expected_distance "'a * 'b -> 'b" "'a * 'b -> 'a" 1;
      expected_distance "'a * 'b -> 'a" "'a * 'b -> 'a" 0;
      expected_distance
        "'a -> 'b -> 'b -> 'a -> 'b -> 'c -> int -> string -> Bar.t -> 'b \
         option"
        "'foo -> 'bar -> 'bar -> 'foo -> 'bar -> 'baz -> foo -> Bar.t -> int \
         -> 'bar option"
        6;
      expected_distance "('a -> 'a) -> 'a list -> 'a list"
        "('a -> 'b) -> 'a list -> 'b list" 2;
      expected_distance "'a -> 'b option -> 'a option"
        "'b option -> 'a -> 'a option" 3;
      expected_distance "foo:'a -> bar:'b -> 'c" "foo:'a -> 'b -> 'c" 1;
      expected_distance "foo:a -> bar:b -> c" "a -> b -> c" 2;
      expected_distance "foo:'a -> 'b -> 'c" "boo:'a -> 'b -> 'c" 1;
      expected_distance "< foo : int > -> int" "< boo : int > -> string" 5;
      expected_distance "< foo : int > -> 'a" "< foo : int list > -> 'a" 2;
      expected_distance "foobar:int list -> string" "foobar:float -> string"
        1000;
      expected_distance "< foobar:int list ; ..> -> string"
        "foobar:int list -> string" 1;
      (* expected_distance "< foobar:int list ; bar : string list;  ..> -> string"
        "foobar:int list -> string" 10; *)
      expected_distance "[< `Foo of 'a] -> 'b" "'a -> [> `Bar of 'b]" 2;
      expected_distance "'b -> [< `Foo of 'a]" "'a -> [> `Bar of 'b]" 2;
      expected_distance "foo:'i -> bar:'love -> 'ocaml"
        "< foo : 'ocaml; bar : 'love; > -> 'i" 3;
      expected_distance
        "< hmmm :'a ; .. > -> [`brrr of 'b] -> [< `hmm of 'a ] -> < hehehe:'c; \
         > -> float"
        "[`hmmm of 'b ] -> brrr:'a -> < hmm : 'b > -> [`hehehe of 'c ] -> float"
        7;
      expected_distance
        "f:(int -> int64) -> on:(int -> int) -> int list -> int64 list"
        "< f : int -> int64; on : int -> int > -> int list -> int64 list" 6;
      expected_distance
        "f:(int -> int64) -> on:(int -> int) -> int list -> int64 list"
        "(int64 -> int) -> on:(int64 -> int64) -> int64 list -> int list" 14
    ] )

