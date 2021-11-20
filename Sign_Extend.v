module Sign_Extend (
    data_i,
    data_o
);

// Ports
input   [11:0]  data_i;
output  [31:0]  data_o;

reg     [31:0]  reg_o;

// Output signal
always @(data_i) begin
    reg_o = { {20{data_i[11]}}, data_i };
end

assign data_o = reg_o;

endmodule