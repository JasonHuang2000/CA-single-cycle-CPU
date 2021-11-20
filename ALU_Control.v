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

reg     [2:0]   reg_o;

// Output signal
always @(funct_i or ALUOp_i) begin
   if (ALUOp_i == 2'b10) begin
       // R-type
       case (funct_i)
           `funct_AND: reg_o = `ALU_AND;
           `funct_XOR: reg_o = `ALU_XOR;
           `funct_SLL: reg_o = `ALU_SLL;
           `funct_ADD: reg_o = `ALU_ADD;
           `funct_SUB: reg_o = `ALU_SUB;
           `funct_MUL: reg_o = `ALU_MUL;
       endcase
   end 
   else if (ALUOp_i == 2'b11) begin
        // I-type
        if (funct_i[2:0] == `funct3_ADDI) begin
            reg_o = `ALU_ADD;
        end else if (funct_i[2:0] == `funct3_SRAI) begin
            reg_o = `ALU_SRA;
        end
   end 
end

assign ALUCtrl_o = reg_o;
    
endmodule