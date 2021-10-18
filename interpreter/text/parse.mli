type 'a start =
  | Module : (Wasm.Script.var option * Wasm.Script.definition) start
  | Script : Script.script start

exception Syntax of Wasm.Source.region * string

val parse : string -> Lexing.lexbuf -> 'a start -> 'a (* raises Syntax *)

val string_to_script : string -> Script.script (* raises Syntax *)
val string_to_module : string -> Wasm.Script.definition (* raises Syntax *)
