
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | WORD of (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 11 "src/sherlodoc/type_parser.ml"
  )
    | WILDCARD
    | STAR
    | QUESTION_MARK
    | POLY of (
# 5 "src/sherlodoc/type_parser.mly"
      (string)
# 19 "src/sherlodoc/type_parser.ml"
  )
    | PARENS_OPEN
    | PARENS_CLOSE
    | EOF
    | COMMA
    | COLON
    | ARROW
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState32
  | MenhirState27
  | MenhirState20
  | MenhirState18
  | MenhirState16
  | MenhirState12
  | MenhirState11
  | MenhirState9
  | MenhirState6
  | MenhirState2
  | MenhirState0

let rec _menhir_goto_list1_typ_COMMA_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Type_parsed.t list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (Type_parsed.t))), _, (xs : (Type_parsed.t list))) = _menhir_stack in
        let _2 = () in
        let _v : (Type_parsed.t list) = 
# 52 "src/sherlodoc/type_parser.mly"
                                               ( x::xs )
# 67 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_list1_typ_COMMA_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PARENS_CLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (ts : (Type_parsed.t list))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Type_parsed.t list) = 
# 46 "src/sherlodoc/type_parser.mly"
                                                  ( ts )
# 85 "src/sherlodoc/type_parser.ml"
             in
            _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_list_WORD_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (string list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (string list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 107 "src/sherlodoc/type_parser.ml"
        ))) = _menhir_stack in
        let _v : (string list) = 
# 213 "<standard.mly>"
    ( x :: xs )
# 112 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_list_WORD_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (ws : (string list)) = _v in
        let ((_menhir_stack, _menhir_s, (ts : (Type_parsed.t list))), (w : (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 122 "src/sherlodoc/type_parser.ml"
        ))) = _menhir_stack in
        let _v : (Type_parsed.t) = 
# 31 "src/sherlodoc/type_parser.mly"
    (
      List.fold_left ( fun acc w ->
	  Type_parsed.Tycon (w, [acc])) (Type_parsed.Tycon (w, ts)) ws
    )
# 130 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_typ1 _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Type_parsed.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (a : (Type_parsed.t))), _, (b : (Type_parsed.t))) = _menhir_stack in
        let _2 = () in
        let _v : (Type_parsed.t) = 
# 18 "src/sherlodoc/type_parser.mly"
                       ( Type_parsed.Arrow { label = None; ty = (a, b) } )
# 153 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((((_menhir_stack, _menhir_s), (w : (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 162 "src/sherlodoc/type_parser.ml"
        ))), _, (a : (Type_parsed.t))), _, (b : (Type_parsed.t))) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : (Type_parsed.t) = 
# 20 "src/sherlodoc/type_parser.mly"
                                                  ( Type_parsed.Arrow { label = Some w; ty = (a, b) } )
# 170 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState27 | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | PARENS_OPEN ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | POLY _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
            | QUESTION_MARK ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | WILDCARD ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | WORD _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
            | ARROW | COMMA | PARENS_CLOSE | STAR ->
                _menhir_reduce15 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27)
        | PARENS_CLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (x : (Type_parsed.t))) = _menhir_stack in
            let _v : (Type_parsed.t list) = 
# 51 "src/sherlodoc/type_parser.mly"
           ( [x] )
# 205 "src/sherlodoc/type_parser.ml"
             in
            _menhir_goto_list1_typ_COMMA_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (w : (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 220 "src/sherlodoc/type_parser.ml"
        ))), _, (a : (Type_parsed.t))), _, (b : (Type_parsed.t))) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : (Type_parsed.t) = 
# 20 "src/sherlodoc/type_parser.mly"
                                                  ( Type_parsed.Arrow { label = Some w; ty = (a, b) } )
# 227 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (t : (Type_parsed.t))) = _menhir_stack in
            let _2 = () in
            let _v : (Type_parsed.t) = 
# 13 "src/sherlodoc/type_parser.mly"
              ( t )
# 243 "src/sherlodoc/type_parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (Type_parsed.t)) = _v in
            Obj.magic _1
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_reduce1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (string list) = 
# 211 "<standard.mly>"
    ( [] )
# 263 "src/sherlodoc/type_parser.ml"
     in
    _menhir_goto_list_WORD_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 270 "src/sherlodoc/type_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | WORD _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | ARROW | COMMA | EOF | PARENS_CLOSE | STAR ->
        _menhir_reduce1 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12

and _menhir_goto_list1_typ1_STAR_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Type_parsed.t list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Type_parsed.t list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (Type_parsed.t))) = _menhir_stack in
        let _2 = () in
        let _v : (Type_parsed.t list) = 
# 52 "src/sherlodoc/type_parser.mly"
                                               ( x::xs )
# 298 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_list1_typ1_STAR_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 | MenhirState2 | MenhirState32 | MenhirState6 | MenhirState27 | MenhirState9 | MenhirState16 | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Type_parsed.t list)) = _v in
        let _v : (Type_parsed.t) = 
# 24 "src/sherlodoc/type_parser.mly"
                         ( Type_parsed.tuple xs )
