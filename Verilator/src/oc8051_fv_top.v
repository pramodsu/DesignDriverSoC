//////////////////////////////////////////////////////////////////////
//// OC8051 formal verification top module                      //////
//////////////////////////////////////////////////////////////////////

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_fv_top(
    clk,
    rst,
    word_in,
`ifdef OC8051_PORTS
 `ifdef OC8051_PORT0
    p0_in,             // port 0 input
 `endif
 `ifdef OC8051_PORT1
    p1_in,             // port 1 input
 `endif
 `ifdef OC8051_PORT2
    p2_in,             // port 2 input
 `endif
 `ifdef OC8051_PORT3
    p3_in,             // port 3 input
 `endif
`endif
`ifdef OC8051_UART
    rxd_i,            // receive
`endif

`ifdef OC8051_TC01
    t0_i,             // counter 0 input
    t1_i,             // counter 1 input
`endif

`ifdef OC8051_TC2
    t2_i,             // counter 2 input
    t2ex_i,           //
`endif
    property_invalid_inc_dir_iram,
    property_invalid_inc_acc,
    property_invalid_pcp1,
    property_invalid_pcp2,
    property_invalid_pcp3,
    property_invalid_sjmp,
    property_invalid_ljmp,
    property_invalid_ajmp,
    property_invalid_jc,
    property_invalid_jnc
);
    input clk;
    input rst;
    input [31:0] word_in;

`ifdef OC8051_PORTS
 `ifdef OC8051_PORT0
    input  [7:0]  p0_in;             // port 0 input
    wire [7:0]  p0_out;
 `endif
 `ifdef OC8051_PORT1
    input  [7:0]  p1_in;             // port 1 input
    wire [7:0]  p1_out;
 `endif
 `ifdef OC8051_PORT2
    input  [7:0]  p2_in;             // port 2 input
    wire [7:0]  p2_out;
 `endif
 `ifdef OC8051_PORT3
    input  [7:0]  p3_in;             // port 3 input
    wire [7:0]  p3_out;
 `endif
`endif

`ifdef OC8051_UART
input         rxd_i;            // receive
`endif

`ifdef OC8051_TC01
input         t0_i,             // counter 0 input
              t1_i;             // counter 1 input
`endif

`ifdef OC8051_TC2
input         t2_i,             // counter 2 input
              t2ex_i;           //
`endif


    output property_invalid_inc_dir_iram;
    output property_invalid_inc_acc;
    output property_invalid_pcp1;
    output property_invalid_pcp2;
    output property_invalid_pcp3;
    output property_invalid_sjmp;
    output property_invalid_ljmp;
    output property_invalid_ajmp;
    output property_invalid_jc;
    output property_invalid_jnc;

    wire int0 = 0;
    wire int1 = 1;

