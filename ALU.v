`include "header.v"

module ALU (
    data1_i,
    data2_i,
    ALUCtrl_i,
    data_o,
    Zero_o
);

// Ports
input   [31:0]  data1_i;
input   [31:0]  data2_i;
input   [2:0]   ALUCtrl_i;
output  [31:0]  data_o;
output          Zero_o;

// Zero remains don't care in phase 1
assign Zero_o <= 1'bx

// Output result
always @(data1_i or data2_i or ALUCtrl_i) begin
    case (ALUCtrl_i)
        `ALU_AND: data_o <= data1_i & data2_i;
        `ALU_XOR: data_o <= data1_i ^ data2_i;
        `ALU_SLL: data_o <= data1_i << data2_i;
        `ALU_ADD: data_o <= data1_i + data2_i;
        `ALU_SUB: data_o <= data1_i - data2_i;
        `ALU_MUL: data_o <= data1_i * data2_i;
        `ALU_SRA: data_o <= data1_i >>> data2_i;
    endcase
end

endmodule