meta:
  id: pack
  endian: le
  imports:
    - block0
    - block1
    - block2
    - block4
    - block5
    - block6
seq:
  - id: data
    size-eos: true
    type: pack
    process: zlib
types:
  pack:
    seq:
      - id: block0_id
        contents: [ 0x00, 0x00, 0x00, 0x00 ]
      - id: block0
        type: block0
      - id: block1_id
        contents: [ 0x01, 0x00, 0x00, 0x00 ]
      - id: block1_length
        type: u4
      - id: block1
        size: block1_length
        type: block1
      - id: block2_id
        contents: [ 0x02, 0x00, 0x00, 0x00 ]
      - id: block2_length
        type: u4
      - id: block2
        size: block2_length
        type: block2
      - id: block3_id
        contents: [ 0x03, 0x00, 0x00, 0x00 ]
      - id: block3_length
        type: u4
      - id: block3
        size: block3_length
      - id: block4_id
        contents: [ 0x04, 0x00, 0x00, 0x00 ]
      - id: block4_length
        type: u4
      - id: block4
        size: block4_length * 8
        type: block4(block4_length)
      - id: block5_id
        contents: [ 0x05, 0x00, 0x00, 0x00 ]
      - id: block5_length
        type: u4
      - id: block5
        size: block5_length * 4
        type: block5(block5_length)
      - id: block6_id
        contents: [ 0x06, 0x00, 0x00, 0x00 ]
      - id: block6_length # number of dirs
        type: u4
      - id: block6
        type: block6(block6_length)
