meta:
  id: block6
  endian: le
params:
  - id: size
    type: u4
seq:
  - id: entries
    type: block6_entry
    repeat: expr
    repeat-expr: size
types:
  block6_entry:
    seq:
      - id: length
        type: u4
      - id: magic
        contents: [ 0x2E, 0x00, 0x2E, 0x00]
      - id: value
        type: str
        size: length - 4
        encoding: UTF-16
