
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
    | SEMICOLON
    | RBRACKET
    | QUESTION_MARK
    | POLY of (
# 5 "src/sherlodoc/type_parser.mly"
      (string)
# 21 "src/sherlodoc/type_parser.ml"
  )
    | PARENS_OPEN
    | PARENS_CLOSE
    | OF
    | LESS
    | LBRACKET
    | GREATER
    | EOF
    | DOTDOT
    | COMMA
    | COLON
    | BAR
    | BACKQUOTE
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
  | MenhirState62
  | MenhirState57
  | MenhirState54
  | MenhirState50
  | MenhirState40
  | MenhirState30
  | MenhirState28
  | MenhirState24
  | MenhirState23
  | MenhirState21
  | MenhirState18
  | MenhirState12
  | MenhirState10
  | MenhirState9
  | MenhirState6
  | MenhirState2
  | MenhirState0

let rec _menhir_goto_list1_typ_COMMA_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Type_parsed.t list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (Type_parsed.t))), _, (xs : (Type_parsed.t list))) = _menhir_stack in
        let _2 = () in
        let _v : (Type_parsed.t list) = 
# 54 "src/sherlodoc/type_parser.mly"
                                               ( x::xs )
# 82 "src/sherlodoc/type_parser.ml"
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
# 48 "src/sherlodoc/type_parser.mly"
                                                  ( ts )
# 100 "src/sherlodoc/type_parser.ml"
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

and _menhir_goto_obj_method_list : _menhir_env -> 'ttv_tail -> _menhir_state -> ((string * Type_parsed.t) list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | GREATER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (ms : ((string * Type_parsed.t) list))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : ((string * Type_parsed.t) list) = 
# 59 "src/sherlodoc/type_parser.mly"
                                    ( ms )
# 131 "src/sherlodoc/type_parser.ml"
             in
            _menhir_goto_obj _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (string * Type_parsed.t))), _, (xs : ((string * Type_parsed.t) list))) = _menhir_stack in
        let _2 = () in
        let _v : ((string * Type_parsed.t) list) = 
# 66 "src/sherlodoc/type_parser.mly"
                                                ( x :: xs )
# 148 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_obj_method_list _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_BAR_poly_tag_ : _menhir_env -> 'ttv_tail -> _menhir_state -> ((string * Type_parsed.t option) list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : ((string * Type_parsed.t option) list)) = _v in
        let _v : ((string * Type_parsed.t option) list) = 
# 144 "<standard.mly>"
    ( x )
# 164 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_BAR_poly_tag__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : ((string * Type_parsed.t option) list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (string * Type_parsed.t option))) = _menhir_stack in
        let _2 = () in
        let _v : ((string * Type_parsed.t option) list) = 
# 243 "<standard.mly>"
    ( x :: xs )
# 176 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_separated_nonempty_list_BAR_poly_tag_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Type_parsed.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (a : (Type_parsed.t))), _, (b : (Type_parsed.t))) = _menhir_stack in
        let _2 = () in
        let _v : (Type_parsed.t) = 
# 18 "src/sherlodoc/type_parser.mly"
                       ( Type_parsed.Arrow { label = None; ty = (a, b) } )
# 194 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s), (constr : (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 203 "src/sherlodoc/type_parser.ml"
        ))), _, (t : (Type_parsed.t))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : (string * Type_parsed.t option) = 
# 82 "src/sherlodoc/type_parser.mly"
                                   ( (constr, Some t) )
# 210 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_poly_tag _menhir_env _menhir_stack _menhir_s _v
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (w : (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 219 "src/sherlodoc/type_parser.ml"
        ))), _, (t : (Type_parsed.t))) = _menhir_stack in
        let _2 = () in
        let _v : (string * Type_parsed.t) = 
# 69 "src/sherlodoc/type_parser.mly"
                       ( (w, t) )
# 225 "src/sherlodoc/type_parser.ml"
         in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | DOTDOT ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState50 in
                let _menhir_env = _menhir_discard _menhir_env in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, (x : (string * Type_parsed.t))) = _menhir_stack in
                let _3 = () in
                let _2 = () in
                let _v : ((string * Type_parsed.t) list) = 
# 65 "src/sherlodoc/type_parser.mly"
                                    ( [ x ] )
# 248 "src/sherlodoc/type_parser.ml"
                 in
                _menhir_goto_obj_method_list _menhir_env _menhir_stack _menhir_s _v
            | WORD _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
            | GREATER ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, (x : (string * Type_parsed.t))) = _menhir_stack in
                let _2 = () in
                let _v : ((string * Type_parsed.t) list) = 
# 64 "src/sherlodoc/type_parser.mly"
                             ( [ x ] )
