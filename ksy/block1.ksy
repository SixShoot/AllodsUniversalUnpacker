meta:
  id: block1
  endian: le
seq:
  - id: offset #not sure
    type: u4
  - id: count
    type: u4
  - id: entries
    type: entry(_io.pos)
    repeat: expr
    repeat-expr: count
types:
  entry:
    params:
      - id: start
        type: u4
    seq:
      - id: offset
        type: u4
      - id: length
        type: u4
      - id: index #TODO: id
        type: u4
    instances:
      value:
        pos: offset + start
        type: str
        size: length
        terminator: 0
        encoding: UTF-8
