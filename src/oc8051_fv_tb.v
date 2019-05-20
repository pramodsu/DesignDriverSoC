//////////////////////////////////////////////////////////////////////
//// OC8051 testbench for the FV shim                           //////
//////////////////////////////////////////////////////////////////////

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_fv_tb();

// parameter FREQ  = 20000; // frequency in kHz

    reg clk, rst;
    wire property_invalid_pcp1;
    wire property_invalid_pcp2;
    wire property_invalid_pcp3;
    wire property_invalid_sjmp;
    wire property_invalid_ljmp;
    wire property_invalid_ajmp;
    wire property_invalid_jc;
    wire property_invalid_jnc;
    reg [31:0] word_in = 32'hffffffff;


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

// reset.
    initial begin
      $dumpon;
      $dumpfile("run2.vcd");
      $dumpvars(0,oc8051_fv_tb);
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
      rxd_i = 1;
      t0_i = 1;
      t1_i = 1;
      t2_i = 1;
      t2ex_i = 1;
      word_in[0] = 1;
      word_in[1] = 1;
      word_in[2] = 1;
      word_in[3] = 1;
      word_in[4] = 1;
      word_in[5] = 1;
      word_in[6] = 1;
      word_in[7] = 1;
      word_in[8] = 1;
      word_in[9] = 1;
      word_in[10] = 1;
      word_in[11] = 1;
      word_in[12] = 1;
      word_in[13] = 1;
      word_in[14] = 1;
      word_in[15] = 1;
      word_in[16] = 1;
      word_in[17] = 1;
      word_in[18] = 1;
      word_in[19] = 1;
      word_in[20] = 1;
      word_in[21] = 1;
      word_in[22] = 1;
      word_in[23] = 1;
      word_in[24] = 1;
      word_in[25] = 1;
      word_in[26] = 1;
      word_in[27] = 1;
      word_in[28] = 1;
      word_in[29] = 1;
      word_in[30] = 1;
      word_in[31] = 1;
    
      #2001
      rst = 1'b0;

`include "cexA0.v"

      #1000
      $display("time ",$time, "; end of time\n");
      $finish;
    end

    initial
    begin
      clk = 1;
      forever #100 clk <= ~clk;
    end

    oc8051_fv_top oc8051_fv_top1(
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
        .property_invalid_pcp1  (property_invalid_pcp1  ),
        .property_invalid_pcp2  (property_invalid_pcp2  ),
        .property_invalid_pcp3  (property_invalid_pcp3  ),
        .property_invalid_sjmp  (property_invalid_sjmp  ),
        .property_invalid_ljmp  (property_invalid_ljmp  ),
        .property_invalid_ajmp  (property_invalid_ajmp  ),
        .property_invalid_jc    (property_invalid_jc    ),
        .property_invalid_jnc   (property_invalid_jnc   )
    );

endmodule
