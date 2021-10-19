type pos = Wasm.Source.pos = {file : string; line : int; column : int}
type region = Wasm.Source.region = {left : pos; right : pos}
type 'a phrase = 'a Wasm.Source.phrase = {at : region; it : 'a}

let (@@) x region = {it = x; at = region}
let at region x = x @@ region

let no_pos = {file = ""; line = 0; column = 0}
let no_region = {left = no_pos; right = no_pos}
