meta:
  id: block4
  endian: le
params:
  - id: size
    type: u4
seq:
  - id: entries
    type: block4_entry
    repeat: expr
    repeat-expr: size
types:
  block4_entry:
    seq:
      - id: u4_1
        type: u4
      - id: u4_2
        type: u4