# 260 "src/sherlodoc/type_parser.ml"
                 in
                _menhir_goto_obj_method_list _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50)
        | GREATER ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (x : (string * Type_parsed.t))) = _menhir_stack in
            let _v : ((string * Type_parsed.t) list) = 
# 64 "src/sherlodoc/type_parser.mly"
                             ( [ x ] )
# 273 "src/sherlodoc/type_parser.ml"
             in
            _menhir_goto_obj_method_list _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState54 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((((_menhir_stack, _menhir_s), (w : (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 288 "src/sherlodoc/type_parser.ml"
        ))), _, (a : (Type_parsed.t))), _, (b : (Type_parsed.t))) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : (Type_parsed.t) = 
# 20 "src/sherlodoc/type_parser.mly"
                                                  ( Type_parsed.Arrow { label = Some w; ty = (a, b) } )
# 296 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState57 | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LBRACKET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | LESS ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | PARENS_OPEN ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | POLY _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
            | QUESTION_MARK ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | WILDCARD ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | WORD _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
            | ARROW | COMMA | PARENS_CLOSE | STAR ->
                _menhir_reduce35 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57)
        | PARENS_CLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (x : (Type_parsed.t))) = _menhir_stack in
            let _v : (Type_parsed.t list) = 
# 53 "src/sherlodoc/type_parser.mly"
           ( [x] )
# 335 "src/sherlodoc/type_parser.ml"
             in
            _menhir_goto_list1_typ_COMMA_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (w : (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 350 "src/sherlodoc/type_parser.ml"
        ))), _, (a : (Type_parsed.t))), _, (b : (Type_parsed.t))) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : (Type_parsed.t) = 
# 20 "src/sherlodoc/type_parser.mly"
                                                  ( Type_parsed.Arrow { label = Some w; ty = (a, b) } )
# 357 "src/sherlodoc/type_parser.ml"
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
# 373 "src/sherlodoc/type_parser.ml"
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

and _menhir_goto_list_WORD_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (string list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (string list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 398 "src/sherlodoc/type_parser.ml"
        ))) = _menhir_stack in
        let _v : (string list) = 
# 213 "<standard.mly>"
    ( x :: xs )
# 403 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_list_WORD_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (ws : (string list)) = _v in
        let ((_menhir_stack, _menhir_s, (ts : (Type_parsed.t list))), (w : (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 413 "src/sherlodoc/type_parser.ml"
        ))) = _menhir_stack in
        let _v : (Type_parsed.t) = 
# 33 "src/sherlodoc/type_parser.mly"
    (
      List.fold_left (fun acc w ->
        Type_parsed.Tycon (w, [acc])) (Type_parsed.Tycon (w, ts)) ws
    )
# 421 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_typ1 _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_poly_tag : _menhir_env -> 'ttv_tail -> _menhir_state -> (string * Type_parsed.t option) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BACKQUOTE ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40)
    | RBRACKET ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (string * Type_parsed.t option))) = _menhir_stack in
        let _v : ((string * Type_parsed.t option) list) = 
# 241 "<standard.mly>"
    ( [ x ] )
# 451 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_separated_nonempty_list_BAR_poly_tag_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_typ2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (Type_parsed.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 | MenhirState62 | MenhirState57 | MenhirState6 | MenhirState54 | MenhirState12 | MenhirState28 | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LBRACKET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | LESS ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | PARENS_OPEN ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | POLY _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
            | QUESTION_MARK ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | WILDCARD ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | WORD _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
            | ARROW | BAR | COMMA | EOF | GREATER | PARENS_CLOSE | RBRACKET | SEMICOLON | STAR ->
                _menhir_reduce35 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28)
        | BAR | COMMA | EOF | GREATER | PARENS_CLOSE | RBRACKET | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (t : (Type_parsed.t))) = _menhir_stack in
            let _v : (Type_parsed.t) = 
# 17 "src/sherlodoc/type_parser.mly"
           ( t )
# 506 "src/sherlodoc/type_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
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
            | LBRACKET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | LESS ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | PARENS_OPEN ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | POLY _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
            | QUESTION_MARK ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | WILDCARD ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | WORD _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
            | ARROW | BAR | COMMA | EOF | GREATER | PARENS_CLOSE | RBRACKET | SEMICOLON | STAR ->
                _menhir_reduce35 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState54)
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
            | LBRACKET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | LESS ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | PARENS_OPEN ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | POLY _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | QUESTION_MARK ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | WILDCARD ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | WORD _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | ARROW | BAR | COMMA | EOF | GREATER | PARENS_CLOSE | RBRACKET | SEMICOLON | STAR ->
                _menhir_reduce35 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_reduce3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (string list) = 
# 211 "<standard.mly>"
    ( [] )
