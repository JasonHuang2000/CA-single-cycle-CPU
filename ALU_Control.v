`include "header.v"

module ALU_Control (
    funct_i,
    ALUOp_i,
    ALUCtrl_o
);

// Ports
input   [9:0]   funct_i;
input   [1:0]   ALUOp_i;
output  [2:0]   ALUCtrl_o;

// Output signal
always @(funct_i or ALUOp_i) begin
   if (ALUOp_i == 2'b10) begin
       // R-type
       case (funct_i)
           `funct_AND: ALUCtrl_o <= `ALU_AND
           `funct_XOR: ALUCtrl_o <= `ALU_XOR
           `funct_SLL: ALUCtrl_o <= `ALU_SLL
           `funct_ADD: ALUCtrl_o <= `ALU_ADD
           `funct_SUB: ALUCtrl_o <= `ALU_SUB
           `funct_MUL: ALUCtrl_o <= `ALU_MUL
       endcase
   end 
   else if (ALUOp_i == 2'b11) begin
        // I-type
        if (funct_i[2:0] == `funct3_ADDI) begin
            ALUCtrl_o <= `ALU_ADD
        end else if (funct_i[2:0] == `funct3_SRAI) begin
            ALUCtrl_o <= `ALU_SRA
        end
   end 
end
    
endmodule