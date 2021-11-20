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

// Output signal
always @(Op_i) begin
    if (Op_i[5] == 0)
        // R-type
        ALUOp_o <= 2'b10;
        ALUSrc_o <= 0;
    else
        // I-type
        ALUOp_o <= 2'b11;
        ALUSrc_o <= 1;
end

endmodule