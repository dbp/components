type command = command' Wasm.Source.phrase
and command' =
  | Module of Wasm.Script.var option * Wasm.Script.definition
  | Instance of unit
  | Meta of Wasm.Script.meta

exception Syntax = Wasm.Script.Syntax

type script = command list

type nan = Wasm.Script.nan
type var = Wasm.Script.var
type definition = Wasm.Script.definition
