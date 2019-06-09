
// BEGIN
//////////////////////////////////////////////////////////////////////
//// OC8051 formal verification top module                      //////
//////////////////////////////////////////////////////////////////////

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_gm_top(
    clk,
    rst,
    word_in,
    xram_data_in,

    RD_IRAM_0_ABSTR_ADDR,
    RD_IRAM_1_ABSTR_ADDR,
    RD_ROM_1_ABSTR_ADDR,
    RD_ROM_2_ABSTR_ADDR,
    ACC_abstr,
    P2_abstr,
    P0_abstr,
    P1_abstr,
    P3_abstr,
    SP_abstr,
    PC_abstr,
    B_abstr,
    DPL_abstr,
    PSW_abstr,
    DPH_abstr,
    XRAM_DATA_OUT_abstr,
    XRAM_ADDR_abstr,
    WR_COND_ABSTR_IRAM_0,
    WR_ADDR_ABSTR_IRAM_0,
    WR_DATA_ABSTR_IRAM_0,
    WR_COND_ABSTR_IRAM_1,
    WR_ADDR_ABSTR_IRAM_1,
    WR_DATA_ABSTR_IRAM_1,

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
    property_invalid_pc,
    property_invalid_acc,
    property_invalid_b_reg,
    property_invalid_dpl,
    property_invalid_dph,
    property_invalid_iram,
    property_invalid_p0,
    property_invalid_p1,
    property_invalid_p2,
    property_invalid_p3,
    property_invalid_psw,
    // property_invalid_sp,
    property_invalid_xram_addr,
    property_invalid_xram_data_out
);
    input clk;
    input rst;
    input [127:0] word_in;
    input [7:0] xram_data_in;
    input [7:0] RD_IRAM_0_ABSTR_ADDR;
    input [7:0] RD_IRAM_1_ABSTR_ADDR;
    input [15:0] RD_ROM_1_ABSTR_ADDR;
    input [15:0] RD_ROM_2_ABSTR_ADDR;
    input [7:0] ACC_abstr;
    input [7:0] P2_abstr;
    input [7:0] P0_abstr;
    input [7:0] P1_abstr;
    input [7:0] P3_abstr;
    input [7:0] SP_abstr;
    input [15:0] PC_abstr;
    input [7:0] B_abstr;
    input [7:0] DPL_abstr;
    input [7:0] PSW_abstr;
    input [7:0] DPH_abstr;
    input WR_COND_ABSTR_IRAM_0;
    input [3:0] WR_ADDR_ABSTR_IRAM_0;
    input [7:0] WR_DATA_ABSTR_IRAM_0;
    input WR_COND_ABSTR_IRAM_1;
    input [3:0] WR_ADDR_ABSTR_IRAM_1;
    input [7:0] WR_DATA_ABSTR_IRAM_1;
    input [7:0] XRAM_DATA_OUT_abstr;
    input [15:0] XRAM_ADDR_abstr;

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


    output property_invalid_pc;
    output property_invalid_acc;
    output property_invalid_b_reg;
    output property_invalid_dpl;
    output property_invalid_dph;
    output property_invalid_iram;
    output property_invalid_p0;
    output property_invalid_p1;
    output property_invalid_p2;
    output property_invalid_p3;
    output property_invalid_psw;
    // output property_invalid_sp = 0;
    output property_invalid_xram_addr;
    output property_invalid_xram_data_out;

    wire int0 = 0;
    wire int1 = 1;

