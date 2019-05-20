module oc8051_xiommu_gm_top(
    clk,
    rst,
    proc_wr, 
    proc_stb,
    proc_addr, 
    proc_data_in, 

    input_sha_func_0, input_sha_func_1, input_sha_func_2, input_sha_func_3, input_sha_func_4,
    input_sha_func_5, input_aes_func_6, input_aes_func_7, input_sha_func_8, input_sha_func_9,
    input_sha_func_10, input_sha_func_11, input_sha_func_12, input_sha_func_13, input_sha_func_14,
    input_sha_func_15, input_sha_func_16, input_sha_func_17, input_sha_func_18, input_sha_func_19,
    input_sha_func_20, input_sha_func_21, input_sha_func_22, input_aes_func_23, input_aes_func_24,
    input_sha_func_25, input_sha_func_26, input_sha_func_27, input_sha_func_28, input_sha_func_29,
    input_sha_func_30, input_sha_func_31, input_sha_func_32, input_sha_func_33, input_sha_func_34,
    input_sha_func_35, input_sha_func_36, input_aes_func_37, input_aes_func_38, input_sha_func_39,
    input_sha_func_40, input_sha_func_41, input_sha_func_42, input_sha_func_43, input_sha_func_44,
    input_sha_func_45, input_sha_func_46, input_sha_func_47, input_sha_func_48, input_sha_func_49,
    input_sha_func_50, input_aes_func_51, input_aes_func_52, input_sha_func_53, input_sha_func_54,
    input_sha_func_55,
    RD_xram_0, RD_xram_1, RD_xram_2, RD_xram_3, RD_xram_4, RD_xram_5, RD_xram_6, RD_xram_7,
    RD_xram_8, RD_xram_9, RD_xram_10, RD_xram_11, RD_xram_12, RD_xram_13, RD_xram_14, RD_xram_15,
    RD_xram_16, RD_xram_17, RD_xram_18, RD_xram_19, RD_xram_20, RD_xram_21, RD_xram_22, RD_xram_23,
    RD_xram_24, RD_xram_25, RD_xram_26, RD_xram_27, RD_xram_28, RD_xram_29, RD_xram_30, RD_xram_31,
    RD_xram_32, RD_xram_33, RD_xram_34, RD_xram_35, RD_xram_36, RD_xram_37, RD_xram_38, RD_xram_39,
    RD_xram_40, RD_xram_41, RD_xram_42, RD_xram_43, RD_xram_44, RD_xram_45, RD_xram_46, RD_xram_47,
    RD_xram_48, RD_xram_49, RD_xram_50, RD_xram_51, RD_xram_52, RD_xram_53, RD_xram_54, RD_xram_55,
    RD_xram_56, RD_xram_57, RD_xram_58, RD_xram_59, RD_xram_60, RD_xram_61, RD_xram_62, RD_xram_63,
    RD_xram_64, RD_xram_65, RD_xram_66, RD_xram_67, RD_xram_68, RD_xram_69, RD_xram_70, RD_xram_71,
    RD_xram_72, RD_xram_73, RD_xram_74, RD_xram_75, RD_xram_76, RD_xram_77, RD_xram_78, RD_xram_79,
    RD_xram_80,
    nondet_memwrite_choice_0, nondet_memwrite_choice_1, nondet_memwrite_choice_2,
    nondet_memwrite_choice_3, nondet_memwrite_choice_4, nondet_memwrite_choice_5,
    nondet_memwrite_choice_6, nondet_memwrite_choice_7, nondet_memwrite_choice_8,
    nondet_memwrite_choice_9, nondet_memwrite_choice_10, nondet_memwrite_choice_11,
    nondet_memwrite_choice_12, nondet_memwrite_choice_13, nondet_memwrite_choice_14,
    nondet_memwrite_choice_15, nondet_memwrite_choice_16, nondet_memwrite_choice_17,
    nondet_memwrite_choice_18, nondet_memwrite_choice_19, nondet_memwrite_choice_20,
    nondet_memwrite_choice_21, nondet_memwrite_choice_22, nondet_memwrite_choice_23,
    nondet_memwrite_choice_24, nondet_memwrite_choice_25, nondet_memwrite_choice_26,
    nondet_memwrite_choice_27, nondet_memwrite_choice_28, nondet_memwrite_choice_29,
    nondet_memwrite_choice_30, nondet_memwrite_choice_31, nondet_memwrite_choice_32,
    nondet_memwrite_choice_33, nondet_memwrite_choice_34, nondet_memwrite_choice_35,
    nondet_memwrite_choice_36, nondet_memwrite_choice_37, nondet_memwrite_choice_38,
    nondet_memwrite_choice_39, nondet_memwrite_choice_40, nondet_memwrite_choice_41,
    nondet_memwrite_choice_42, nondet_memwrite_choice_43, nondet_memwrite_choice_44,
    nondet_memwrite_choice_45, nondet_memwrite_choice_46, nondet_memwrite_choice_47,
    nondet_memwrite_choice_48, nondet_memwrite_choice_49, nondet_memwrite_choice_50,
    nondet_memwrite_choice_51, nondet_memwrite_choice_52, nondet_memwrite_choice_53,
    nondet_memwrite_choice_54, nondet_memwrite_choice_55, nondet_memwrite_choice_56,
    nondet_memwrite_choice_57, nondet_memwrite_choice_58, nondet_memwrite_choice_59,
    nondet_memwrite_choice_60, nondet_memwrite_choice_61, nondet_memwrite_choice_62,
    nondet_memwrite_choice_63, nondet_memwrite_choice_64, nondet_memwrite_choice_65,
    nondet_memwrite_choice_66, nondet_memwrite_choice_67, nondet_memwrite_choice_68,
    nondet_memwrite_choice_69, nondet_memwrite_choice_70, nondet_memwrite_choice_71,
    nondet_memwrite_choice_72, nondet_memwrite_choice_73, nondet_memwrite_choice_74,
    nondet_memwrite_choice_75, nondet_memwrite_choice_76, nondet_memwrite_choice_77,
    nondet_memwrite_choice_78, nondet_memwrite_choice_79, nondet_memwrite_choice_80,
    nondet_memwrite_choice_81, nondet_memwrite_choice_82, nondet_memwrite_choice_83,
    nondet_memwrite_choice_84, nondet_memwrite_choice_85, nondet_memwrite_choice_86,
    nondet_memwrite_choice_87, nondet_memwrite_choice_88, nondet_memwrite_choice_89,
    nondet_memwrite_choice_90, nondet_memwrite_choice_91, nondet_memwrite_choice_92,
    nondet_memwrite_choice_93, nondet_memwrite_choice_94, nondet_memwrite_choice_95,
    nondet_memwrite_choice_96, nondet_memwrite_choice_97, nondet_memwrite_choice_98,
    nondet_memwrite_choice_99, nondet_memwrite_choice_100, nondet_memwrite_choice_101,
    nondet_memwrite_choice_102, nondet_memwrite_choice_103, nondet_memwrite_choice_104,
    nondet_memwrite_choice_105, nondet_memwrite_choice_106, nondet_memwrite_choice_107,
    nondet_memwrite_choice_108, nondet_memwrite_choice_109, nondet_memwrite_choice_110,
    nondet_memwrite_choice_111, nondet_memwrite_choice_112, nondet_memwrite_choice_113,
    nondet_memwrite_choice_114, nondet_memwrite_choice_115, nondet_memwrite_choice_116,
    nondet_memwrite_choice_117, nondet_memwrite_choice_118, nondet_memwrite_choice_119,

    property_invalid_aes_state,
    property_invalid_sha_state,
    property_invalid_aes_addr,
    property_invalid_aes_len,
    property_invalid_aes_ctr,
    property_invalid_aes_key0,
    property_invalid_aes_key1,
    property_invalid_sha_rdaddr,
    property_invalid_sha_wraddr,
    property_invalid_sha_len
);

