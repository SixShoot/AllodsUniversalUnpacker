meta:
  id: block2
  endian: le
seq:
  - id: offset1
    type: u4
  - id: count1
    type: u4
  - id: offset2
    type: u4
  - id: count2
    type: u4 
  - id: offset3
    type: u4
  - id: count3
    type: u4 
  - id: offset4
    type: u4
  - id: count41
    type: u4 
  - id: count42
    type: u4
types:
  block1_entry:
    params:
      - id: start
        type: u4
    seq:
      - id: offset
        type: u4
      - id: length
        type: u4
    instances:
      data:
        pos: offset + start
        type: block1_data(_io.pos)
        repeat: expr
        repeat-expr: length
  block1_data:
    params:
      - id: start
        type: u4
    seq:
      - id: offset
        type: u4
      - id: length
        type: u4
      - id: dbid
        type: u4
    instances:
      value:
        pos: offset + start
        type: block1_value
        size: length
  block1_value:
    seq:
      - id: delimiter
        contents: [0x01, 0x00, 0x00, 0x00]
      - id: adler32
        type: u4
      - id: filename
        type: strz
        encoding: UTF-8
  block2_entry:
    params:
      - id: start
        type: u4
    seq:
      - id: offset
        type: u4
      - id: length
        type: u4
      - id: magic
        contents: [ 0x00, 0x00, 0x00, 0x00 ]
    instances:
      data:
        pos: offset + start
        type: str
        size: length
        terminator: 0
        encoding: UTF-8
  block3_entry:
    params:
      - id: start
        type: u4
    seq:
      - id: offset
        type: u4
      - id: length
        type: u4
    instances:
      data:
        pos: offset + start
        type: block3_data
        repeat: expr
        repeat-expr: length
  block3_data:
    seq:
      - id: resource_id
        type: u4
      - id: dbid
        type: u4
  block4_entry:
    params:
      - id: start
        type: u4
    seq:
      - id: offset
        type: u4
      - id : length
        type: u4
    instances:
      data:
        pos: offset + start
        type: block4_data
        repeat: expr
        repeat-expr: length
  block4_data:
    seq:
      - id: dbid
        type: u4
      - id: resource_id
        type: u4
instances:
  block21:
    pos: offset1
    type: block1_entry(_io.pos)
    repeat: expr
    repeat-expr: count1
  block22:
    pos: offset2 + 8
    type: block2_entry(_io.pos)
    repeat: expr
    repeat-expr: count2
  block23:
    pos: offset3 + 16
    type: block3_entry(_io.pos)
    repeat: expr
    repeat-expr: count3
  block24:
    pos: offset4 + 24
    type: block4_entry(_io.pos)
    repeat: expr
    repeat-expr: count41
  