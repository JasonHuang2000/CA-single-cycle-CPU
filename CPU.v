module CPU
(
    clk_i, 
    rst_i,
    start_i
);

// Ports
input           clk_i;
input           rst_i;
input           start_i;

// Wires
// PC
wire    [31:0]  pc_i;
wire    [31:0]  pc_o;
wire    [31:0]  instr;
wire    [1:0]   ALU_op;
wire            ALU_src;
wire            reg_write;
wire    [31:0]  rs1_data;
wire    [31:0]  rs2_data;
wire    [31:0]  imm_32;
wire    [31:0]  mux_out;
wire    [9:0]   funct;
wire    [2:0]   ALU_ctrl;
wire    [31:0]  ALU_result;
wire            zero;

// assign function code
assign funct = {instr[31:25], instr[14:12]};

Control Control (
    .Op_i       (instr[6:0]),
    .ALUOp_o    (ALU_op),
    .ALUSrc_o   (ALU_src),
    .RegWrite_o (reg_write)
);

Adder Add_PC (
    .data1_in   (pc_o),
    .data2_in   (32'd4),
    .data_o     (pc_i)
);

PC PC (
    .clk_i      (clk_i),
    .rst_i      (rst_I),
    .start_i    (start_i),
    .pc_i       (pc_i),
    .pc_o       (pc_o)
);

Instruction_Memory Instruction_Memory (
    .addr_i     (pc_o), 
    .instr_o    (instr)
);

Registers Registers (
    .clk_i       (clk_i),
    .RS1addr_i   (instr[19:15]),
    .RS2addr_i   (instr[24:20]),
    .RDaddr_i    (instr[11:7]), 
    .RDdata_i    (ALU_result),
    .RegWrite_i  (reg_write), 
    .RS1data_o   (rs1_data), 
    .RS2data_o   (rs2_data) 
);

MUX32 MUX_ALUSrc (
    .data1_i    (rs2_data),
    .data2_i    (imm_32),
    .select_i   (ALU_src),
    .data_o     (mux_out)
);

Sign_Extend Sign_Extend (
    .data_i     (instr[31:20]),
    .data_o     (imm_32)
);
  
ALU ALU (
    .data1_i    (rs1_data),
    .data2_i    (mux_out),
    .ALUCtrl_i  (ALU_ctrl),
    .data_o     (ALU_result),
    .Zero_o     (zero)
);

ALU_Control ALU_Control (
    .funct_i    (funct),
    .ALUOp_i    (ALU_op),
    .ALUCtrl_o  (ALU_ctrl)
);

endmodule

