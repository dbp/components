type command = command' Wasm.Source.phrase
and command' =
  | Module of var option * definition

type script = list command
