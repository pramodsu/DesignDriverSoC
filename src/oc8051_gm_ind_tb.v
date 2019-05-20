//////////////////////////////////////////////////////////////////////
//// OC8051 testbench for the FV shim                           //////
//////////////////////////////////////////////////////////////////////

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_gm_tb();

// parameter FREQ  = 20000; // frequency in kHz

    reg clk, rst;
    wire property_invalid_pc;
    reg [127:0] word_in;
    reg [7:0] xram_data_in = 8'hff;

    reg [7:0] XRAM_DATA_OUT_abstr = 8'hff;
    reg [15:0] XRAM_ADDR_abstr = 16'hff;

`ifdef OC8051_PORTS
 `ifdef OC8051_PORT0
    reg  [7:0]  p0_in = 8'hff;
 `endif
 `ifdef OC8051_PORT1
    reg  [7:0]  p1_in = 8'hff;
 `endif
 `ifdef OC8051_PORT2
    reg  [7:0]  p2_in = 8'hff;
 `endif
 `ifdef OC8051_PORT3
    reg  [7:0]  p3_in = 8'hff;
 `endif
`endif

`ifdef OC8051_UART
    reg rxd_i = 1;
`endif

`ifdef OC8051_TC01
    reg t0_i = 1;
    reg t1_i = 1;
`endif

`ifdef OC8051_TC2
    reg t2_i = 1;
    reg t2ex_i = 1;
`endif

    reg [7:0] RD_IRAM_0_ABSTR_ADDR;
    reg [7:0] RD_IRAM_1_ABSTR_ADDR;
    reg [15:0] RD_ROM_1_ABSTR_ADDR;
    reg [15:0] RD_ROM_2_ABSTR_ADDR;
    reg [7:0] ACC_abstr;
    reg [7:0] P2_abstr;
    reg [7:0] P0_abstr;
    reg [7:0] P1_abstr;
    reg [7:0] P3_abstr;
    reg [7:0] SP_abstr;
    reg [15:0] PC_abstr;
    reg [7:0] B_abstr;
    reg [7:0] DPL_abstr;
    reg [7:0] PSW_abstr;
    reg [7:0] DPH_abstr;
    reg WR_COND_ABSTR_IRAM_0;
    reg [3:0] WR_ADDR_ABSTR_IRAM_0;
    reg [7:0] WR_DATA_ABSTR_IRAM_0;
    reg WR_COND_ABSTR_IRAM_1;
    reg [3:0] WR_ADDR_ABSTR_IRAM_1;
    reg [7:0] WR_DATA_ABSTR_IRAM_1;

// reset.
    initial begin
      $dumpon;
      $dumpfile("run2.vcd");
      $dumpvars(0,oc8051_gm_tb);
      rst= 1'b1;
      p0_in[0] = 1;
      p0_in[1] = 1;
      p0_in[2] = 1;
      p0_in[3] = 1;
      p0_in[4] = 1;
      p0_in[5] = 1;
      p0_in[6] = 1;
      p0_in[7] = 1;
      p1_in[0] = 1;
      p1_in[1] = 1;
      p1_in[2] = 1;
      p1_in[3] = 1;
      p1_in[4] = 1;
      p1_in[5] = 1;
      p1_in[6] = 1;
      p1_in[7] = 1;
      p2_in[0] = 1;
      p2_in[1] = 1;
      p2_in[2] = 1;
      p2_in[3] = 1;
      p2_in[4] = 1;
      p2_in[5] = 1;
      p2_in[6] = 1;
      p2_in[7] = 1;
      p3_in[0] = 1;
      p3_in[1] = 1;
      p3_in[2] = 1;
      p3_in[3] = 1;
      p3_in[4] = 1;
      p3_in[5] = 1;
      p3_in[6] = 1;
      p3_in[7] = 1;
      rst = 1;
`ifdef OC8051_UART
      rxd_i = 1;
      t0_i = 1;
      t1_i = 1;
`endif