`ifdef OC8051_UART
    wire        txd_o;            // transnmit
`endif


    wire [7:0] wbd_dat_i = 0;
    wire [31:0] wbi_dat_i = 0;
    wire wbd_ack_i = 0;
    wire wbi_ack_i = 0;
    wire wbd_err_i = 0;
    wire wbi_err_i = 0;

    wire [7:0] data_out_uart, data_out_xram;
    wire wbd_we_o;
    wire wbd_stb_o;
    wire wbd_cyc_o;
    wire wbi_stb_o;
    wire wbi_cyc_o;
    wire [7:0] wbd_dat_o;
    wire [15:0] wbd_adr_o;
    wire [15:0] cxrom_addr;
    wire [31:0] cxrom_data_out;
    wire [15:0] wbi_adr_o;

    reg  first_instr;
    wire pc_change;
    wire [15:0] pc2, pc1;
    wire [7:0] psw;
    wire [7:0] acc;
    wire op_valid;
    wire [7:0] op0_out;
    wire [7:0] op1_out;
    wire [7:0] op2_out;
    wire [2047:0] iram_flat;
    wire [7:0] iram [255:0];

    genvar i;
    generate for (i=0; i < 256; i = i+1) begin:iramout
      assign iram[i] = iram_flat[i*8+7 : i*8];
    end endgenerate

    wire cy = psw[7];
    reg [7:0] iram_op1;
    reg [7:0] op0_out_r, op1_out_r, op2_out_r;

    // pc_change => (pc_log_prev = pc_log + 1).
    wire pcp1 = 
        (op0_out[1] && op0_out[2] && !op0_out[4] && op0_out[6]) || (op0_out[1] && op0_out[2]
        && !op0_out[3] && op0_out[4] && !op0_out[5]) || (op0_out[0] && op0_out[1] &&
        !op0_out[3] && op0_out[6] && op0_out[7]) || (op0_out[0] && op0_out[1] && !op0_out[2]
        && !op0_out[3] && !op0_out[6]) || (!op0_out[0] && !op0_out[1] && op0_out[2] &&
        !op0_out[3] && !op0_out[4] && !op0_out[5] && !op0_out[6]) || (!op0_out[0] &&
        op0_out[5] && op0_out[6] && op0_out[7]) || (!op0_out[1] && op0_out[2] && !op0_out[3]
        && !op0_out[4] && op0_out[5] && !op0_out[6] && op0_out[7]) || (!op0_out[0] &&
        op0_out[2] && !op0_out[3] && op0_out[6] && op0_out[7]) || (!op0_out[0] && !op0_out[1]
        && !op0_out[4] && !op0_out[5] && !op0_out[6] && !op0_out[7]) || (!op0_out[0] &&
        op0_out[2] && !op0_out[5] && !op0_out[6] && !op0_out[7]) || (op0_out[3] && op0_out[4]
        && !op0_out[5] && !op0_out[6]) || (op0_out[3] && op0_out[5] && op0_out[6] &&
        op0_out[7]) || (op0_out[3] && !op0_out[6] && !op0_out[7]) || (op0_out[1] &&
        op0_out[2] && !op0_out[6] && !op0_out[7]) || (op0_out[3] && !op0_out[4] &&
        op0_out[6]) || (op0_out[3] && !op0_out[5] && !op0_out[7]);

    wire pcp2 = 
        (!op0_out[1] && op0_out[2] && !op0_out[3] && op0_out[5] && !op0_out[6] &&
        !op0_out[7]) || (op0_out[0] && !op0_out[1] && op0_out[2] && !op0_out[3] &&
        !op0_out[5] && !op0_out[7]) || (!op0_out[0] && op0_out[1] && !op0_out[2] &&
        !op0_out[3] && !op0_out[5] && op0_out[7]) || (!op0_out[0] && !op0_out[1] &&
        op0_out[2] && !op0_out[3] && op0_out[6] && !op0_out[7]) || (op0_out[3] && op0_out[4]
        && op0_out[5] && op0_out[6] && !op0_out[7]) || (op0_out[3] && !op0_out[4] &&
        !op0_out[6] && op0_out[7]) || (!op0_out[0] && op0_out[1] && !op0_out[2] &&
        !op0_out[3] && op0_out[6] && !op0_out[7]) || (op0_out[1] && op0_out[2] && op0_out[4]
        && op0_out[5] && op0_out[6] && !op0_out[7]) || (!op0_out[0] && !op0_out[2] &&
        !op0_out[3] && !op0_out[5] && op0_out[6] && op0_out[7]) || (!op0_out[1] && op0_out[2]
        && !op0_out[3] && op0_out[4] && !op0_out[5] && !op0_out[6] && op0_out[7]) ||
        (op0_out[0] && !op0_out[1] && op0_out[2] && !op0_out[3] && op0_out[5] && op0_out[6]
        && op0_out[7]) || (op0_out[0] && !op0_out[1] && op0_out[2] && !op0_out[3] &&
        !op0_out[4] && op0_out[6]) || (op0_out[1] && op0_out[2] && !op0_out[4] && !op0_out[6]
        && op0_out[7]) || (!op0_out[0] && !op0_out[2] && !op0_out[3] && op0_out[5] &&
        !op0_out[6] && op0_out[7]);

    wire pcp3 = 
        (!op0_out[0] && !op0_out[1] && !op0_out[2] && !op0_out[3] && op0_out[4] &&
        !op0_out[5] && !op0_out[6] && op0_out[7]) || (op0_out[0] && !op0_out[1] && op0_out[2]
        && !op0_out[3] && !op0_out[4] && !op0_out[5] && !op0_out[6] && op0_out[7]) ||
        (op0_out[0] && !op0_out[1] && op0_out[2] && !op0_out[3] && op0_out[4] && op0_out[5]
        && op0_out[6] && !op0_out[7]) || (op0_out[0] && op0_out[1] && !op0_out[2] &&
        !op0_out[3] && !op0_out[4] && op0_out[6] && !op0_out[7]) || (op0_out[0] && op0_out[1]
        && !op0_out[2] && !op0_out[3] && !op0_out[5] && op0_out[6] && !op0_out[7]);

    wire pc_is_sjmp = (op0_out == 8'h80);
    wire pc_is_ljmp = (op0_out == 8'h02) || (op0_out == 8'h12);
    wire pc_is_ajmp = (op0_out[3:0] == 4'h1);
    wire pc_is_jc   = (op0_out == 8'h40);
    wire pc_is_jnc  = (op0_out == 8'h50);
    wire pc_inc_acc = (op0_out == 8'h04);
    wire pc_inc_dir = (op0_out == 8'h05);

    reg pc_change_r, pc_change_r2;
    reg pc_inc_acc_r;
    reg pc_inc_dir_r;

    // need these to compute relative addresses.
    wire [15:0] pc1_plus_2 = pc1 + 16'h2;
    wire [15:0] pc1_plus_3 = pc1 + 16'h3;

    // relative addresses for jumps.
    wire [15:0] reladdr1, reladdr2, rpc1, rpc2;

    // sign-extend
    assign reladdr1[15:8] = op1_out[7] ? 8'hFF : 8'h00;
    assign reladdr2[15:8] = op2_out[7] ? 8'hFF : 8'h00;
    assign reladdr1[7:0]  = op1_out;
    assign reladdr2[7:0]  = op2_out;
    assign rpc1 = (pc1_plus_2) + reladdr1;
    assign rpc2 = (pc1_plus_3) + reladdr2;

    // SJMP.
    wire [15:0] sjmp_pc = rpc1;

    // absolute address jumps.
    wire [15:0] ljmp_pc = {op1_out, op2_out};

    // The following is derived from this SMT expression.
    // ajmp_pc = Concat(Extract(15, 11, pc_p2), Extract(7, 5, op0), op1)
    wire [15:0] ajmp_pc = {pc1_plus_2[15:11], op0_out[7:5], op1_out};

    // JC
    wire [15:0] jc_pc = cy_reg ? rpc1 : pc1_plus_2;
    wire [15:0] jnc_pc = cy_reg ? pc1_plus_2 : rpc1;

    wire [7:0] acc_reg_inc = acc_reg + 1;
    wire [7:0] iram_op1_reg_inc = iram_op1_reg + 1;

    assign property_invalid_inc_dir_iram = 
        (!first_instr && pc_change_r && op_valid && pc_inc_dir_r && !op1_out_r[7]) &&
        (iram_op1_reg_inc != iram[op1_out_r]);

    assign property_invalid_inc_acc =
        (!first_instr && pc_change_r && op_valid && pc_inc_acc_r) &&
        (acc_reg_inc != acc);
    assign property_invalid_pcp1 = 
        (!first_instr && pc_change && op_valid && pcp1) && 
        ((pc1+16'd1) != pc2);
    assign property_invalid_pcp2 = 
        (!first_instr && pc_change && op_valid && pcp2) && 
        ((pc1+16'd2) != pc2);
    assign property_invalid_pcp3 = 
        (!first_instr && pc_change && op_valid && pcp3) && 
        ((pc1+16'd3) != pc2);
    assign property_invalid_sjmp = 
        (!first_instr && pc_change && op_valid && pc_is_sjmp) && 
        (sjmp_pc != pc2);
    assign property_invalid_ljmp = 
        (!first_instr && pc_change && op_valid && pc_is_ljmp) && 
        (ljmp_pc != pc2);
    assign property_invalid_ajmp = 
        (!first_instr && pc_change && op_valid && pc_is_ajmp) && 
        (ajmp_pc != pc2);
    assign property_invalid_jc =
        (!first_instr && pc_change && op_valid && pc_is_jc) && 
        (jc_pc != pc2);
    assign property_invalid_jnc =
        (!first_instr && pc_change && op_valid && pc_is_jnc) && 
        (jnc_pc != pc2);

    always @(posedge clk)
    begin
        if (rst) begin
            first_instr <= 1;
        end
        else begin
            if(pc_change && first_instr) begin
                first_instr <= 0;
            end
        end
    end

    always @(posedge clk)
    begin
        if (rst) begin
            pc_change_r <= 0;
            pc_change_r2 <= 0;
            pc_inc_acc_r <= 0;
            pc_inc_dir_r <= 0;
        end
        else begin
            pc_change_r <= pc_change;
            pc_change_r2 <= pc_change_r;
            pc_inc_acc_r <= pc_inc_acc;
            pc_inc_dir_r <= pc_inc_dir;
        end
    end

    reg cy_reg;
    reg [7:0] acc_reg;
    reg [7:0] iram_op1_reg;
    always @(posedge clk)
    begin
        if (rst) begin
            cy_reg <= 0;
            acc_reg <= 0;
            op0_out_r <= 0;
            op1_out_r <= 0;
            op2_out_r <= 0;
            iram_op1_reg <= 0;
            iram_op1 <= 0;
        end
        else begin
            if (pc_change) begin
                iram_op1_reg <= iram_op1;
                iram_op1 <= iram[op1_out];
                
                op0_out_r <= op0_out;
                op1_out_r <= op1_out;
                op2_out_r <= op2_out;
            end
            if (pc_change_r) begin
                acc_reg <= acc;
                cy_reg <= cy;
            end
            //if (pc_change_r2) begin
            //end
        end
    end

    oc8051_symbolic_cxrom oc8051_symbolic_cxrom1 ( 
        .clk                  ( clk            ),
        .rst                  ( rst            ),
        .word_in              ( word_in        ),
        .cxrom_addr           ( cxrom_addr     ),
        .pc1                  ( pc1            ),
        .pc2                  ( pc2            ),
        .cxrom_data_out       ( cxrom_data_out ),
        .op_valid             ( op_valid       ),
        .op0_out              ( op0_out        ),
        .op1_out              ( op1_out        ),
        .op2_out              ( op2_out        )
    );
    /*
    oc8051_debug_cxrom oc8051_debug_cxrom1 ( 
        .clk                  ( clk            ),
        .rst                  ( rst            ),
        .word_in              ( word_in        ),
        .cxrom_addr           ( cxrom_addr     ),
        .pc1                  ( pc1            ),
        .pc2                  ( pc2            ),
        .cxrom_data_out       ( cxrom_data_out ),
        .op_valid             ( op_valid       ),
        .op0_out              ( op0_out        ),
        .op1_out              ( op1_out        ),
        .op2_out              ( op2_out        )
    );
    */

    oc8051_top oc8051_top_1(
         .wb_rst_i(rst), .wb_clk_i(clk),
         .int0_i(int0), .int1_i(int1),

         .wbd_dat_i(wbd_dat_i), .wbd_we_o(wbd_we_o), .wbd_dat_o(wbd_dat_o),
         .wbd_adr_o(wbd_adr_o), .wbd_err_i(wbd_err_i),
         .wbd_ack_i(wbd_ack_i), .wbd_stb_o(wbd_stb_o), .wbd_cyc_o(wbd_cyc_o),

         .wbi_adr_o(wbi_adr_o), .wbi_stb_o(wbi_stb_o), .wbi_ack_i(wbi_ack_i),
         .wbi_cyc_o(wbi_cyc_o), .wbi_dat_i(wbi_dat_i), .wbi_err_i(wbi_err_i),

         .cxrom_addr            ( cxrom_addr     ),
         .cxrom_data_out        ( cxrom_data_out ),

         .pc_change             (pc_change),
         .pc                    (pc2),
         .pc_log                (pc1),
         .psw                   (psw),
         .acc                   (acc),
         .iram                  (iram_flat),

`ifdef OC8051_PORTS
 `ifdef OC8051_PORT0
         .p0_i(p0_in),
         .p0_o(p0_out),
 `endif
 `ifdef OC8051_PORT1
         .p1_i(p1_in),
         .p1_o(p1_out),
 `endif
 `ifdef OC8051_PORT2
         .p2_i(p2_in),
         .p2_o(p2_out),
 `endif
 `ifdef OC8051_PORT3
         .p3_i(p3_in),
         .p3_o(p3_out),
 `endif
`endif


   `ifdef OC8051_UART
         .rxd_i(rxd_i), .txd_o(txd_o),
   `endif

   `ifdef OC8051_TC01
         .t0_i(t0_i), .t1_i(t1_i),
   `endif

   `ifdef OC8051_TC2
         .t2_i(t2_i), .t2ex_i(t2ex_i),
   `endif

         .ea_in(1'b1));

endmodule
