/*
 * Fully-combinational ROM module that interfaces with the oc8051.
 *
 * This wrapper was written by Pramod Subramanyan.
 * Email: psubrama@princeton.edu
 */


module oc8051_cxrom(clk, rst, cxrom_addr, cxrom_data_out);
    input clk, rst;
    input  [15:0]   cxrom_addr;
    output [31:0]   cxrom_data_out;

    wire [15:0] addr;
    wire [31:0] cxrom_data_out;

    reg [7:0] buff [9999:0];
    wire [15:0] addr0 = addr;
    wire [15:0] addr1 = addr+1;
    wire [15:0] addr2 = addr+2;
    wire [15:0] addr3 = addr+3;
    wire [7:0] data_o0 = (addr0 < 10000) ? buff[addr0] : 8'hx;
    wire [7:0] data_o1 = (addr1 < 10000) ? buff[addr1] : 8'hx;
    wire [7:0] data_o2 = (addr2 < 10000) ? buff[addr2] : 8'hx;
    wire [7:0] data_o3 = (addr3 < 10000) ? buff[addr3] : 8'hx;
    wire [31:0] data_out = {data_o3, data_o2, data_o1, data_o0};

    assign addr = cxrom_addr;
    assign cxrom_data_out = data_out;

endmodule
