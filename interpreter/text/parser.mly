
%start component_module component_script
%type<Wasm.Script.var option * Wasm.Script.definition> component_module
%type<Script.script> component_script

%%

component_module :
  | LPAR module_ RPAR { $2 }

component_script :
  | component_module { [ Script.Module (fst $1, snd $1) @@ positions_to_region $symbolstartpos $endpos ] }
