type command = command' Wasm.Source.phrase
and command' =
  | Module of var option * definition
  | Meta of Wasm.Script.meta


type script = list command
