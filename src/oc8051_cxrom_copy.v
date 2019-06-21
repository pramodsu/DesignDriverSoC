/*
 * Fully-combinational ROM module that interfaces with the oc8051.
 *
 * This wrapper was written by Pramod Subramanyan.
 * Email: psubrama@princeton.edu
 */


module oc8051_cxrom_copy(clk, rst, cxrom_addr, cxrom_data_out);
    input clk, rst;
    input  [15:0]   cxrom_addr;
    output [31:0]   cxrom_data_out;

    wire [15:0] addr;
    wire [31:0] cxrom_data_out;

//    `include "../bench/rom/proc0_test.v"
    `include "../bench/rom/aes_test.v"

    assign addr = cxrom_addr;
    assign cxrom_data_out = data_out;

endmodule
