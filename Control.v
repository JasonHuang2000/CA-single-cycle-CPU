`include "header.v"

module Control (
    Op_i,
    ALUOp_o,
    ALUSrc_o,
    RegWrite_o
);

// Ports
input   [6:0]   Op_i;
output  [1:0]   ALUOp_o;
output          ALUSrc_o;
output          RegWrite_o;

// RegWrite is always 1
assign RegWrite_o = 1;

// Reg
reg     [1:0]   reg_op;
reg             reg_src;

// Output signal
always @(Op_i) begin
    if (Op_i == `opcode_R) begin
        // R-type
        reg_op = `ALU_opcode_R;
        reg_src = 0;
    end
    else if (Op_i == `opcode_I) begin
        // I-type
        reg_op = `ALU_opcode_I;
        reg_src = 1;
    end
end

// assign wire
assign ALUOp_o = reg_op;
assign ALUSrc_o = reg_src;

endmodule