input clk, rst;

input proc_wr, proc_stb;
input [7:0] proc_data_in;
input [15:0] proc_addr;

input [63:0] input_sha_func_0;
input [63:0] input_sha_func_1;
input [31:0] input_sha_func_2;
input [63:0] input_sha_func_3;
input [63:0] input_sha_func_4;
input [31:0] input_sha_func_5;
input [63:0] input_aes_func_6;
input [63:0] input_aes_func_7;
input [63:0] input_sha_func_8;
input [63:0] input_sha_func_9;
input [31:0] input_sha_func_10;
input [63:0] input_sha_func_11;
input [63:0] input_sha_func_12;
input [31:0] input_sha_func_13;
input [63:0] input_sha_func_14;
input [63:0] input_sha_func_15;
input [31:0] input_sha_func_16;
input [63:0] input_sha_func_17;
input [63:0] input_sha_func_18;
input [31:0] input_sha_func_19;
input [63:0] input_sha_func_20;
input [63:0] input_sha_func_21;
input [31:0] input_sha_func_22;
input [63:0] input_aes_func_23;
input [63:0] input_aes_func_24;
input [63:0] input_sha_func_25;
input [63:0] input_sha_func_26;
input [31:0] input_sha_func_27;
input [63:0] input_sha_func_28;
input [63:0] input_sha_func_29;
input [31:0] input_sha_func_30;
input [63:0] input_sha_func_31;
input [63:0] input_sha_func_32;
input [31:0] input_sha_func_33;
input [63:0] input_sha_func_34;
input [63:0] input_sha_func_35;
input [31:0] input_sha_func_36;
input [63:0] input_aes_func_37;
input [63:0] input_aes_func_38;
input [63:0] input_sha_func_39;
input [63:0] input_sha_func_40;
input [31:0] input_sha_func_41;
input [63:0] input_sha_func_42;
input [63:0] input_sha_func_43;
input [31:0] input_sha_func_44;
input [63:0] input_sha_func_45;
input [63:0] input_sha_func_46;
input [31:0] input_sha_func_47;
input [63:0] input_sha_func_48;
input [63:0] input_sha_func_49;
input [31:0] input_sha_func_50;
input [63:0] input_aes_func_51;
input [63:0] input_aes_func_52;
input [63:0] input_sha_func_53;
input [63:0] input_sha_func_54;
input [31:0] input_sha_func_55;

input [7:0] RD_xram_0;
input [7:0] RD_xram_1;
input [7:0] RD_xram_2;
input [7:0] RD_xram_3;
input [7:0] RD_xram_4;
input [7:0] RD_xram_5;
input [7:0] RD_xram_6;
input [7:0] RD_xram_7;
input [7:0] RD_xram_8;
input [7:0] RD_xram_9;
input [7:0] RD_xram_10;
input [7:0] RD_xram_11;
input [7:0] RD_xram_12;
input [7:0] RD_xram_13;
input [7:0] RD_xram_14;
input [7:0] RD_xram_15;
input [7:0] RD_xram_16;
input [7:0] RD_xram_17;
input [7:0] RD_xram_18;
input [7:0] RD_xram_19;
input [7:0] RD_xram_20;
input [7:0] RD_xram_21;
input [7:0] RD_xram_22;
input [7:0] RD_xram_23;
input [7:0] RD_xram_24;
input [7:0] RD_xram_25;
input [7:0] RD_xram_26;
input [7:0] RD_xram_27;
input [7:0] RD_xram_28;
input [7:0] RD_xram_29;
input [7:0] RD_xram_30;
input [7:0] RD_xram_31;
input [7:0] RD_xram_32;
input [7:0] RD_xram_33;
input [7:0] RD_xram_34;
input [7:0] RD_xram_35;
input [7:0] RD_xram_36;
input [7:0] RD_xram_37;
input [7:0] RD_xram_38;
input [7:0] RD_xram_39;
input [7:0] RD_xram_40;
input [7:0] RD_xram_41;
input [7:0] RD_xram_42;
input [7:0] RD_xram_43;
input [7:0] RD_xram_44;
input [7:0] RD_xram_45;
input [7:0] RD_xram_46;
input [7:0] RD_xram_47;
input [7:0] RD_xram_48;
input [7:0] RD_xram_49;
input [7:0] RD_xram_50;
input [7:0] RD_xram_51;
input [7:0] RD_xram_52;
input [7:0] RD_xram_53;
input [7:0] RD_xram_54;
input [7:0] RD_xram_55;
input [7:0] RD_xram_56;
input [7:0] RD_xram_57;
input [7:0] RD_xram_58;
input [7:0] RD_xram_59;
input [7:0] RD_xram_60;
input [7:0] RD_xram_61;
input [7:0] RD_xram_62;
input [7:0] RD_xram_63;
input [7:0] RD_xram_64;
input [7:0] RD_xram_65;
input [7:0] RD_xram_66;
input [7:0] RD_xram_67;
input [7:0] RD_xram_68;
input [7:0] RD_xram_69;
input [7:0] RD_xram_70;
input [7:0] RD_xram_71;
input [7:0] RD_xram_72;
input [7:0] RD_xram_73;
input [7:0] RD_xram_74;
input [7:0] RD_xram_75;
input [7:0] RD_xram_76;
input [7:0] RD_xram_77;
input [7:0] RD_xram_78;
input [7:0] RD_xram_79;
input [7:0] RD_xram_80;

