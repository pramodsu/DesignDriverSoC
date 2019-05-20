//////////////////////////////////////////////////////////////////////
//// OC8051 formal verification simulator top module            //////
//////////////////////////////////////////////////////////////////////

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module sim8051_top(
    clk,
    rst,
    // wb_clk_i,
    // wb_rst_i,

    // initialize state
    init,
    rom_init_addr,
    rom_init_data,
    // Use for debug
    rom_addr_in,
    rom_data_out,

    // interface to instruction rom
    wbi_adr_o,
    wbi_dat_i, 
    wbi_stb_o, 
    wbi_ack_i, 
    wbi_cyc_o, 
    wbi_err_i,

    // interface to data ram
    wbd_dat_i, 
    wbd_dat_o,
    wbd_adr_o, 
    wbd_we_o, 
    wbd_ack_i,
    wbd_stb_o, 
    wbd_cyc_o, 
    wbd_err_i,

    // rom interface
    // cxrom_addr,
    // cxrom_data_out,

    // interrupt interface
    int0_i,
    int1_i,

    // priv_lvl output for xram
    priv_lvl,

    // tracks pc value in case of illegal access
    dpc_ot,

    // port interface
    `ifdef OC8051_PORTS
        `ifdef OC8051_PORT0
                p0_i,
                p0_o,
        `endif

        `ifdef OC8051_PORT1
                p1_i,
                p1_o,
        `endif

        `ifdef OC8051_PORT2
                p2_i,
                p2_o,
        `endif

        `ifdef OC8051_PORT3
                p3_i,
                p3_o,
        `endif
    `endif

    // serial interface
    `ifdef OC8051_UART
        rxd_i, txd_o,
    `endif

    // counter interface
    `ifdef OC8051_TC01
        t0_i, t1_i,
    `endif

    `ifdef OC8051_TC2
        t2_i, t2ex_i,
    `endif

    // BIST
    `ifdef OC8051_BIST
        scanb_rst,
        scanb_clk,
        scanb_si,
        scanb_so,
        scanb_en,
    `endif
    
    // external access (active low)
    ea_in,
    pc_change,
    pc,
    pc_log,
    pc_log_prev,
    acc,
    b_reg,
    dptr,
    ie,
    iram,
    psw, p,
    sp,
    op1, op2, op3,
    op1_d,
    decoder_state
);

input         rst,              // reset input
              clk,              // clock input
              int0_i,           // interrupt 0
              int1_i,           // interrupt 1
              ea_in,            // external access
              wbd_ack_i,        // data acknowlage
              wbi_ack_i,        // instruction acknowlage
              wbd_err_i,        // data error
              wbi_err_i;        // instruction error

input         init;             // initializing stage
input  [15:0] rom_init_addr;    // initialize rom addr
input  [31:0] rom_init_data;    // initialize rom data
output [15:0] rom_addr_in;      // use for debug
output [31:0] rom_data_out;     // use for debug

output        pc_change;
output        priv_lvl;
output [15:0] pc;
output [15:0] dpc_ot;
output [15:0] pc_log;
output [15:0] pc_log_prev;
output [7:0]  psw;
output p;
output [7:0]  sp;
output [7:0]  acc;
output [7:0]  b_reg;
output [15:0] dptr;
output [2047:0] iram;
output [7:0] op1, op1_d, op2, op3;
output [7:0]  ie;

input [7:0]   wbd_dat_i;        // ram data input
input [31:0]  wbi_dat_i;        // rom data input

output        wbd_we_o,         // data write enable
              wbd_stb_o,        // data strobe
              wbd_cyc_o,        // data cycle
              wbi_stb_o,        // instruction strobe
              wbi_cyc_o;        // instruction cycle

output [7:0]  wbd_dat_o;        // data output

output [15:0] wbd_adr_o,        // data address
              wbi_adr_o;        // instruction address

//output [15:0] cxrom_addr;       // code xrom.
//input  [31:0] cxrom_data_out;   // data and addr.
output [1:0] decoder_state;

`ifdef OC8051_PORTS

`ifdef OC8051_PORT0
input  [7:0]  p0_i;             // port 0 input
output [7:0]  p0_o;             // port 0 output
`endif

`ifdef OC8051_PORT1
input  [7:0]  p1_i;             // port 1 input
output [7:0]  p1_o;             // port 1 output
`endif

`ifdef OC8051_PORT2
input  [7:0]  p2_i;             // port 2 input
output [7:0]  p2_o;             // port 2 output
`endif

`ifdef OC8051_PORT3
input  [7:0]  p3_i;             // port 3 input
output [7:0]  p3_o;             // port 3 output
`endif

`endif