`ifdef OC8051_UART
    wire        txd_o;            // transnmit
`endif

    wire [7:0] wbd_dat_i = xram_data_in_model;
    wire [15:0] wbd_adr_o;
    wire wbd_stb_o;
    wire wbd_ack_i = wbd_stb_o;

    wire [31:0] wbi_dat_i = 0;
    wire wbi_ack_i = 0;
    wire wbd_err_i = 0;
    wire wbi_err_i = 0;

    wire [7:0] data_out_uart, data_out_xram;
    wire wbd_we_o;
    wire wbd_cyc_o;
    wire wbi_stb_o;
    wire wbi_cyc_o;
    wire [7:0] wbd_dat_o;
    wire [15:0] cxrom_addr;
    wire [31:0] cxrom_data_out;
    wire [15:0] wbi_adr_o;

    reg  first_instr;
    wire inst_finished;
    wire [15:0] pc2, pc1;
    wire p;
    wire [7:0] psw_impl_in, psw_impl;
    wire [7:0] sp_impl;
    wire [7:0] acc_impl, b_reg_impl;
    wire [15:0] dptr_impl;

    wire [15:0] PC_gm_next;
    wire [7:0] ACC_gm;
    wire [7:0] B_gm;
    wire [7:0] DPL_gm, DPH_gm;
    wire [7:0] IE_gm, IE_gm_next;
    wire [7:0] IP_gm, IP_gm_next;
    wire [7:0] P0_gm, P1_gm, P2_gm, P3_gm;
    wire [7:0] PCON_gm, PCON_gm_next;
    wire [7:0] PSW_gm, PSW_gm_next;
    wire [7:0] SBUF_gm, SBUF_gm_next;
    wire [7:0] SCON_gm, SCON_gm_next;
    wire [7:0] SP_gm, SP_gm_next;
    wire [7:0] TCON_gm, TCON_gm_next;
    wire [7:0] TH0_gm, TH0_gm_next;
    wire [7:0] TH1_gm, TH1_gm_next;
    wire [7:0] TL0_gm, TL0_gm_next;
    wire [7:0] TL1_gm, TL1_gm_next;
    wire [7:0] TMOD_gm, TMOD_gm_next;
    wire [7:0] xram_data_out_gm_next;
    wire [15:0] xram_addr_gm_next;

    wire [15:0] rd_rom_0_addr, rd_rom_1_addr, rd_rom_2_addr;
    wire [7:0]  rd_rom_0, rd_rom_1, rd_rom_2;
    wire [127:0] IRAM_gm;

    reg [7:0] xram_data_in_reg, p0in_reg, p1in_reg, p2in_reg, p3in_reg;

    wire [7:0] xram_data_in_model = xram_data_in_reg;
    wire [7:0] p0in_model = inst_finished ? p0_in : p0in_reg;
    wire [7:0] p1in_model = inst_finished ? p1_in : p1in_reg;
    wire [7:0] p2in_model = inst_finished ? p2_in : p2in_reg;
    wire [7:0] p3in_model = inst_finished ? p3_in : p3in_reg;

    assign psw_impl = {psw_impl_in[7:1], p};

    oc8051_gm_cxrom oc8051_gm_cxrom_1(
        .clk            (clk),
        .rst            (rst),
        .word_in        (word_in),
        .cxrom_addr     (cxrom_addr),
        .cxrom_data_out (cxrom_data_out),
        .rd_addr_0      (rd_rom_0_addr),
        .rd_addr_1      (rd_rom_1_addr),
        .rd_addr_2      (rd_rom_2_addr),
        .rd_data_0      (rd_rom_0),
        .rd_data_1      (rd_rom_1),
        .rd_data_2      (rd_rom_2)
    );


    oc8051_golden_model oc8051_golden_model_1(
        .clk                  ( clk                   ), 
        .rst                  ( rst                   ), 
        .step                 ( inst_finished         ), 
        .RD_ROM_0_ADDR        ( rd_rom_0_addr         ), 
        .RD_ROM_1_ADDR        ( rd_rom_1_addr         ), 
        .RD_ROM_2_ADDR        ( rd_rom_2_addr         ), 
        .RD_ROM_0             ( rd_rom_0              ), 
        .RD_ROM_1             ( rd_rom_1              ), 
        .RD_ROM_2             ( rd_rom_2              ), 
        .ACC                  ( ACC_gm                ), 
        .B                    ( B_gm                  ), 
        .DPL                  ( DPL_gm                ), 
        .DPH                  ( DPH_gm                ), 
        .IE                   ( IE_gm                 ), 
        .IE_next              ( IE_gm_next            ), 
        .IP                   ( IP_gm                 ), 
        .IP_next              ( IP_gm_next            ), 
        .P0IN                 ( p0in_model            ), 
        .P1IN                 ( p1in_model            ), 
        .P2IN                 ( p2in_model            ), 
        .P3IN                 ( p3in_model            ), 
        .P0                   ( P0_gm                 ), 
        .P1                   ( P1_gm                 ), 
        .P2                   ( P2_gm                 ), 
        .P3                   ( P3_gm                 ), 
        .PC_next              ( PC_gm_next            ), 
        .PCON_next            ( PCON_gm_next          ), 
        .PSW                  ( PSW_gm                ), 
        .PSW_next             ( PSW_gm_next           ), 
        .PCON                 ( PCON_gm               ), 
        .IRAM_full            ( IRAM_gm               ), 
        .SBUF_next            ( SBUF_gm_next          ), 
        .SBUF                 ( SBUF_gm               ), 
        .SCON_next            ( SCON_gm_next          ), 
        .SCON                 ( SCON_gm               ), 
        .SP                   ( SP_gm                 ), 
        .SP_next              ( SP_gm_next            ), 
        .TCON_next            ( TCON_gm_next          ), 
        .TCON                 ( TCON_gm               ), 
        .TH0_next             ( TH0_gm_next           ), 
        .TH0                  ( TH0_gm                ), 
        .TH1_next             ( TH1_gm_next           ), 
        .TH1                  ( TH1_gm                ), 
        .TL0_next             ( TL0_gm_next           ), 
        .TL0                  ( TL0_gm                ), 
        .TL1_next             ( TL1_gm_next           ), 
        .TL1                  ( TL1_gm                ), 
        .TMOD_next            ( TMOD_gm_next          ), 
        .TMOD                 ( TMOD_gm               ), 
        .RD_IRAM_0_ABSTR_ADDR ( RD_IRAM_0_ABSTR_ADDR  ),
        .RD_IRAM_1_ABSTR_ADDR ( RD_IRAM_1_ABSTR_ADDR  ),
        .RD_ROM_1_ABSTR_ADDR  ( RD_ROM_1_ABSTR_ADDR   ),
        .RD_ROM_2_ABSTR_ADDR  ( RD_ROM_2_ABSTR_ADDR   ),
        .ACC_abstr            ( ACC_abstr             ),
        .P2_abstr             ( P2_abstr              ),
        .P0_abstr             ( P0_abstr              ),
        .P1_abstr             ( P1_abstr              ),
        .P3_abstr             ( P3_abstr              ),
        .SP_abstr             ( SP_abstr              ),
        .PC_abstr             ( PC_abstr              ),
        .B_abstr              ( B_abstr               ),
        .DPL_abstr            ( DPL_abstr             ),
        .PSW_abstr            ( PSW_abstr             ),
        .DPH_abstr            ( DPH_abstr             ),
        .WR_COND_ABSTR_IRAM_0 ( WR_COND_ABSTR_IRAM_0  ),
        .WR_ADDR_ABSTR_IRAM_0 ( WR_ADDR_ABSTR_IRAM_0  ),
        .WR_DATA_ABSTR_IRAM_0 ( WR_DATA_ABSTR_IRAM_0  ),
        .WR_COND_ABSTR_IRAM_1 ( WR_COND_ABSTR_IRAM_1  ),
        .WR_ADDR_ABSTR_IRAM_1 ( WR_ADDR_ABSTR_IRAM_1  ),
        .WR_DATA_ABSTR_IRAM_1 ( WR_DATA_ABSTR_IRAM_1  ),
        .XRAM_DATA_OUT_abstr  ( XRAM_DATA_OUT_abstr   ),
        .XRAM_ADDR_abstr      ( XRAM_ADDR_abstr       ),
        .XRAM_DATA_IN         ( xram_data_in_model    ),
        .XRAM_DATA_OUT_next   ( xram_data_out_gm_next ), 
        .XRAM_ADDR_next       ( xram_addr_gm_next     )  
    );

    reg inst_finished_r;


    wire [7:0] opcode = rd_rom_0;

    wire this_op_cnst = opcode == 8'h74;
    // wire this_op_cnst = opcode == 8'h25;
    reg this_op_cnst_r;

    wire bad_inst = 
        (rd_rom_0 == 8'hc2) || (rd_rom_0 == 8'hc3) ||
        (rd_rom_0 == 8'hb2) || (rd_rom_0 == 8'hb3) ||
        (rd_rom_0 == 8'ha2) || (rd_rom_0 == 8'h82) ||
        (rd_rom_0 == 8'hb0) || (rd_rom_0 == 8'h92) ||
        (rd_rom_0 == 8'h72) || (rd_rom_0 == 8'ha0) ||
        (rd_rom_0 == 8'hd2) || (rd_rom_0 == 8'hd3) ||
        (rd_rom_0 == 8'hd4) || (rd_rom_0 == 8'hd0) ||
        (rd_rom_0 == 8'h10) || (rd_rom_0 == 8'h20) || (rd_rom_0 == 8'h30);

    reg op0_cnst;
    wire op0_cnst_next = op0_cnst ? (!bad_inst) : 0;
    wire op0_cnst_valid = op0_cnst && op0_cnst_next;

    wire property_valid_pc_1 = (PC_gm_next == pc2);
    wire property_valid_xram_addr_1 = (xram_addr_gm_next == wbd_adr_o);
    wire property_valid_xram_data_out_1 = (xram_data_out_gm_next == wbd_dat_o);

    wire property_valid_acc_2 = (ACC_gm == acc_impl);
    wire property_valid_b_reg_2 = (B_gm == b_reg_impl);
    wire property_valid_dpl_2 = (DPL_gm == dptr_impl[7:0]);
    wire property_valid_dph_2 = (DPH_gm == dptr_impl[15:8]);
    wire property_valid_iram_2 = (IRAM_gm == iram_impl);
    wire property_valid_p0_2 = (P0_gm == p0_out);
    wire property_valid_p1_2 = (P1_gm == p1_out);
    wire property_valid_p2_2 = (P2_gm == p2_out);
    wire property_valid_p3_2 = (P3_gm == p3_out);

    reg property_valid_psw_1_r;
    wire property_valid_psw_1 = (PSW_gm_next == psw_impl);
    wire property_valid_psw_2o = (PSW_gm == psw_impl);
    wire property_valid_psw_2 = property_valid_psw_1_r && property_valid_psw_2o;

    reg property_valid_sp_1_r;
    wire property_valid_sp_1 = (SP_gm_next == sp_impl);
    wire property_valid_sp_2o = (SP_gm == sp_impl);
    wire property_valid_sp_2 = property_valid_sp_1_r && property_valid_sp_2o;

    wire p1_valid = 
        inst_finished                   && 
        property_valid_pc_1             && 
        property_valid_xram_addr_1      && 
        property_valid_xram_data_out_1  && 
        property_valid_sp_1             &&
        property_valid_psw_1;

    wire p2_valid = 
        ( property_valid_acc_2      &&
          property_valid_b_reg_2    &&
          property_valid_dpl_2      &&
          property_valid_dph_2      &&
          property_valid_iram_2     &&
          property_valid_p0_2       &&
          property_valid_p1_2       &&
          property_valid_p2_2       &&
          property_valid_p3_2       &&
          property_valid_psw_2      &&
          property_valid_sp_2       &&
          (PSW_gm_next == psw_impl) &&
          (SP_gm == sp_impl))       && inst_finished_r;

    reg eq_state_1, eq_state_2;
    wire eq_state_next_1 = eq_state_1 ? (inst_finished ? p1_valid : 1) : 0;
    wire eq_state_next_2 = eq_state_2 ? (inst_finished_r ? p2_valid : 1) : 0;

    wire property_invalid_pc = this_op_cnst && op0_cnst_valid && eq_state_1 && eq_state_next_2 && inst_finished && !property_valid_pc_1;
    wire property_invalid_acc = this_op_cnst_r && op0_cnst_valid && eq_state_next_1 && eq_state_2 && inst_finished_r && !property_valid_acc_2;
    wire property_invalid_b_reg = this_op_cnst_r && op0_cnst_valid && eq_state_next_1 && eq_state_2 && inst_finished_r && !property_valid_b_reg_2; 
    wire property_invalid_dpl = this_op_cnst_r && op0_cnst_valid && eq_state_next_1 && eq_state_2 && inst_finished_r && !property_valid_dpl_2; 
    wire property_invalid_dph = this_op_cnst_r && op0_cnst_valid && eq_state_next_1 && eq_state_2 && inst_finished_r && !property_valid_dph_2; 
    wire property_invalid_iram = this_op_cnst_r && op0_cnst_valid && eq_state_next_1 && eq_state_2 && inst_finished_r && !property_valid_iram_2; 
    wire property_invalid_p0 = this_op_cnst_r && op0_cnst_valid && eq_state_next_1 && eq_state_2 && inst_finished_r && !property_valid_p0_2; 
    wire property_invalid_p1 = this_op_cnst_r && op0_cnst_valid && eq_state_next_1 && eq_state_2 && inst_finished_r && !property_valid_p1_2; 
    wire property_invalid_p2 = this_op_cnst_r && op0_cnst_valid && eq_state_next_1 && eq_state_2 && inst_finished_r && !property_valid_p2_2; 
    wire property_invalid_p3 = this_op_cnst_r && op0_cnst_valid && eq_state_next_1 && eq_state_2 && inst_finished_r && !property_valid_p3_2; 
    wire property_invalid_psw = this_op_cnst_r && op0_cnst_valid && eq_state_next_1 && eq_state_2 && inst_finished_r && !property_valid_psw_2; 
    wire property_invalid_xram_addr = this_op_cnst && op0_cnst_valid && eq_state_1 && eq_state_next_2 && wbd_stb_o && !property_valid_xram_addr_1;
    wire property_invalid_xram_data_out = this_op_cnst && op0_cnst_valid && eq_state_1 && eq_state_next_2 && wbd_stb_o && !property_valid_xram_data_out_1;

    always @(posedge clk) begin
        if (rst) begin
            op0_cnst <= 1;
            inst_finished_r <= 0;
            this_op_cnst_r <= 0;
            xram_data_in_reg <= 8'b0;
            p0in_reg <= 8'b0;
            p1in_reg <= 8'b0;
            p2in_reg <= 8'b0;
            p3in_reg <= 8'b0;
            property_valid_psw_1_r <= 0;
            property_valid_sp_1_r <= 0;
            eq_state_1 <= 1;
            eq_state_2 <= 1;
        end
        else begin
            op0_cnst <= op0_cnst_next;
            this_op_cnst_r <= this_op_cnst;

            inst_finished_r <= inst_finished;
            property_valid_psw_1_r <= property_valid_psw_1;
            property_valid_sp_1_r <= property_valid_sp_1;
            if (inst_finished) begin
                xram_data_in_reg <= xram_data_in;
                p0in_reg <= p0_in;
                p1in_reg <= p1_in;
                p2in_reg <= p2_in;
                p3in_reg <= p3_in;
            end
            eq_state_1 <= eq_state_next_1;
            eq_state_2 <= eq_state_next_2;
        end
    end


    wire [2047:0] iram_impl_flat;
    wire [127:0] iram_impl = iram_impl_flat[127:0];

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

         .pc_change             (inst_finished),
         .pc                    (pc2),
         .pc_log                (pc1),
         .psw                   (psw_impl_in),
         .p                     (p),
         .sp                    (sp_impl),
         .acc                   (acc_impl),
         .b_reg                 (b_reg_impl),
         .dptr                  (dptr_impl),
         .iram                  (iram_impl_flat),

`ifdef OC8051_PORTS
 `ifdef OC8051_PORT0
         .p0_i(p0in_model),
         .p0_o(p0_out),
 `endif
 `ifdef OC8051_PORT1
         .p1_i(p1in_model),
         .p1_o(p1_out),
 `endif
 `ifdef OC8051_PORT2
         .p2_i(p2in_model),
         .p2_o(p2_out),
 `endif
 `ifdef OC8051_PORT3
         .p3_i(p3in_model),
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
// END

