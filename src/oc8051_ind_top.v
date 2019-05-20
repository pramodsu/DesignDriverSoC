//////////////////////////////////////////////////////////////////////
//// OC8051 formal verification top module                      //////
//////////////////////////////////////////////////////////////////////

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_ind_top(
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
    property_invalid_ind0,
);
    input clk;
    input rst;
    input [127:0] word_in;

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


    output property_invalid_ind0;

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
    wire inst_finished;
    wire [15:0] pc2, pc1;
    wire [7:0] psw;
    wire [7:0] acc;

    wire [15:0] PC_next;
    wire [7:0] ACC_gm;
    wire [15:0] rd_rom_0_addr, rd_rom_1_addr, rd_rom_2_addr;
    wire [7:0]  rd_rom_0, rd_rom_1, rd_rom_2;
    wire [3:0] rd_iram_addr = word_in[3:0];
    wire [7:0] rd_iram_data;

    reg [7:0] p0in_reg, p1in_reg, p2in_reg, p3in_reg;

    wire [7:0] p0in_model = inst_finished ? p0_in : p0in_reg;
    wire [7:0] p1in_model = inst_finished ? p1_in : p1in_reg;
    wire [7:0] p2in_model = inst_finished ? p2_in : p2in_reg;
    wire [7:0] p3in_model = inst_finished ? p3_in : p3in_reg;

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
        .clk            (clk),
        .rst            (rst),
        .step           (inst_finished),
        .RD_ROM_0_ADDR  (rd_rom_0_addr),
        .RD_ROM_1_ADDR  (rd_rom_1_addr),
        .RD_ROM_2_ADDR  (rd_rom_2_addr),
        .RD_ROM_0       (rd_rom_0),
        .RD_ROM_1       (rd_rom_1),
        .RD_ROM_2       (rd_rom_2),
        .PC_next        (PC_next),
        .ACC            (ACC_gm),
        .RD_IRAM_ADDR   (rd_iram_addr),
        .RD_IRAM_DATA   (rd_iram_data),
        .P0IN           (p0in_model),
        .P1IN           (p1in_model),
        .P2IN           (p2in_model),
        .P3IN           (p3in_model)
    );

    reg op0_cnst;
    reg inst_finished_r;

    // if we see a non-zero op, property is always valid.
    //wire op0_cnst_next = op0_cnst ? ((rd_rom_0 <= 8'h20) && (ie_impl == 0)) : 0;
    //wire cnst_valid = op0_cnst && op0_cnst_next;
    //assign property_invalid_pc = cnst_valid && inst_finished && (PC_next != pc2);
    //assign property_invalid_acc = cnst_valid && inst_finished_r && (ACC_gm != acc);
    //assign property_invalid_iram = cnst_valid && inst_finished_r && (rd_iram_data != iram_rd_data_impl);

    always @(posedge clk) begin
        if (rst) begin
            op0_cnst <= 1;
            inst_finished_r <= 0;
            p0in_reg <= 8'b0;
            p1in_reg <= 8'b0;
            p2in_reg <= 8'b0;
            p3in_reg <= 8'b0;
        end
        else begin
            //op0_cnst <= op0_cnst_next;
            inst_finished_r <= inst_finished;
            if (inst_finished) begin
                p0in_reg <= p0_in;
                p1in_reg <= p1_in;
                p2in_reg <= p2_in;
                p3in_reg <= p3_in;
            end
        end
    end


    wire [2047:0] iram_impl_flat;
    wire [127:0] iram_impl = iram_impl_flat[127:0];
    wire [7:0] iram_impl_data [15:0];
    assign iram_impl_data[0] = iram_impl[7:0];
    assign iram_impl_data[1] = iram_impl[15:8];
    assign iram_impl_data[2] = iram_impl[23:16];
    assign iram_impl_data[3] = iram_impl[31:24];
    assign iram_impl_data[4] = iram_impl[39:32];
    assign iram_impl_data[5] = iram_impl[47:40];
    assign iram_impl_data[6] = iram_impl[55:48];
    assign iram_impl_data[7] = iram_impl[63:56];
    assign iram_impl_data[8] = iram_impl[71:64];
    assign iram_impl_data[9] = iram_impl[79:72];
    assign iram_impl_data[10] = iram_impl[87:80];
    assign iram_impl_data[11] = iram_impl[95:88];
    assign iram_impl_data[12] = iram_impl[103:96];
    assign iram_impl_data[13] = iram_impl[111:104];
    assign iram_impl_data[14] = iram_impl[119:112];
    assign iram_impl_data[15] = iram_impl[127:120];
    wire [7:0] iram_rd_data_impl = iram_impl_data[rd_iram_addr];
    wire [7:0] ie_impl;

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
         .psw                   (psw),
         .acc                   (acc),
         .iram                  (iram_impl_flat),
         .ie                    (ie_impl),

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

