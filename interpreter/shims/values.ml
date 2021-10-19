type num = Wasm.Values.num

type ('i32, 'i64, 'f32, 'f64) op = ('i32, 'i64, 'f32, 'f64) Wasm.Values.op =
    I32 of 'i32 | I64 of 'i64 | F32 of 'f32 | F64 of 'f64