input nondet_memwrite_choice_0;
input nondet_memwrite_choice_1;
input nondet_memwrite_choice_2;
input nondet_memwrite_choice_3;
input nondet_memwrite_choice_4;
input nondet_memwrite_choice_5;
input nondet_memwrite_choice_6;
input nondet_memwrite_choice_7;
input nondet_memwrite_choice_8;
input nondet_memwrite_choice_9;
input nondet_memwrite_choice_10;
input nondet_memwrite_choice_11;
input nondet_memwrite_choice_12;
input nondet_memwrite_choice_13;
input nondet_memwrite_choice_14;
input nondet_memwrite_choice_15;
input nondet_memwrite_choice_16;
input nondet_memwrite_choice_17;
input nondet_memwrite_choice_18;
input nondet_memwrite_choice_19;
input nondet_memwrite_choice_20;
input nondet_memwrite_choice_21;
input nondet_memwrite_choice_22;
input nondet_memwrite_choice_23;
input nondet_memwrite_choice_24;
input nondet_memwrite_choice_25;
input nondet_memwrite_choice_26;
input nondet_memwrite_choice_27;
input nondet_memwrite_choice_28;
input nondet_memwrite_choice_29;
input nondet_memwrite_choice_30;
input nondet_memwrite_choice_31;
input nondet_memwrite_choice_32;
input nondet_memwrite_choice_33;
input nondet_memwrite_choice_34;
input nondet_memwrite_choice_35;
input nondet_memwrite_choice_36;
input nondet_memwrite_choice_37;
input nondet_memwrite_choice_38;
input nondet_memwrite_choice_39;
input nondet_memwrite_choice_40;
input nondet_memwrite_choice_41;
input nondet_memwrite_choice_42;
input nondet_memwrite_choice_43;
input nondet_memwrite_choice_44;
input nondet_memwrite_choice_45;
input nondet_memwrite_choice_46;
input nondet_memwrite_choice_47;
input nondet_memwrite_choice_48;
input nondet_memwrite_choice_49;
input nondet_memwrite_choice_50;
input nondet_memwrite_choice_51;
input nondet_memwrite_choice_52;
input nondet_memwrite_choice_53;
input nondet_memwrite_choice_54;
input nondet_memwrite_choice_55;
input nondet_memwrite_choice_56;
input nondet_memwrite_choice_57;
input nondet_memwrite_choice_58;
input nondet_memwrite_choice_59;
input nondet_memwrite_choice_60;
input nondet_memwrite_choice_61;
input nondet_memwrite_choice_62;
input nondet_memwrite_choice_63;
input nondet_memwrite_choice_64;
input nondet_memwrite_choice_65;
input nondet_memwrite_choice_66;
input nondet_memwrite_choice_67;
input nondet_memwrite_choice_68;
input nondet_memwrite_choice_69;
input nondet_memwrite_choice_70;
input nondet_memwrite_choice_71;
input nondet_memwrite_choice_72;
input nondet_memwrite_choice_73;
input nondet_memwrite_choice_74;
input nondet_memwrite_choice_75;
input nondet_memwrite_choice_76;
input nondet_memwrite_choice_77;
input nondet_memwrite_choice_78;
input nondet_memwrite_choice_79;
input nondet_memwrite_choice_80;
input nondet_memwrite_choice_81;
input nondet_memwrite_choice_82;
input nondet_memwrite_choice_83;
input nondet_memwrite_choice_84;
input nondet_memwrite_choice_85;
input nondet_memwrite_choice_86;
input nondet_memwrite_choice_87;
input nondet_memwrite_choice_88;
input nondet_memwrite_choice_89;
input nondet_memwrite_choice_90;
input nondet_memwrite_choice_91;
input nondet_memwrite_choice_92;
input nondet_memwrite_choice_93;
input nondet_memwrite_choice_94;
input nondet_memwrite_choice_95;
input nondet_memwrite_choice_96;
input nondet_memwrite_choice_97;
input nondet_memwrite_choice_98;
input nondet_memwrite_choice_99;
input nondet_memwrite_choice_100;
input nondet_memwrite_choice_101;
input nondet_memwrite_choice_102;
input nondet_memwrite_choice_103;
input nondet_memwrite_choice_104;
input nondet_memwrite_choice_105;
input nondet_memwrite_choice_106;
input nondet_memwrite_choice_107;
input nondet_memwrite_choice_108;
input nondet_memwrite_choice_109;
input nondet_memwrite_choice_110;
input nondet_memwrite_choice_111;
input nondet_memwrite_choice_112;
input nondet_memwrite_choice_113;
input nondet_memwrite_choice_114;
input nondet_memwrite_choice_115;
input nondet_memwrite_choice_116;
input nondet_memwrite_choice_117;
input nondet_memwrite_choice_118;
input nondet_memwrite_choice_119;

output property_invalid_aes_state;
output property_invalid_sha_state;
output property_invalid_aes_addr;
output property_invalid_aes_len;
output property_invalid_aes_ctr;
output property_invalid_aes_key0;
output property_invalid_aes_key1;
output property_invalid_sha_rdaddr;
output property_invalid_sha_wraddr;
output property_invalid_sha_len;

wire [3:0] op;
wire [15:0] addrin;
wire [7:0] datain;

wire [7:0] proc_data_out;
wire proc_ack;

reg proc_stb_r, proc_stb_valid;
wire proc_stb_valid_next = (!(proc_stb_r && !proc_stb && !proc_ack));
wire wr_en = proc_wr  && proc_stb && proc_ack;
wire rd_en = !proc_wr && proc_stb && proc_ack;

wire [1:0] aes_state_impl, sha_state_impl;
wire sha_step, aes_step, sha_core_assumps_valid;

always @(posedge clk)
begin
    if (rst) begin
        proc_stb_r      <= 0;
        proc_stb_valid  <= 1;
    end
    else begin
        proc_stb_r     <= proc_stb;
        proc_stb_valid <= proc_stb_valid ? proc_stb_valid_next : 0;
    end
