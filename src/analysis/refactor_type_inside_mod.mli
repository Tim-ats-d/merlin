(** Wrapping a type in a module consists of extracting a type declaration, using
    its name to generate a fresh module and renaming the first type declaration
    to [t].

    Assuming we want to wrap the following type declaration:
    {[
      type coord = { lat : float; long : float }
    ]}

    The generated code will look like this:
    {[
      module Coord = struct
        type t = { lat : float; long : float }
      end
    ]}

    It also works in signature:
    {[
      module type NUM = sig
        type int
      end
    ]}

    {[
      module type NUM = sig
        module Int : sig
          type t
        end
      end
    ]}

    In the presence of a type declaration defining several types, they are all
    moved in the generated module and this is the first declaration which is
    used to name the module. For instance:
    {[
      type entry = { label : label; content : int }

      and content = Plain_text of string | Markdown of Markdown.t

      and label = string
    ]}

    Will leads to this:
    {[
      module Entry = struct
        type t = { label : label; content : int }

        and content = Plain_text of string | Markdown of Markdown.t

        and label = string
    ]}

    Final remark:
    - The generated code is pretty printed by the compiler libs and may not be
      formatted according to OCamlformat conventions. *)

(** Raised when given position is not inside a type declaration. *)
exception Nothing_to_do

(** Is a type declaration can be wrapped at the given position? *)
val is_type_decl_wrappable : pos:Lexing.position -> Mbrowse.t -> bool

(** [wrap ~pos typedtree] tries to wrap a type declaration it in its own module
    and renames the wrapped type name to [t]. The fresh module has the same name
    as the wrapped type.

    The position [pos] can be anywhere inside the type declaration.

    Returns a {!Query_protocol.substitution_result} consisting of three fields:
    - [loc]: the location where [content] musts be inserted.
    - [content]: the code where the substitution takes places. *)
val wrap :
  pos:Lexing.position -> Mtyper.typedtree -> Query_protocol.substitution_result
