
%start component_module component_script
%type<Wasm.Script.var option * Wasm.Script.definition> component_module
%type<Script.script> component_script

%%

component_module :
  | LPAR module_ RPAR { $2 }

component_script :
  | component_module { [ Script.Module (fst $1, snd $1) @@ positions_to_region $symbolstartpos $endpos ] }
  | component_meta { [ Wasm.Script.Meta $1 @@ positions_to_region $symbolstartpos $endpos ]}

component_meta :
  | LPAR INPUT script_var_opt STRING RPAR { Input ($3, $4) @@ positions_to_region $symbolstartpos $endpos }
