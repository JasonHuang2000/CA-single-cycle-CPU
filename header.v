// opcode
`define opcode_R 7'b0110011
`define opcode_I 7'b0010011

// ALU opcode
`define ALU_opcode_R 2'b10
`define ALU_opcode_I 2'b11

// R-type function codes
`define funct_AND 10'b0000000111
`define funct_XOR 10'b0000000100
`define funct_SLL 10'b0000000001
`define funct_ADD 10'b0000000000
`define funct_SUB 10'b0100000000
`define funct_MUL 10'b0000001000

// I-type function codes
`define funct3_ADDI 3'b000
`define funct3_SRAI 3'b101

// ALU control codes
`define ALU_AND 3'b000
`define ALU_XOR 3'b001
`define ALU_SLL 3'b010
`define ALU_ADD 3'b011
`define ALU_SUB 3'b100
`define ALU_MUL 3'b101
`define ALU_SRA 3'b110

