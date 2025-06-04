val diffs :
  start:Lexing.position ->
  stop:Lexing.position ->
  ?extract_name:string ->
  Msource.t ->
  Typedtree.structure ->
  Query_protocol.diff list
