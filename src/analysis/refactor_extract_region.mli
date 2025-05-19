val diffs :
  start:Lexing.position ->
  stop:Lexing.position ->
  Msource.t ->
  Typedtree.structure ->
  Query_protocol.diff list