# 595 "src/sherlodoc/type_parser.ml"
     in
    _menhir_goto_list_WORD_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run24 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 602 "src/sherlodoc/type_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | WORD _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | ARROW | BAR | COMMA | EOF | GREATER | PARENS_CLOSE | RBRACKET | SEMICOLON | STAR ->
        _menhir_reduce3 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24

and _menhir_goto_loption_separated_nonempty_list_BAR_poly_tag__ : _menhir_env -> 'ttv_tail -> _menhir_state -> ((string * Type_parsed.t option) list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RBRACKET ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((((_menhir_stack, _menhir_s), (_2 : (unit option))), (_3 : (unit option))), _, (xs : ((string * Type_parsed.t option) list))) = _menhir_stack in
        let _5 = () in
        let _1 = () in
        let _v : (Type_parsed.t) = let ts = 
# 232 "<standard.mly>"
    ( xs )
# 635 "src/sherlodoc/type_parser.ml"
         in
        
# 73 "src/sherlodoc/type_parser.mly"
                                                                                   ( Type_parsed.Poly_variant ts )
# 640 "src/sherlodoc/type_parser.ml"
         in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (p : (Type_parsed.t)) = _v in
        let _v : (Type_parsed.t) = 
# 25 "src/sherlodoc/type_parser.mly"
                   ( p  )
# 648 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_typ2 _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
        | OF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LBRACKET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | LESS ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | PARENS_OPEN ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | POLY _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
            | QUESTION_MARK ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | WILDCARD ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | WORD _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
            | ARROW | BAR | RBRACKET | STAR ->
                _menhir_reduce35 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21)
        | BAR | RBRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), (constr : (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 700 "src/sherlodoc/type_parser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (string * Type_parsed.t option) = 
# 81 "src/sherlodoc/type_parser.mly"
                          ( (constr, None ) )
# 706 "src/sherlodoc/type_parser.ml"
             in
            _menhir_goto_poly_tag _menhir_env _menhir_stack _menhir_s _v
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

and _menhir_goto_list1_typ1_STAR_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Type_parsed.t list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Type_parsed.t list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (Type_parsed.t))) = _menhir_stack in
        let _2 = () in
        let _v : (Type_parsed.t list) = 
# 54 "src/sherlodoc/type_parser.mly"
                                               ( x::xs )
# 734 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_list1_typ1_STAR_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 | MenhirState2 | MenhirState62 | MenhirState6 | MenhirState57 | MenhirState9 | MenhirState54 | MenhirState12 | MenhirState21 | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Type_parsed.t list)) = _v in
        let _v : (Type_parsed.t) = 
# 24 "src/sherlodoc/type_parser.mly"
                         ( Type_parsed.tuple xs )
# 744 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_typ2 _menhir_env _menhir_stack _menhir_s _v
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
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | ARROW | BAR | COMMA | EOF | GREATER | PARENS_CLOSE | RBRACKET | SEMICOLON | STAR ->
            _menhir_reduce3 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23)
    | ARROW | BAR | COMMA | EOF | GREATER | PARENS_CLOSE | RBRACKET | SEMICOLON | STAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (ts : (Type_parsed.t list))) = _menhir_stack in
        let _v : (Type_parsed.t) = 
# 30 "src/sherlodoc/type_parser.mly"
            ( Type_parsed.tuple ts )
# 777 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_typ1 _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_option_BAR_ : _menhir_env -> 'ttv_tail -> (unit option) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BACKQUOTE ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | RBRACKET ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState18 in
        let _v : ((string * Type_parsed.t option) list) = 
# 142 "<standard.mly>"
    ( [] )
# 802 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_BAR_poly_tag__ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18

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
        | LESS ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | PARENS_OPEN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | POLY _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | WILDCARD ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | WORD _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | ARROW | BAR | COMMA | EOF | GREATER | PARENS_CLOSE | RBRACKET | SEMICOLON | STAR ->
            _menhir_reduce35 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30)
    | ARROW | BAR | COMMA | EOF | GREATER | PARENS_CLOSE | RBRACKET | SEMICOLON ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (Type_parsed.t))) = _menhir_stack in
        let _v : (Type_parsed.t list) = 
# 53 "src/sherlodoc/type_parser.mly"
           ( [x] )
# 844 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_list1_typ1_STAR_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_reduce34 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 857 "src/sherlodoc/type_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (w : (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 863 "src/sherlodoc/type_parser.ml"
    ))) = _menhir_stack in
    let _v : (Type_parsed.t) = 
# 42 "src/sherlodoc/type_parser.mly"
           ( Type_parsed.Tycon (w, []) )
# 868 "src/sherlodoc/type_parser.ml"
     in
    _menhir_goto_typ0 _menhir_env _menhir_stack _menhir_s _v

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 875 "src/sherlodoc/type_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack)

