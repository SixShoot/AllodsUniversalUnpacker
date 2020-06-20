meta: 
  id: block5
  endian: le
params:
  - id: size
    type: u4
seq:
  - id: entries
    type: u4
    repeat: expr
    repeat-expr: size