end

wire [15:0] aes_addr_impl, aes_len_impl, sha_rdaddr_impl, sha_wraddr_impl, sha_len_impl;
wire [15:0] aes_addr_gm, aes_len_gm, sha_rdaddr_gm, sha_wraddr_gm, sha_len_gm;
wire [127:0] aes_ctr_gm, aes_key0_gm, aes_key1_gm;
wire [127:0] aes_ctr_impl, aes_key0_impl, aes_key1_impl;

oc8051_xiommu oc8051_xiommu_impl_1 (
    .clk                    ( clk                    ) ,
    .rst                    ( rst                    ) ,
    .proc_wr                ( proc_wr                ) ,
    .proc_addr              ( proc_addr              ) ,
    .proc_data_in           ( proc_data_in           ) ,
    .proc_data_out          ( proc_data_out          ) ,
    .proc_ack               ( proc_ack               ) ,
    .proc_stb               ( proc_stb               ) ,
    .aes_state              ( aes_state_impl         ) ,
    .sha_state              ( sha_state_impl         ) ,
    .aes_step               ( aes_step               ) ,
    .sha_step               ( sha_step               ) ,
    .sha_core_assumps_valid ( sha_core_assumps_valid ) ,
    .aes_addr               ( aes_addr_impl          ) ,
    .aes_len                ( aes_len_impl           ) ,
    .sha_rdaddr             ( sha_rdaddr_impl        ) ,
    .sha_wraddr             ( sha_wraddr_impl        ) ,
    .sha_len                ( sha_len_impl           ) ,
    .aes_ctr                ( aes_ctr_impl           ) ,
    .aes_key0               ( aes_key0_impl          ) ,
    .aes_key1               ( aes_key1_impl          ) 
);

wire pr_valid = proc_stb_valid && proc_stb_valid_next && sha_core_assumps_valid;

assign op = {wr_en, rd_en, sha_step, aes_step};
assign addrin = proc_addr;
assign datain = proc_data_in;

wire [7:0] aes_state_gm, aes_state_next_gm;
wire [7:0] sha_state_gm, sha_state_next_gm;

wire property_invalid_aes_state  = pr_valid &&  ( aes_state_gm[1:0] != aes_state_impl ) ;
wire property_invalid_sha_state  = pr_valid &&  ( sha_state_gm[1:0] != sha_state_impl ) ;
wire property_invalid_aes_addr   = pr_valid &&  ( aes_addr_impl     != aes_addr_gm    ) ;
wire property_invalid_aes_ctr    = pr_valid &&  ( aes_ctr_impl      != aes_ctr_gm     ) ;
wire property_invalid_aes_key0   = pr_valid &&  ( aes_key0_impl     != aes_key0_gm    ) ;
wire property_invalid_aes_key1   = pr_valid &&  ( aes_key1_impl     != aes_key1_gm    ) ;
wire property_invalid_aes_len    = pr_valid &&  ( aes_len_impl      != aes_len_gm     ) ;
wire property_invalid_sha_rdaddr = pr_valid &&  ( sha_rdaddr_impl   != sha_rdaddr_gm  ) ;
wire property_invalid_sha_wraddr = pr_valid &&  ( sha_wraddr_impl   != sha_wraddr_gm  ) ;
wire property_invalid_sha_len    = pr_valid &&  ( sha_len_impl      != sha_len_gm     ) ;