# 308 "src/sherlodoc/type_parser.ml"
         in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        (match _menhir_s with
        | MenhirState9 ->
            let _menhir_stack = Obj.magic _menhir_stack in
            assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ARROW ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | PARENS_OPEN ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState16
                | POLY _v ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
                | QUESTION_MARK ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState16
                | WILDCARD ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState16
                | WORD _v ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
                | ARROW | COMMA | EOF | PARENS_CLOSE | STAR ->
                    _menhir_reduce15 _menhir_env (Obj.magic _menhir_stack) MenhirState16
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | MenhirState0 | MenhirState32 | MenhirState27 | MenhirState6 | MenhirState18 | MenhirState16 ->
            let _menhir_stack = Obj.magic _menhir_stack in
            assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ARROW ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | PARENS_OPEN ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState18
                | POLY _v ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
                | QUESTION_MARK ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState18
                | WILDCARD ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState18
                | WORD _v ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
                | ARROW | COMMA | EOF | PARENS_CLOSE | STAR ->
                    _menhir_reduce15 _menhir_env (Obj.magic _menhir_stack) MenhirState18
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18)
            | COMMA | EOF | PARENS_CLOSE ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, (t : (Type_parsed.t))) = _menhir_stack in
                let _v : (Type_parsed.t) = 
# 17 "src/sherlodoc/type_parser.mly"
           ( t )
# 376 "src/sherlodoc/type_parser.ml"
                 in
                _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | MenhirState2 ->
            let _menhir_stack = Obj.magic _menhir_stack in
            assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ARROW ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | PARENS_OPEN ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                | POLY _v ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
                | QUESTION_MARK ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                | WILDCARD ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                | WORD _v ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
                | ARROW | COMMA | EOF | PARENS_CLOSE | STAR ->
                    _menhir_reduce15 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            _menhir_fail ())
    | _ ->
        _menhir_fail ()

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> (Type_parsed.t list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | WORD _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | WORD _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | ARROW | COMMA | EOF | PARENS_CLOSE | STAR ->
            _menhir_reduce1 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11)
    | ARROW | COMMA | EOF | PARENS_CLOSE | STAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (ts : (Type_parsed.t list))) = _menhir_stack in
        let _v : (Type_parsed.t) = 
# 29 "src/sherlodoc/type_parser.mly"
            ( Type_parsed.tuple ts )
# 449 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_typ1 _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_typ1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (Type_parsed.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | STAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PARENS_OPEN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | POLY _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | WILDCARD ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | WORD _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | ARROW | COMMA | EOF | PARENS_CLOSE | STAR ->
            _menhir_reduce15 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20)
    | ARROW | COMMA | EOF | PARENS_CLOSE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (Type_parsed.t))) = _menhir_stack in
        let _v : (Type_parsed.t list) = 
# 51 "src/sherlodoc/type_parser.mly"
           ( [x] )
# 491 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_list1_typ1_STAR_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_reduce14 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 504 "src/sherlodoc/type_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (w : (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 510 "src/sherlodoc/type_parser.ml"
    ))) = _menhir_stack in
    let _v : (Type_parsed.t) = 
# 40 "src/sherlodoc/type_parser.mly"
           ( Type_parsed.Tycon (w, []) )
# 515 "src/sherlodoc/type_parser.ml"
     in
    _menhir_goto_typ0 _menhir_env _menhir_stack _menhir_s _v

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 522 "src/sherlodoc/type_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce14 _menhir_env (Obj.magic _menhir_stack)

and _menhir_goto_typ0 : _menhir_env -> 'ttv_tail -> _menhir_state -> (Type_parsed.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (t : (Type_parsed.t)) = _v in
    let _v : (Type_parsed.t list) = 
# 45 "src/sherlodoc/type_parser.mly"
           ( [t] )
# 537 "src/sherlodoc/type_parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_reduce15 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Type_parsed.t) = 
# 28 "src/sherlodoc/type_parser.mly"
    ( Type_parsed.Wildcard )
# 593 "src/sherlodoc/type_parser.ml"
     in
    _menhir_goto_typ1 _menhir_env _menhir_stack _menhir_s _v

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 600 "src/sherlodoc/type_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COLON ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PARENS_OPEN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | POLY _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | WILDCARD ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | WORD _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | ARROW | STAR ->
            _menhir_reduce15 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2)
    | ARROW | COMMA | EOF | PARENS_CLOSE | STAR | WORD _ ->
        _menhir_reduce14 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Type_parsed.t) = 
# 38 "src/sherlodoc/type_parser.mly"
             ( Type_parsed.Wildcard )
# 643 "src/sherlodoc/type_parser.ml"
     in
    _menhir_goto_typ0 _menhir_env _menhir_stack _menhir_s _v

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | WORD _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | PARENS_OPEN ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | POLY _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
            | WILDCARD ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | WORD _v ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
            | ARROW | STAR ->
                _menhir_reduce15 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 5 "src/sherlodoc/type_parser.mly"
      (string)
# 694 "src/sherlodoc/type_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (w : (
# 5 "src/sherlodoc/type_parser.mly"
      (string)
# 702 "src/sherlodoc/type_parser.ml"
    )) = _v in
    let _v : (Type_parsed.t) = 
# 39 "src/sherlodoc/type_parser.mly"
           ( Type_parsed.Tyvar w )
# 707 "src/sherlodoc/type_parser.ml"
     in
    _menhir_goto_typ0 _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | PARENS_OPEN ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | POLY _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | QUESTION_MARK ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | WILDCARD ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | WORD _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | ARROW | COMMA | PARENS_CLOSE | STAR ->
        _menhir_reduce15 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and main : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Type_parsed.t) =
  fun lexer lexbuf ->
    let _menhir_env = {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = Obj.magic ();
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | PARENS_OPEN ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | POLY _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | QUESTION_MARK ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | WILDCARD ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | WORD _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | ARROW | EOF | STAR ->
        _menhir_reduce15 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 269 "<standard.mly>"
  

# 778 "src/sherlodoc/type_parser.ml"
