module Adder (
    data1_in,
    data2_in,
    data_o
);

// Ports
input   [31:0]  data1_in;
input   [31:0]  data2_in;
output  [31:0]  data_o;

// Output result
always @(data1_i or data2_i) begin
    data_o <= data1_i + data2_i;
end

endmodule