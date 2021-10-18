type 'a start =
  | Module : (Wasm.Script.var option * Wasm.Script.definition) start
  | Script : Script.script start


exception Syntax = Wasm.Script.Syntax

let parse' name lexbuf start =
  let open MenhirLib.General in
  let module Interp = Parser.MenhirInterpreter in
  let input = Interp.lexer_lexbuf_to_supplier Lexer.token lexbuf in
  let success prog = prog in
  let failure error_state =
    let env = match[@warning "-4"] error_state with
      | Interp.HandlingError env -> env
      | _ -> assert false in
    match Interp.stack env with
    | lazy Nil -> assert false
    | lazy (Cons (Interp.Element (state, _, start_pos, end_pos), _)) ->
      print_endline (string_of_int (Interp.number state));
      (* let message = *)
      (*   try Some (Parser_messages.message (Interp.number state)) with *)
      (*   | Not_found -> None in *)
      raise (Syntax ({Wasm.Source.left = Lexer.convert_pos start_pos;
                      Wasm.Source.right = Lexer.convert_pos end_pos},
                     "Parse error"))
  in
  (* try *)
    Interp.loop_handle success failure input
      (start lexbuf.Lexing.lex_curr_p)
  (* with Error (input, pos) -> *)
  (*   raise (Syntax ({Wasm.Source.left = Lexer.convert_pos pos; *)
  (*                   Wasm.Source.right = Lexer.convert_pos pos}, *)
  (*                  "Lexer error")) *)



let parse (type a) name lexbuf : a start -> a = function
  | Module -> parse' name lexbuf Parser.Incremental.component_module
  | Script -> parse' name lexbuf Parser.Incremental.component_script

let string_to start s =
  let lexbuf = Lexing.from_string s in
  parse "string" lexbuf start

let string_to_script s = string_to Script s
let string_to_module s = snd (string_to Module s)
