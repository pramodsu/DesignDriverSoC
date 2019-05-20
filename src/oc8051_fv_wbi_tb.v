//////////////////////////////////////////////////////////////////////
//// OC8051 testbench for the FV shim                           //////
//////////////////////////////////////////////////////////////////////

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_fv_tb();

// parameter FREQ  = 20000; // frequency in kHz
// parameter DELAY = 500000/FREQ;

    reg clk, rst;
    wire assert_valid;


    wire [7:0] wbd_dat_i = 8'hA9;
    wire [31:0] wbi_dat_i = 32'h8f8f8f8f;
    wire wbd_ack_i = 1;
    wire wbi_ack_i = 1;
    wire wbd_err_i = 0;
    wire wbi_err_i = 0;

`ifdef OC8051_PORTS
 `ifdef OC8051_PORT0
    wire  [7:0]  p0_in = 8'b0;
 `endif
 `ifdef OC8051_PORT1
    wire  [7:0]  p1_in = 8'b0;
 `endif
 `ifdef OC8051_PORT2
    wire  [7:0]  p2_in = 8'b0;
 `endif
 `ifdef OC8051_PORT3
    wire  [7:0]  p3_in = 8'b0;
 `endif
`endif

`ifdef OC8051_UART
    wire rxd_i = 0;
`endif

`ifdef OC8051_TC01
    wire t0_i = 0;
    wire t1_i = 0;
`endif

`ifdef OC8051_TC2
    wire t2_i = 0;
    wire t2ex_i = 0;
`endif

// reset.
    initial begin
      $dumpon;
      $dumpfile("run.vcd");
      $dumpvars(0,oc8051_fv_tb);
      rst= 1'b1;
    
      #40
      rst = 1'b0;

      #4000
      $display("time ",$time, "; end of time\n");
      $finish;
    end

    initial
    begin
      clk = 0;
      forever #10 clk <= ~clk;
    end

    oc8051_fv_top oc8051_fv_top1(
        .clk(clk),
        .rst(rst),
        .wbd_dat_i(wbd_dat_i),
        .wbi_dat_i(wbi_dat_i),
        .wbd_err_i(wbd_err_i),
        .wbd_ack_i(wbd_ack_i),
        .wbi_err_i(wbi_err_i),
        .wbi_ack_i(wbi_ack_i),
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
        .assert_valid(assert_valid)
    );

endmodule