and _menhir_goto_typ0 : _menhir_env -> 'ttv_tail -> _menhir_state -> (Type_parsed.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (t : (Type_parsed.t)) = _v in
    let _v : (Type_parsed.t list) = 
# 47 "src/sherlodoc/type_parser.mly"
           ( [t] )
# 890 "src/sherlodoc/type_parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 897 "src/sherlodoc/type_parser.ml"
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
        | LBRACKET ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | LESS ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | PARENS_OPEN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | POLY _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | QUESTION_MARK ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | WILDCARD ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | WORD _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | ARROW | GREATER | SEMICOLON | STAR ->
            _menhir_reduce35 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_obj : _menhir_env -> 'ttv_tail -> _menhir_state -> ((string * Type_parsed.t) list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (o : ((string * Type_parsed.t) list)) = _v in
    let _v : (Type_parsed.t) = 
# 31 "src/sherlodoc/type_parser.mly"
          ( Type_parsed.Object o )
# 944 "src/sherlodoc/type_parser.ml"
     in
    _menhir_goto_typ1 _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_option_chevron_ : _menhir_env -> 'ttv_tail -> (unit option) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let x = () in
        let _v : (unit option) = 
# 116 "<standard.mly>"
    ( Some x )
# 963 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_option_BAR_ _menhir_env _menhir_stack _v
    | BACKQUOTE | RBRACKET ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _v : (unit option) = 
# 114 "<standard.mly>"
    ( None )
# 971 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_option_BAR_ _menhir_env _menhir_stack _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_chevron : _menhir_env -> 'ttv_tail -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (x : (unit)) = _v in
    let _v : (unit option) = 
# 116 "<standard.mly>"
    ( Some x )
# 989 "src/sherlodoc/type_parser.ml"
     in
    _menhir_goto_option_chevron_ _menhir_env _menhir_stack _v

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState54 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
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

and _menhir_reduce35 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Type_parsed.t) = 
# 29 "src/sherlodoc/type_parser.mly"
    ( Type_parsed.Wildcard )
# 1069 "src/sherlodoc/type_parser.ml"
     in
    _menhir_goto_typ1 _menhir_env _menhir_stack _menhir_s _v

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 4 "src/sherlodoc/type_parser.mly"
      (string)
# 1076 "src/sherlodoc/type_parser.ml"
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
        | LBRACKET ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | LESS ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | PARENS_OPEN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | POLY _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | WILDCARD ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | WORD _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | ARROW | STAR ->
            _menhir_reduce35 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2)
    | ARROW | BAR | COMMA | EOF | GREATER | PARENS_CLOSE | RBRACKET | SEMICOLON | STAR | WORD _ ->
        _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack)
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
# 40 "src/sherlodoc/type_parser.mly"
             ( Type_parsed.Wildcard )
# 1123 "src/sherlodoc/type_parser.ml"
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
            | LBRACKET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | LESS ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | PARENS_OPEN ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | POLY _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
            | WILDCARD ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | WORD _v ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
            | ARROW | STAR ->
                _menhir_reduce35 _menhir_env (Obj.magic _menhir_stack) MenhirState9
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
# 1178 "src/sherlodoc/type_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (w : (
# 5 "src/sherlodoc/type_parser.mly"
      (string)
# 1186 "src/sherlodoc/type_parser.ml"
    )) = _v in
    let _v : (Type_parsed.t) = 
# 41 "src/sherlodoc/type_parser.mly"
           ( Type_parsed.Tyvar w )
# 1191 "src/sherlodoc/type_parser.ml"
     in
    _menhir_goto_typ0 _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LBRACKET ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | LESS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState6
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
        _menhir_reduce35 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | GREATER ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState10 in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : ((string * Type_parsed.t) list) = 
# 58 "src/sherlodoc/type_parser.mly"
                 ( [] )
# 1239 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_obj _menhir_env _menhir_stack _menhir_s _v
    | WORD _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | GREATER ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _1 = () in
        let _v : (unit) = 
# 78 "src/sherlodoc/type_parser.mly"
         ( () )
# 1263 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_chevron _menhir_env _menhir_stack _v
    | LESS ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _1 = () in
        let _v : (unit) = 
# 78 "src/sherlodoc/type_parser.mly"
         ( () )
# 1274 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_chevron _menhir_env _menhir_stack _v
    | BACKQUOTE | BAR | RBRACKET ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _v : (unit option) = 
# 114 "<standard.mly>"
    ( None )
# 1282 "src/sherlodoc/type_parser.ml"
         in
        _menhir_goto_option_chevron_ _menhir_env _menhir_stack _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

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
    | LBRACKET ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LESS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState0
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
        _menhir_reduce35 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 269 "<standard.mly>"
  

# 1340 "src/sherlodoc/type_parser.ml"
