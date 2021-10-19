%start component_module component_script
%type<Wasm.Script.var option * Wasm.Script.definition> component_module
%type<Script.script> component_script

%%

component_module :
  | LPAR module_ RPAR { $2 }


component_instance :
  | LPAR INSTANCE VAR LPAR INSTANTIATE VAR instantiate_fields RPAR RPAR { () }

instantiate_fields :
  | import { () }
  | export { () }

component_script :
| component_cmd component_script { $1 :: $2 }
| { [] }

component_cmd :
| component_module { Script.Module (fst $1, snd $1) @@ positions_to_region $symbolstartpos $endpos }
| component_instance { Script.Instance () }
| component_meta { Wasm.Script.Meta $1 @@ positions_to_region $symbolstartpos $endpos }


component_meta :
  | LPAR INPUT script_var_opt STRING RPAR { Input ($3, $4) @@ positions_to_region $symbolstartpos $endpos }
