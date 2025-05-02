
(* The type of tokens. *)

type token = 
  | WORD of (string)
  | WILDCARD
  | STAR
  | SEMICOLON
  | RBRACKET
  | QUESTION_MARK
  | POLY of (string)
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

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Type_parsed.t)