`ifdef OC8051_UART
input         rxd_i;            // receive
output        txd_o;            // transnmit
`endif

`ifdef OC8051_TC01
input         t0_i,             // counter 0 input
              t1_i;             // counter 1 input
`endif

`ifdef OC8051_TC2
input         t2_i,             // counter 2 input
              t2ex_i;           //
`endif

`ifdef OC8051_BIST
input   scanb_rst;
input   scanb_clk;
input   scanb_si;
output  scanb_so;
input   scanb_en;
wire    scanb_soi;
`endif

wire init;
wire wb_clk_i = clk; 
wire wb_rst_i = rst;

// initialize states
wire [15:0] rom_init_addr, rom_addr_in;
wire [31:0] rom_init_data, rom_data_out;
assign rom_addr_in = cxrom_addr;
assign rom_data_out = cxrom_data_out;

// interface to instruction rom
wire [15:0] wbi_adr_o;
wire [31:0] wbi_dat_i;
wire wbi_stb_o, wbi_ack_i, wbi_cyc_o, wbi_err_i;

// interface to data ram
wire [7:0] wbd_dat_i, wbd_dat_o;
wire [15:0] wbd_adr_o;
wire wbd_we_o, wbd_ack_i, wbd_stb_o, wbd_cyc_o, wbd_err_i;

// xcrom interface
wire [15:0] cxrom_addr;
wire [31:0] cxrom_data_out;

// interrupt interface
wire int0_i, int1_i;

// priv_lvl output for xram
wire priv_lvl;

// tackes pc value in case of illegal access
wire [15:0] dpc_ot;

// port interface

// external access
                
wire ea_in, pc_change, p;
wire [15:0] pc, pc_log, pc_log_prev, dptr;
wire [7:0]  acc, b_reg, ie, psw, sp, op1, op1_d, op2, op3;
wire [2047:0] iram;
wire [1:0] decoder_state;

// helper signals ?
/*
    reg  first_instr;
    wire inst_finished;
    wire [15:0] pc_impl;
    wire [7:0] psw_impl;
    wire [7:0] sp_impl;
    wire [7:0] acc_impl, b_reg_impl;
    wire [15:0] dptr_impl;

    wire [15:0] PC_gm, PC_gm_next;
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
    wire [7:0] xram_data_out_gm; 
    wire [7:0] xram_data_out_gm_next;
    wire [15:0] xram_addr_gm;
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
*/

/*
    oc8051_cxrom oc8051_cxrom_1(
        .clk            (clk),
        .rst            (rst),
        .cxrom_addr     (cxrom_addr),
        .cxrom_data_out (cxrom_data_out)
    );
*/
    sim8051_rom sim8051_rom_1(
        .clk            (clk),
        .rst            (rst),
        .wr             (init),
        .wr_addr        (rom_init_addr),
        .wr_data        (rom_init_data),
        .simrom_addr    (cxrom_addr),
        .simrom_data_out(cxrom_data_out)
    );

//    assign wbi_ack_i = 1;

    oc8051_top oc8051_top_1(
         .wb_rst_i          (wb_rst_i),
         .wb_clk_i          (wb_clk_i),
         // interface to instruction rom
//        .wbi_adr_o         (wbi_adr_o),
//         .wbi_dat_i         (wbi_dat_i),
         .wbi_adr_o         (cxrom_addr),
         .wbi_dat_i         (cxrom_data_out),
         .wbi_stb_o         (wbi_stb_o), 
         .wbi_ack_i         (wbi_ack_i), 
         .wbi_cyc_o         (wbi_cyc_o), 
         .wbi_err_i         (wbi_err_i),
         // interface to data ram
//         .wbd_adr_o         (wbd_adr_o), 
//         .wbd_dat_i         (wbd_dat_i), 
         .wbd_adr_o         (cxrom_addr),
         .wbd_dat_i         (cxrom_data_out),
         .wbd_dat_o         (wbd_dat_o),
         .wbd_we_o          (wbd_we_o), 
         .wbd_ack_i         (wbd_ack_i),
         .wbd_stb_o         (wbd_stb_o),
         .wbd_cyc_o         (wbd_cyc_o), 
         .wbd_err_i         (wbd_err_i),
         // cxrom interface
         .cxrom_addr        (cxrom_addr),
         .cxrom_data_out    (cxrom_data_out),
         // interrupt interface
         .int0_i            (int0_i), 
         .int1_i            (int1_i),
         // priv_lvl output for xram
         .priv_lvl          (priv_lvl),
         // tracks pc value in case of illegal access
         .dpc_ot            (dpc_ot),
         // external access
         .ea_in             (ea_in),
         .pc_change         (pc_change),
         .pc                (pc),
         .pc_log            (pc_log),
         .pc_log_prev       (pc_log_prev),
         .acc               (acc),
         .b_reg             (b_reg),
         .dptr              (dptr),
         .ie                (ie),
         .iram              (iram),
         .psw               (psw),
         .p                 (p),
         .sp                (psw),
         .op1               (op1),
         .op1_d             (op1_d),
         .op2               (op2),
         .op3               (op3),
         .decoder_state     (decoder_state)
    );

