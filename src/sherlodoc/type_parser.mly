%token EOF
%token PARENS_OPEN PARENS_CLOSE
%token ARROW COMMA WILDCARD STAR COLON QUESTION_MARK GREATER LESS SEMICOLON DOTDOT LBRACKET RBRACKET BAR BACKQUOTE OF
%token<string> WORD
%token<string> POLY

%start main
%type<Type_parsed.t> main

%%

main:
  | t=typ EOF { t }
;

typ:
  | t=typ2 { t }
  | a=typ2 ARROW b=typ { Type_parsed.Arrow { label = None; ty = (a, b) } }
  | w=WORD COLON a=typ2 ARROW b=typ
  | QUESTION_MARK w=WORD COLON a=typ2 ARROW b=typ { Type_parsed.Arrow { label = Some w; ty = (a, b) } }
;

typ2:
  | xs=list1(typ1, STAR) { Type_parsed.tuple xs }
  | p=poly_variant { p  }
;

typ1:
  | { Type_parsed.Wildcard }
  | ts=typs { Type_parsed.tuple ts }
  | o=obj { Type_parsed.Object o }
  | ts=typs w=WORD ws=list(WORD)
    {
      List.fold_left (fun acc w ->
        Type_parsed.Tycon (w, [acc])) (Type_parsed.Tycon (w, ts)) ws
    }
;

typ0:
  | WILDCARD { Type_parsed.Wildcard }
  | w=POLY { Type_parsed.Tyvar w }
  | w=WORD { Type_parsed.Tycon (w, []) }
;


typs:
  | t=typ0 { [t] }
  | PARENS_OPEN ts=list1(typ, COMMA) PARENS_CLOSE { ts }
;


list1(term, separator):
  | x=term { [x] }
  | x=term separator xs=list1(term, separator) { x::xs }
;

obj:
  | LESS GREATER { [] }
  | LESS ms=obj_method_list GREATER { ms }
;

obj_method_list:
  | x=method_field
  | x=method_field SEMICOLON { [ x ] }
  | x=method_field SEMICOLON DOTDOT { [ x ] }
  | x=method_field SEMICOLON xs=obj_method_list { x :: xs }

method_field:
  | w=WORD COLON t=typ { (w, t) }
;

poly_variant:
  | LBRACKET option(chevron) option(BAR) ts=separated_list(BAR, poly_tag) RBRACKET { Type_parsed.Poly_variant ts }
;

chevron:
  | GREATER
  | LESS { () }

poly_tag:
  | BACKQUOTE constr=WORD { (constr, None ) }
  | BACKQUOTE constr=WORD OF t=typ { (constr, Some t) }
;