`ifdef OC8051_TC2
      t2_i = 1;
      t2ex_i = 1;
`endif
      // word_in = 128'h04E00504E00504E00504E00504E00504; // INC ACC, INC E0
      // word_in = 128'h05050505050505050505050505050505; // INC 00
      word_in = 128'b1;
    
      #2001
      rst = 1'b0;

//  `include "cexGM0.v"
//  `include "cexGM1.v"
//  `include "cexGM2.v"
//  `include "cexGM3.v"
//  `include "cexGM4.v"
//  `include "cexGM5.v"
//  `include "cexGM6.v"
//  `include "cexGM7.v"
//  `include "cexGM11.v"
    `include "cexA0.v"

      #8000
      $display("time ",$time, "; end of time\n");
      $finish;
    end

    initial
    begin
      clk = 1;
      forever #100 clk <= ~clk;
    end

    oc8051_gm_top oc8051_gm_top1(
        .clk(clk),
        .rst(rst),
        .word_in(word_in),
`ifdef OC8051_PORTS
 `ifdef OC8051_PORT0
        .p0_in(p0_in),             // port 0 input
 `endif
 `ifdef OC8051_PORT1
        .p1_in(p1_in),             // port 1 input
 `endif
 `ifdef OC8051_PORT2
        .p2_in(p2_in),             // port 2 input
 `endif
 `ifdef OC8051_PORT3
        .p3_in(p3_in),             // port 3 input
 `endif
`endif
`ifdef OC8051_UART
        .rxd_i(rxd_i),            // receive
`endif

`ifdef OC8051_TC01
        .t0_i(t0_i),             // counter 0 input
        .t1_i(t1_i),             // counter 1 input
`endif

`ifdef OC8051_TC2
        .t2_i(t2_i),             // counter 2 input
        .t2ex_i(t2ex_i),           //
`endif
        .property_invalid_pc    (property_invalid_pc    ),

        .RD_IRAM_0_ABSTR_ADDR ( RD_IRAM_0_ABSTR_ADDR ) ,
        .RD_IRAM_1_ABSTR_ADDR ( RD_IRAM_1_ABSTR_ADDR ) ,
        .RD_ROM_1_ABSTR_ADDR  ( RD_ROM_1_ABSTR_ADDR  ) ,
        .RD_ROM_2_ABSTR_ADDR  ( RD_ROM_2_ABSTR_ADDR  ) ,
        .ACC_abstr            ( ACC_abstr            ) ,
        .P2_abstr             ( P2_abstr             ) ,
        .P0_abstr             ( P0_abstr             ) ,
        .P1_abstr             ( P1_abstr             ) ,
        .P3_abstr             ( P3_abstr             ) ,
        .SP_abstr             ( SP_abstr             ) ,
        .PC_abstr             ( PC_abstr             ) ,
        .B_abstr              ( B_abstr              ) ,
        .DPL_abstr            ( DPL_abstr            ) ,
        .PSW_abstr            ( PSW_abstr            ) ,
        .DPH_abstr            ( DPH_abstr            ) ,
        .WR_COND_ABSTR_IRAM_0 ( WR_COND_ABSTR_IRAM_0 ) ,
        .WR_ADDR_ABSTR_IRAM_0 ( WR_ADDR_ABSTR_IRAM_0 ) ,
        .WR_DATA_ABSTR_IRAM_0 ( WR_DATA_ABSTR_IRAM_0 ) ,
        .WR_COND_ABSTR_IRAM_1 ( WR_COND_ABSTR_IRAM_1 ) ,
        .WR_ADDR_ABSTR_IRAM_1 ( WR_ADDR_ABSTR_IRAM_1 ) ,
        .WR_DATA_ABSTR_IRAM_1 ( WR_DATA_ABSTR_IRAM_1 ) ,
        .xram_data_in         ( xram_data_in         ) ,
        .XRAM_DATA_OUT_abstr  ( XRAM_DATA_OUT_abstr  ) ,
        .XRAM_ADDR_abstr      ( XRAM_ADDR_abstr      )
    );

endmodule