xm8051_golden_model xm8051_golden_model_1(
    .clk                        ( clk                        ),
    .rst                        ( rst                        ),
    .step                       ( 1'b1                       ),
// don't want these bogus signals
/*  
    .RD_xram_0_ADDR             ( RD_xram_0_ADDR             ),
    .RD_xram_1_ADDR             ( RD_xram_1_ADDR             ),
    .RD_xram_2_ADDR             ( RD_xram_2_ADDR             ),
    .RD_xram_3_ADDR             ( RD_xram_3_ADDR             ),
    .RD_xram_4_ADDR             ( RD_xram_4_ADDR             ),
    .RD_xram_5_ADDR             ( RD_xram_5_ADDR             ),
    .RD_xram_6_ADDR             ( RD_xram_6_ADDR             ),
    .RD_xram_7_ADDR             ( RD_xram_7_ADDR             ),
    .RD_xram_8_ADDR             ( RD_xram_8_ADDR             ),
    .RD_xram_9_ADDR             ( RD_xram_9_ADDR             ),
    .RD_xram_10_ADDR            ( RD_xram_10_ADDR            ),
    .RD_xram_11_ADDR            ( RD_xram_11_ADDR            ),
    .RD_xram_12_ADDR            ( RD_xram_12_ADDR            ),
    .RD_xram_13_ADDR            ( RD_xram_13_ADDR            ),
    .RD_xram_14_ADDR            ( RD_xram_14_ADDR            ),
    .RD_xram_15_ADDR            ( RD_xram_15_ADDR            ),
    .RD_xram_16_ADDR            ( RD_xram_16_ADDR            ),
    .RD_xram_17_ADDR            ( RD_xram_17_ADDR            ),
    .RD_xram_18_ADDR            ( RD_xram_18_ADDR            ),
    .RD_xram_19_ADDR            ( RD_xram_19_ADDR            ),
    .RD_xram_20_ADDR            ( RD_xram_20_ADDR            ),
    .RD_xram_21_ADDR            ( RD_xram_21_ADDR            ),
    .RD_xram_22_ADDR            ( RD_xram_22_ADDR            ),
    .RD_xram_23_ADDR            ( RD_xram_23_ADDR            ),
    .RD_xram_24_ADDR            ( RD_xram_24_ADDR            ),
    .RD_xram_25_ADDR            ( RD_xram_25_ADDR            ),
    .RD_xram_26_ADDR            ( RD_xram_26_ADDR            ),
    .RD_xram_27_ADDR            ( RD_xram_27_ADDR            ),
    .RD_xram_28_ADDR            ( RD_xram_28_ADDR            ),
    .RD_xram_29_ADDR            ( RD_xram_29_ADDR            ),
    .RD_xram_30_ADDR            ( RD_xram_30_ADDR            ),
    .RD_xram_31_ADDR            ( RD_xram_31_ADDR            ),
    .RD_xram_32_ADDR            ( RD_xram_32_ADDR            ),
    .RD_xram_33_ADDR            ( RD_xram_33_ADDR            ),
    .RD_xram_34_ADDR            ( RD_xram_34_ADDR            ),
    .RD_xram_35_ADDR            ( RD_xram_35_ADDR            ),
    .RD_xram_36_ADDR            ( RD_xram_36_ADDR            ),
    .RD_xram_37_ADDR            ( RD_xram_37_ADDR            ),
    .RD_xram_38_ADDR            ( RD_xram_38_ADDR            ),
    .RD_xram_39_ADDR            ( RD_xram_39_ADDR            ),
    .RD_xram_40_ADDR            ( RD_xram_40_ADDR            ),
    .RD_xram_41_ADDR            ( RD_xram_41_ADDR            ),
    .RD_xram_42_ADDR            ( RD_xram_42_ADDR            ),
    .RD_xram_43_ADDR            ( RD_xram_43_ADDR            ),
    .RD_xram_44_ADDR            ( RD_xram_44_ADDR            ),
    .RD_xram_45_ADDR            ( RD_xram_45_ADDR            ),
    .RD_xram_46_ADDR            ( RD_xram_46_ADDR            ),
    .RD_xram_47_ADDR            ( RD_xram_47_ADDR            ),
    .RD_xram_48_ADDR            ( RD_xram_48_ADDR            ),
    .RD_xram_49_ADDR            ( RD_xram_49_ADDR            ),
    .RD_xram_50_ADDR            ( RD_xram_50_ADDR            ),
    .RD_xram_51_ADDR            ( RD_xram_51_ADDR            ),
    .RD_xram_52_ADDR            ( RD_xram_52_ADDR            ),
    .RD_xram_53_ADDR            ( RD_xram_53_ADDR            ),
    .RD_xram_54_ADDR            ( RD_xram_54_ADDR            ),
    .RD_xram_55_ADDR            ( RD_xram_55_ADDR            ),
    .RD_xram_56_ADDR            ( RD_xram_56_ADDR            ),
    .RD_xram_57_ADDR            ( RD_xram_57_ADDR            ),
    .RD_xram_58_ADDR            ( RD_xram_58_ADDR            ),
    .RD_xram_59_ADDR            ( RD_xram_59_ADDR            ),
    .RD_xram_60_ADDR            ( RD_xram_60_ADDR            ),
    .RD_xram_61_ADDR            ( RD_xram_61_ADDR            ),
    .RD_xram_62_ADDR            ( RD_xram_62_ADDR            ),
    .RD_xram_63_ADDR            ( RD_xram_63_ADDR            ),
    .RD_xram_64_ADDR            ( RD_xram_64_ADDR            ),
    .RD_xram_65_ADDR            ( RD_xram_65_ADDR            ),
    .RD_xram_66_ADDR            ( RD_xram_66_ADDR            ),
    .RD_xram_67_ADDR            ( RD_xram_67_ADDR            ),
    .RD_xram_68_ADDR            ( RD_xram_68_ADDR            ),
    .RD_xram_69_ADDR            ( RD_xram_69_ADDR            ),
    .RD_xram_70_ADDR            ( RD_xram_70_ADDR            ),
    .RD_xram_71_ADDR            ( RD_xram_71_ADDR            ),
    .RD_xram_72_ADDR            ( RD_xram_72_ADDR            ),
    .RD_xram_73_ADDR            ( RD_xram_73_ADDR            ),
    .RD_xram_74_ADDR            ( RD_xram_74_ADDR            ),
    .RD_xram_75_ADDR            ( RD_xram_75_ADDR            ),
    .RD_xram_76_ADDR            ( RD_xram_76_ADDR            ),
    .RD_xram_77_ADDR            ( RD_xram_77_ADDR            ),
    .RD_xram_78_ADDR            ( RD_xram_78_ADDR            ),
    .RD_xram_79_ADDR            ( RD_xram_79_ADDR            ),
    .RD_xram_80_ADDR            ( RD_xram_80_ADDR            ),
    .sha_read_data              ( sha_read_data              ),
    .sha_read_data_next         ( sha_read_data_next         ),
    .aes_read_data              ( aes_read_data              ),
    .aes_read_data_next         ( aes_read_data_next         ),
    .sha_rdaddr                 ( sha_rdaddr                 ),
    .sha_rdaddr_next            ( sha_rdaddr_next            ),
    .aes_addr                   ( aes_addr                   ),
    .aes_addr_next              ( aes_addr_next              ),
    .aes_ctr                    ( aes_ctr                    ),
    .aes_ctr_next               ( aes_ctr_next               ),
    .aes_bytes_processed        ( aes_bytes_processed        ),
    .aes_bytes_processed_next   ( aes_bytes_processed_next   ),
    .sha_len                    ( sha_len                    ),
    .sha_len_next               ( sha_len_next               ),
    .aes_key1                   ( aes_key1                   ),
    .aes_key1_next              ( aes_key1_next              ),
    .aes_key0                   ( aes_key0                   ),
    .aes_key0_next              ( aes_key0_next              ),
    .aes_len                    ( aes_len                    ),
    .aes_len_next               ( aes_len_next               ),
    .sha_bytes_processed        ( sha_bytes_processed        ),
    .sha_bytes_processed_next   ( sha_bytes_processed_next   ),
    .sha_wraddr                 ( sha_wraddr                 ),
    .sha_wraddr_next            ( sha_wraddr_next            ),
    .dataout                    ( dataout                    ),
    .dataout_next               ( dataout_next               ),
    .WR_XRAM_ADDR               ( WR_XRAM_ADDR               ),
    .WR_XRAM_ADDR_next          ( WR_XRAM_ADDR_next          ),
    .WR_XRAM_EN                 ( WR_XRAM_EN                 ),
    .WR_XRAM_EN_next            ( WR_XRAM_EN_next            ),
*/
    .aes_ctr                    ( aes_ctr_gm                 ),
    .aes_key0                   ( aes_key0_gm                ),
    .aes_key1                   ( aes_key1_gm                ),
    .aes_addr                   ( aes_addr_gm                ),
    .aes_len                    ( aes_len_gm                 ),
    .sha_rdaddr                 ( sha_rdaddr_gm              ),
    .sha_len                    ( sha_len_gm                 ),
    .sha_wraddr                 ( sha_wraddr_gm              ),

    .aes_state                  ( aes_state_gm               ),
    .aes_state_next             ( aes_state_next_gm          ),
    .sha_state                  ( sha_state_gm               ),
    .sha_state_next             ( sha_state_next_gm          ),
    .op                         ( op                         ),
    .addrin                     ( addrin                     ),
    .datain                     ( datain                     ),
    .input_sha_func_0           ( input_sha_func_0           ),
    .input_sha_func_1           ( input_sha_func_1           ),
    .input_sha_func_2           ( input_sha_func_2           ),
    .input_sha_func_3           ( input_sha_func_3           ),
    .input_sha_func_4           ( input_sha_func_4           ),
    .input_sha_func_5           ( input_sha_func_5           ),
    .input_aes_func_6           ( input_aes_func_6           ),
    .input_aes_func_7           ( input_aes_func_7           ),
    .input_sha_func_8           ( input_sha_func_8           ),
    .input_sha_func_9           ( input_sha_func_9           ),
    .input_sha_func_10          ( input_sha_func_10          ),
    .input_sha_func_11          ( input_sha_func_11          ),
    .input_sha_func_12          ( input_sha_func_12          ),
    .input_sha_func_13          ( input_sha_func_13          ),
    .input_sha_func_14          ( input_sha_func_14          ),
    .input_sha_func_15          ( input_sha_func_15          ),
    .input_sha_func_16          ( input_sha_func_16          ),
    .input_sha_func_17          ( input_sha_func_17          ),
    .input_sha_func_18          ( input_sha_func_18          ),
    .input_sha_func_19          ( input_sha_func_19          ),
    .input_sha_func_20          ( input_sha_func_20          ),
    .input_sha_func_21          ( input_sha_func_21          ),
    .input_sha_func_22          ( input_sha_func_22          ),
    .input_aes_func_23          ( input_aes_func_23          ),
    .input_aes_func_24          ( input_aes_func_24          ),
    .input_sha_func_25          ( input_sha_func_25          ),
    .input_sha_func_26          ( input_sha_func_26          ),
    .input_sha_func_27          ( input_sha_func_27          ),
    .input_sha_func_28          ( input_sha_func_28          ),
    .input_sha_func_29          ( input_sha_func_29          ),
    .input_sha_func_30          ( input_sha_func_30          ),
    .input_sha_func_31          ( input_sha_func_31          ),
    .input_sha_func_32          ( input_sha_func_32          ),
    .input_sha_func_33          ( input_sha_func_33          ),
    .input_sha_func_34          ( input_sha_func_34          ),
    .input_sha_func_35          ( input_sha_func_35          ),
    .input_sha_func_36          ( input_sha_func_36          ),
    .input_aes_func_37          ( input_aes_func_37          ),
    .input_aes_func_38          ( input_aes_func_38          ),
    .input_sha_func_39          ( input_sha_func_39          ),
    .input_sha_func_40          ( input_sha_func_40          ),
    .input_sha_func_41          ( input_sha_func_41          ),
    .input_sha_func_42          ( input_sha_func_42          ),
    .input_sha_func_43          ( input_sha_func_43          ),
    .input_sha_func_44          ( input_sha_func_44          ),
    .input_sha_func_45          ( input_sha_func_45          ),
    .input_sha_func_46          ( input_sha_func_46          ),
    .input_sha_func_47          ( input_sha_func_47          ),
    .input_sha_func_48          ( input_sha_func_48          ),
    .input_sha_func_49          ( input_sha_func_49          ),
    .input_sha_func_50          ( input_sha_func_50          ),
    .input_aes_func_51          ( input_aes_func_51          ),
    .input_aes_func_52          ( input_aes_func_52          ),
    .input_sha_func_53          ( input_sha_func_53          ),
    .input_sha_func_54          ( input_sha_func_54          ),
    .input_sha_func_55          ( input_sha_func_55          ),
    .RD_xram_0                  ( RD_xram_0                  ),
    .RD_xram_1                  ( RD_xram_1                  ),
    .RD_xram_2                  ( RD_xram_2                  ),
    .RD_xram_3                  ( RD_xram_3                  ),
    .RD_xram_4                  ( RD_xram_4                  ),
    .RD_xram_5                  ( RD_xram_5                  ),
    .RD_xram_6                  ( RD_xram_6                  ),
    .RD_xram_7                  ( RD_xram_7                  ),
    .RD_xram_8                  ( RD_xram_8                  ),
    .RD_xram_9                  ( RD_xram_9                  ),
    .RD_xram_10                 ( RD_xram_10                 ),
    .RD_xram_11                 ( RD_xram_11                 ),
    .RD_xram_12                 ( RD_xram_12                 ),
    .RD_xram_13                 ( RD_xram_13                 ),
    .RD_xram_14                 ( RD_xram_14                 ),
    .RD_xram_15                 ( RD_xram_15                 ),
    .RD_xram_16                 ( RD_xram_16                 ),
    .RD_xram_17                 ( RD_xram_17                 ),
    .RD_xram_18                 ( RD_xram_18                 ),
    .RD_xram_19                 ( RD_xram_19                 ),
    .RD_xram_20                 ( RD_xram_20                 ),
    .RD_xram_21                 ( RD_xram_21                 ),
    .RD_xram_22                 ( RD_xram_22                 ),
    .RD_xram_23                 ( RD_xram_23                 ),
    .RD_xram_24                 ( RD_xram_24                 ),
    .RD_xram_25                 ( RD_xram_25                 ),
    .RD_xram_26                 ( RD_xram_26                 ),
    .RD_xram_27                 ( RD_xram_27                 ),
    .RD_xram_28                 ( RD_xram_28                 ),
    .RD_xram_29                 ( RD_xram_29                 ),
    .RD_xram_30                 ( RD_xram_30                 ),
    .RD_xram_31                 ( RD_xram_31                 ),
    .RD_xram_32                 ( RD_xram_32                 ),
    .RD_xram_33                 ( RD_xram_33                 ),
    .RD_xram_34                 ( RD_xram_34                 ),
    .RD_xram_35                 ( RD_xram_35                 ),
    .RD_xram_36                 ( RD_xram_36                 ),
    .RD_xram_37                 ( RD_xram_37                 ),
    .RD_xram_38                 ( RD_xram_38                 ),
    .RD_xram_39                 ( RD_xram_39                 ),
    .RD_xram_40                 ( RD_xram_40                 ),
    .RD_xram_41                 ( RD_xram_41                 ),
    .RD_xram_42                 ( RD_xram_42                 ),
    .RD_xram_43                 ( RD_xram_43                 ),
    .RD_xram_44                 ( RD_xram_44                 ),
    .RD_xram_45                 ( RD_xram_45                 ),
    .RD_xram_46                 ( RD_xram_46                 ),
    .RD_xram_47                 ( RD_xram_47                 ),
    .RD_xram_48                 ( RD_xram_48                 ),
    .RD_xram_49                 ( RD_xram_49                 ),
    .RD_xram_50                 ( RD_xram_50                 ),
    .RD_xram_51                 ( RD_xram_51                 ),
    .RD_xram_52                 ( RD_xram_52                 ),
    .RD_xram_53                 ( RD_xram_53                 ),
    .RD_xram_54                 ( RD_xram_54                 ),
    .RD_xram_55                 ( RD_xram_55                 ),
    .RD_xram_56                 ( RD_xram_56                 ),
    .RD_xram_57                 ( RD_xram_57                 ),
    .RD_xram_58                 ( RD_xram_58                 ),
    .RD_xram_59                 ( RD_xram_59                 ),
    .RD_xram_60                 ( RD_xram_60                 ),
    .RD_xram_61                 ( RD_xram_61                 ),
    .RD_xram_62                 ( RD_xram_62                 ),
    .RD_xram_63                 ( RD_xram_63                 ),
    .RD_xram_64                 ( RD_xram_64                 ),
    .RD_xram_65                 ( RD_xram_65                 ),
    .RD_xram_66                 ( RD_xram_66                 ),
    .RD_xram_67                 ( RD_xram_67                 ),
    .RD_xram_68                 ( RD_xram_68                 ),
    .RD_xram_69                 ( RD_xram_69                 ),
    .RD_xram_70                 ( RD_xram_70                 ),
    .RD_xram_71                 ( RD_xram_71                 ),
    .RD_xram_72                 ( RD_xram_72                 ),
    .RD_xram_73                 ( RD_xram_73                 ),
    .RD_xram_74                 ( RD_xram_74                 ),
    .RD_xram_75                 ( RD_xram_75                 ),
    .RD_xram_76                 ( RD_xram_76                 ),
    .RD_xram_77                 ( RD_xram_77                 ),
    .RD_xram_78                 ( RD_xram_78                 ),
    .RD_xram_79                 ( RD_xram_79                 ),
    .RD_xram_80                 ( RD_xram_80                 ),
    .nondet_memwrite_choice_0   ( nondet_memwrite_choice_0   ),
    .nondet_memwrite_choice_1   ( nondet_memwrite_choice_1   ),
    .nondet_memwrite_choice_2   ( nondet_memwrite_choice_2   ),
    .nondet_memwrite_choice_3   ( nondet_memwrite_choice_3   ),
    .nondet_memwrite_choice_4   ( nondet_memwrite_choice_4   ),
    .nondet_memwrite_choice_5   ( nondet_memwrite_choice_5   ),
    .nondet_memwrite_choice_6   ( nondet_memwrite_choice_6   ),
    .nondet_memwrite_choice_7   ( nondet_memwrite_choice_7   ),
    .nondet_memwrite_choice_8   ( nondet_memwrite_choice_8   ),
    .nondet_memwrite_choice_9   ( nondet_memwrite_choice_9   ),
    .nondet_memwrite_choice_10  ( nondet_memwrite_choice_10  ),
    .nondet_memwrite_choice_11  ( nondet_memwrite_choice_11  ),
    .nondet_memwrite_choice_12  ( nondet_memwrite_choice_12  ),
    .nondet_memwrite_choice_13  ( nondet_memwrite_choice_13  ),
    .nondet_memwrite_choice_14  ( nondet_memwrite_choice_14  ),
    .nondet_memwrite_choice_15  ( nondet_memwrite_choice_15  ),
    .nondet_memwrite_choice_16  ( nondet_memwrite_choice_16  ),
    .nondet_memwrite_choice_17  ( nondet_memwrite_choice_17  ),
    .nondet_memwrite_choice_18  ( nondet_memwrite_choice_18  ),
    .nondet_memwrite_choice_19  ( nondet_memwrite_choice_19  ),
    .nondet_memwrite_choice_20  ( nondet_memwrite_choice_20  ),
    .nondet_memwrite_choice_21  ( nondet_memwrite_choice_21  ),
    .nondet_memwrite_choice_22  ( nondet_memwrite_choice_22  ),
    .nondet_memwrite_choice_23  ( nondet_memwrite_choice_23  ),
    .nondet_memwrite_choice_24  ( nondet_memwrite_choice_24  ),
    .nondet_memwrite_choice_25  ( nondet_memwrite_choice_25  ),
    .nondet_memwrite_choice_26  ( nondet_memwrite_choice_26  ),
    .nondet_memwrite_choice_27  ( nondet_memwrite_choice_27  ),
    .nondet_memwrite_choice_28  ( nondet_memwrite_choice_28  ),
    .nondet_memwrite_choice_29  ( nondet_memwrite_choice_29  ),
    .nondet_memwrite_choice_30  ( nondet_memwrite_choice_30  ),
    .nondet_memwrite_choice_31  ( nondet_memwrite_choice_31  ),
    .nondet_memwrite_choice_32  ( nondet_memwrite_choice_32  ),
    .nondet_memwrite_choice_33  ( nondet_memwrite_choice_33  ),
    .nondet_memwrite_choice_34  ( nondet_memwrite_choice_34  ),
    .nondet_memwrite_choice_35  ( nondet_memwrite_choice_35  ),
    .nondet_memwrite_choice_36  ( nondet_memwrite_choice_36  ),
    .nondet_memwrite_choice_37  ( nondet_memwrite_choice_37  ),
    .nondet_memwrite_choice_38  ( nondet_memwrite_choice_38  ),
    .nondet_memwrite_choice_39  ( nondet_memwrite_choice_39  ),
    .nondet_memwrite_choice_40  ( nondet_memwrite_choice_40  ),
    .nondet_memwrite_choice_41  ( nondet_memwrite_choice_41  ),
    .nondet_memwrite_choice_42  ( nondet_memwrite_choice_42  ),
    .nondet_memwrite_choice_43  ( nondet_memwrite_choice_43  ),
    .nondet_memwrite_choice_44  ( nondet_memwrite_choice_44  ),
    .nondet_memwrite_choice_45  ( nondet_memwrite_choice_45  ),
    .nondet_memwrite_choice_46  ( nondet_memwrite_choice_46  ),
    .nondet_memwrite_choice_47  ( nondet_memwrite_choice_47  ),
    .nondet_memwrite_choice_48  ( nondet_memwrite_choice_48  ),
    .nondet_memwrite_choice_49  ( nondet_memwrite_choice_49  ),
    .nondet_memwrite_choice_50  ( nondet_memwrite_choice_50  ),
    .nondet_memwrite_choice_51  ( nondet_memwrite_choice_51  ),
    .nondet_memwrite_choice_52  ( nondet_memwrite_choice_52  ),
    .nondet_memwrite_choice_53  ( nondet_memwrite_choice_53  ),
    .nondet_memwrite_choice_54  ( nondet_memwrite_choice_54  ),
    .nondet_memwrite_choice_55  ( nondet_memwrite_choice_55  ),
    .nondet_memwrite_choice_56  ( nondet_memwrite_choice_56  ),
    .nondet_memwrite_choice_57  ( nondet_memwrite_choice_57  ),
    .nondet_memwrite_choice_58  ( nondet_memwrite_choice_58  ),
    .nondet_memwrite_choice_59  ( nondet_memwrite_choice_59  ),
    .nondet_memwrite_choice_60  ( nondet_memwrite_choice_60  ),
    .nondet_memwrite_choice_61  ( nondet_memwrite_choice_61  ),
    .nondet_memwrite_choice_62  ( nondet_memwrite_choice_62  ),
    .nondet_memwrite_choice_63  ( nondet_memwrite_choice_63  ),
    .nondet_memwrite_choice_64  ( nondet_memwrite_choice_64  ),
    .nondet_memwrite_choice_65  ( nondet_memwrite_choice_65  ),
    .nondet_memwrite_choice_66  ( nondet_memwrite_choice_66  ),
    .nondet_memwrite_choice_67  ( nondet_memwrite_choice_67  ),
    .nondet_memwrite_choice_68  ( nondet_memwrite_choice_68  ),
    .nondet_memwrite_choice_69  ( nondet_memwrite_choice_69  ),
    .nondet_memwrite_choice_70  ( nondet_memwrite_choice_70  ),
    .nondet_memwrite_choice_71  ( nondet_memwrite_choice_71  ),
    .nondet_memwrite_choice_72  ( nondet_memwrite_choice_72  ),
    .nondet_memwrite_choice_73  ( nondet_memwrite_choice_73  ),
    .nondet_memwrite_choice_74  ( nondet_memwrite_choice_74  ),
    .nondet_memwrite_choice_75  ( nondet_memwrite_choice_75  ),
    .nondet_memwrite_choice_76  ( nondet_memwrite_choice_76  ),
    .nondet_memwrite_choice_77  ( nondet_memwrite_choice_77  ),
    .nondet_memwrite_choice_78  ( nondet_memwrite_choice_78  ),
    .nondet_memwrite_choice_79  ( nondet_memwrite_choice_79  ),
    .nondet_memwrite_choice_80  ( nondet_memwrite_choice_80  ),
    .nondet_memwrite_choice_81  ( nondet_memwrite_choice_81  ),
    .nondet_memwrite_choice_82  ( nondet_memwrite_choice_82  ),
    .nondet_memwrite_choice_83  ( nondet_memwrite_choice_83  ),
    .nondet_memwrite_choice_84  ( nondet_memwrite_choice_84  ),
    .nondet_memwrite_choice_85  ( nondet_memwrite_choice_85  ),
    .nondet_memwrite_choice_86  ( nondet_memwrite_choice_86  ),
    .nondet_memwrite_choice_87  ( nondet_memwrite_choice_87  ),
    .nondet_memwrite_choice_88  ( nondet_memwrite_choice_88  ),
    .nondet_memwrite_choice_89  ( nondet_memwrite_choice_89  ),
    .nondet_memwrite_choice_90  ( nondet_memwrite_choice_90  ),
    .nondet_memwrite_choice_91  ( nondet_memwrite_choice_91  ),
    .nondet_memwrite_choice_92  ( nondet_memwrite_choice_92  ),
    .nondet_memwrite_choice_93  ( nondet_memwrite_choice_93  ),
    .nondet_memwrite_choice_94  ( nondet_memwrite_choice_94  ),
    .nondet_memwrite_choice_95  ( nondet_memwrite_choice_95  ),
    .nondet_memwrite_choice_96  ( nondet_memwrite_choice_96  ),
    .nondet_memwrite_choice_97  ( nondet_memwrite_choice_97  ),
    .nondet_memwrite_choice_98  ( nondet_memwrite_choice_98  ),
    .nondet_memwrite_choice_99  ( nondet_memwrite_choice_99  ),
    .nondet_memwrite_choice_100 ( nondet_memwrite_choice_100 ),
    .nondet_memwrite_choice_101 ( nondet_memwrite_choice_101 ),
    .nondet_memwrite_choice_102 ( nondet_memwrite_choice_102 ),
    .nondet_memwrite_choice_103 ( nondet_memwrite_choice_103 ),
    .nondet_memwrite_choice_104 ( nondet_memwrite_choice_104 ),
    .nondet_memwrite_choice_105 ( nondet_memwrite_choice_105 ),
    .nondet_memwrite_choice_106 ( nondet_memwrite_choice_106 ),
    .nondet_memwrite_choice_107 ( nondet_memwrite_choice_107 ),
    .nondet_memwrite_choice_108 ( nondet_memwrite_choice_108 ),
    .nondet_memwrite_choice_109 ( nondet_memwrite_choice_109 ),
    .nondet_memwrite_choice_110 ( nondet_memwrite_choice_110 ),
    .nondet_memwrite_choice_111 ( nondet_memwrite_choice_111 ),
    .nondet_memwrite_choice_112 ( nondet_memwrite_choice_112 ),
    .nondet_memwrite_choice_113 ( nondet_memwrite_choice_113 ),
    .nondet_memwrite_choice_114 ( nondet_memwrite_choice_114 ),
    .nondet_memwrite_choice_115 ( nondet_memwrite_choice_115 ),
    .nondet_memwrite_choice_116 ( nondet_memwrite_choice_116 ),
    .nondet_memwrite_choice_117 ( nondet_memwrite_choice_117 ),
    .nondet_memwrite_choice_118 ( nondet_memwrite_choice_118 ),
    .nondet_memwrite_choice_119 ( nondet_memwrite_choice_119 ) 
);
endmodule
