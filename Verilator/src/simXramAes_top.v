// Wrapper for the AES+XRAM RTL simulator

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"

module simXramAes_top(
    clk,
    rst,
    stb,
    // Input
    cmd,                // wr
    cmdaddr,            // addr
    cmddata,            // data_in
    // Output
    data_out,           // data_out
    // These are outputs for verifying.
    aes_state,
    aes_addr,
    aes_len,
    aes_ctr,
    aes_key0,
    aes_key1,
    aes_step,
    aes_ack
);

input clk, rst, stb;
input cmd;
input [15:0] cmdaddr;
input [7:0]  cmddata;
output [7:0] data_out;
output [1:0] aes_state;
output [15:0] aes_addr, aes_len;
output [127:0] aes_ctr, aes_key0, aes_key1;
output aes_step;
output aes_ack;

// AES verif output.
wire [1:0] aes_state;
wire [15:0] aes_addr, aes_len;
wire [127:0] aes_ctr, aes_key0, aes_key1;
wire aes_step;

// AES <==> XRAM
wire [15:0] xram_addr;
wire [7:0] xram_data_out;
wire [7:0] xram_data_in;
wire xram_ack;
wire xram_stb;
wire xram_wr;
wire xram_wr_en;
wire xram_rd_en;
assign xram_wr_en = xram_wr;    
assign xram_rd_en = ~xram_wr;   

// AES <==> 8051, interface handling
wire clk, rst, stb, wr;
wire aes_ack;
wire aes_in_addr_range;

aes_top aes_top1(
    .clk            (clk),
    .rst            (rst),
    .wr             (cmd),
    .addr           (cmdaddr),
    .data_in        (cmddata),
    .data_out       (data_out),
    .ack            (aes_ack),
    .stb            (stb),
    .in_addr_range  (aes_in_addr_range),
    .xram_addr      (xram_addr),
    .xram_data_out  (xram_data_out),
    .xram_data_in   (xram_data_in),
    .xram_ack       (xram_ack),
    .xram_stb       (xram_stb),
    .xram_wr        (xram_wr),
    .aes_state      (aes_state),
    .aes_addr       (aes_addr),
    .aes_len        (aes_len),
    .aes_ctr        (aes_ctr),
    .aes_key0       (aes_key0),
    .aes_key1       (aes_key1),
    .aes_step       (aes_step)
); 

oc8051_xram oc8051_xram1(
    .clk            (clk),
    .rst            (rst),
    .wr             (xram_wr),
    .wr_en          (xram_wr_en),
    .addr           (xram_addr),
    .data_in        (xram_data_out),
    .data_out       (xram_data_in),
    .ack            (xram_ack),
    .stb            (xram_stb),
    .rd_en          (xram_rd_en)
);



endmodule