/*
    oc8051_golden_model oc8051_golden_model_1(
        .clk                ( clk                   ), 
        .rst                ( rst                   ), 
        .step               ( inst_finished         ), 
        .RD_ROM_0_ADDR      ( rd_rom_0_addr         ), 
        .RD_ROM_1_ADDR      ( rd_rom_1_addr         ), 
        .RD_ROM_2_ADDR      ( rd_rom_2_addr         ), 
        .RD_ROM_0           ( rd_rom_0              ), 
        .RD_ROM_1           ( rd_rom_1              ), 
        .RD_ROM_2           ( rd_rom_2              ), 
        .ACC                ( ACC_gm                ), 
        .B                  ( B_gm                  ), 
        .DPL                ( DPL_gm                ), 
        .DPH                ( DPH_gm                ), 
        .IE                 ( IE_gm                 ), 
        .IE_next            ( IE_gm_next            ), 
        .IP                 ( IP_gm                 ), 
        .IP_next            ( IP_gm_next            ), 
        .P0IN               ( p0in_model            ), 
        .P1IN               ( p1in_model            ), 
        .P2IN               ( p2in_model            ), 
        .P3IN               ( p3in_model            ), 
        .P0                 ( P0_gm                 ), 
        .P1                 ( P1_gm                 ), 
        .P2                 ( P2_gm                 ), 
        .P3                 ( P3_gm                 ), 
        .PC                 ( PC_gm                 ), 
        .PC_next            ( PC_gm_next            ), 
        .PCON_next          ( PCON_gm_next          ), 
        .PSW                ( PSW_gm                ), 
        .PSW_next           ( PSW_gm_next           ), 
        .PCON               ( PCON_gm               ), 
        .IRAM_full          ( IRAM_gm               ), 
        .SBUF_next          ( SBUF_gm_next          ), 
        .SBUF               ( SBUF_gm               ), 
        .SCON_next          ( SCON_gm_next          ), 
        .SCON               ( SCON_gm               ), 
        .SP                 ( SP_gm                 ), 
        .SP_next            ( SP_gm_next            ), 
        .TCON_next          ( TCON_gm_next          ), 
        .TCON               ( TCON_gm               ), 
        .TH0_next           ( TH0_gm_next           ), 
        .TH0                ( TH0_gm                ), 
        .TH1_next           ( TH1_gm_next           ), 
        .TH1                ( TH1_gm                ), 
        .TL0_next           ( TL0_gm_next           ), 
        .TL0                ( TL0_gm                ), 
        .TL1_next           ( TL1_gm_next           ), 
        .TL1                ( TL1_gm                ), 
        .TMOD_next          ( TMOD_gm_next          ), 
        .TMOD               ( TMOD_gm               ), 
        .XRAM_DATA_OUT      ( xram_data_out_gm      ), 
        .XRAM_DATA_OUT_next ( xram_data_out_gm_next ), 
        .XRAM_ADDR          ( xram_addr_gm          ), 
        .XRAM_ADDR_next     ( xram_addr_gm_next     ), 
        .XRAM_DATA_IN       ( xram_data_in_model    )
    );

    reg op0_cnst;
    reg inst_finished_r;

    // if we see a non-zero op, property is always valid.
    wire bad_inst = 
        (rd_rom_0 == 8'hc2) || (rd_rom_0 == 8'hc3) ||
        (rd_rom_0 == 8'hb2) || (rd_rom_0 == 8'hb3) ||
        (rd_rom_0 == 8'ha2) || (rd_rom_0 == 8'h82) ||
        (rd_rom_0 == 8'hb0) || (rd_rom_0 == 8'h92) ||
        (rd_rom_0 == 8'h72) || (rd_rom_0 == 8'ha0) ||
        (rd_rom_0 == 8'hd2) || (rd_rom_0 == 8'hd3) ||
        (rd_rom_0 == 8'hd4) || (rd_rom_0 == 8'hd0) ||
        (rd_rom_0 == 8'h10) || (rd_rom_0 == 8'h20) || (rd_rom_0 == 8'h30);
        //(rd_rom_0 == 8'he0) || (rd_rom_0 == 8'he2) || (rd_rom_0 == 8'he3) ||
        //(rd_rom_0 == 8'hf0) || (rd_rom_0 == 8'hf2) || (rd_rom_0 == 8'hf3);

    wire op0_cnst_next = op0_cnst ? (!bad_inst) : 0;
    wire cnst_valid = op0_cnst && op0_cnst_next;

    assign property_invalid_pc = cnst_valid && inst_finished && (PC_gm_next != pc_impl);
    assign property_invalid_acc = cnst_valid && inst_finished_r && (ACC_gm != acc_impl);
    assign property_invalid_b_reg = cnst_valid & inst_finished_r && (B_gm != b_reg_impl);
    assign property_invalid_dpl = cnst_valid & inst_finished_r && (DPL_gm != dptr_impl[7:0]);
    assign property_invalid_dph = cnst_valid & inst_finished_r && (DPH_gm != dptr_impl[15:8]);
    assign property_invalid_iram = cnst_valid && inst_finished_r && (IRAM_gm != iram_impl);
    assign property_invalid_p0 = cnst_valid && inst_finished_r && (P0_gm != p0_out);
    assign property_invalid_p1 = cnst_valid && inst_finished_r && (P1_gm != p1_out);
    assign property_invalid_p2 = cnst_valid && inst_finished_r && (P2_gm != p2_out);
    assign property_invalid_p3 = cnst_valid && inst_finished_r && (P3_gm != p3_out);
    assign property_invalid_xram_addr = cnst_valid && inst_finished && (xram_addr_gm_next != wbd_adr_o);
    assign property_invalid_xram_data_out = cnst_valid && inst_finished && (xram_data_out_gm_next != wbd_dat_o);

    wire property_invalid_psw_1 = cnst_valid && inst_finished && (PSW_gm_next[7:1] != psw_impl[7:1]);
    wire property_invalid_psw_2 = cnst_valid && inst_finished_r && (PSW_gm[7:1] != psw_impl[7:1]);
    reg property_invalid_psw_1_r;
    assign property_invalid_psw = property_invalid_psw_1_r && property_invalid_psw_2;

    wire property_invalid_sp_1 = cnst_valid && inst_finished && (SP_gm_next != sp_impl);
    wire property_invalid_sp_2 = cnst_valid && inst_finished_r && (SP_gm != sp_impl);
    reg property_invalid_sp_1_r;
    assign property_invalid_sp = property_invalid_sp_1_r && property_invalid_sp_2;

    always @(posedge clk) begin
        if (rst) begin
            op0_cnst <= 1;
            inst_finished_r <= 0;
            xram_data_in_reg <= 8'b0;
            p0in_reg <= 8'b0;
            p1in_reg <= 8'b0;
            p2in_reg <= 8'b0;
            p3in_reg <= 8'b0;
            property_invalid_psw_1_r <= 0;
            property_invalid_sp_1_r <= 0;
        end
        else begin
            op0_cnst <= op0_cnst_next;
            inst_finished_r <= inst_finished;
            property_invalid_psw_1_r <= property_invalid_psw_1;
            property_invalid_sp_1_r <= property_invalid_sp_1;
            if (inst_finished) begin
                xram_data_in_reg <= xram_data_in;
                p0in_reg <= p0_in;
                p1in_reg <= p1_in;
                p2in_reg <= p2_in;
                p3in_reg <= p3_in;
            end
        end
    end



    wire [15:0] pc_impl_p1 = pc_impl + 16'd1;
    wire [15:0] pc_impl_p2 = pc_impl + 16'd2;

    wire [7:0] op1_impl, op2_impl, op3_impl;
    wire [7:0] op1_d_impl;

    wire [7:0] op1_gm   = rd_rom_0;
    wire [7:0] op2_gm   = rd_rom_1;
    wire [7:0] op3_gm   = rd_rom_2;

    assign property_invalid_rom_pc = inst_finished          && 
                                     (op1_gm != op1_impl)   && (rd_rom_0_addr == pc_impl)       &&
                                     (op2_gm != op2_impl)   && (rd_rom_1_addr == pc_impl_p1)    &&
                                     (op3_gm != op3_impl)   && (rd_rom_2_addr == pc_impl_p2);

    assign property_invalid_dec_rom_pc = 0; // inst_finished_r && (op1_gm != op1_d_impl) && (rd_rom_0_addr == PC_gm);

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
         .pc                    (pc_impl),
         .psw                   (psw_impl),
         .sp                    (sp_impl),
         .acc                   (acc_impl),
         .b_reg                 (b_reg_impl),
         .dptr                  (dptr_impl),
         .iram                  (iram_impl_flat),
         .op1                   (op1_impl),
         .op1_d                 (op1_d_impl),
         .op2                   (op2_impl),
         .op3                   (op3_impl),

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
*/
endmodule
