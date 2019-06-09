// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _Voc8051_top_H_
#define _Voc8051_top_H_

#include "verilated.h"

class Voc8051_top__Syms;

//----------

VL_MODULE(Voc8051_top) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(wb_rst_i,0,0);
    VL_IN8(wb_clk_i,0,0);
    VL_IN8(int0_i,0,0);
    VL_IN8(int1_i,0,0);
    VL_IN8(ea_in,0,0);
    VL_IN8(wbd_ack_i,0,0);
    VL_IN8(wbi_ack_i,0,0);
    VL_IN8(wbd_err_i,0,0);
    VL_IN8(wbi_err_i,0,0);
    VL_OUT8(pc_change,0,0);
    VL_IN8(su_en,0,0);
    VL_OUT8(priv_lvl,0,0);
    VL_OUT8(psw,7,0);
    VL_OUT8(p,0,0);
    VL_OUT8(sp,7,0);
    VL_OUT8(acc,7,0);
    VL_OUT8(b_reg,7,0);
    VL_OUT8(op1,7,0);
    VL_OUT8(op1_d,7,0);
    VL_OUT8(op2,7,0);
    VL_OUT8(op3,7,0);
    VL_OUT8(ie,7,0);
    VL_IN8(wbd_dat_i,7,0);
    VL_OUT8(wbd_we_o,0,0);
    VL_OUT8(wbd_stb_o,0,0);
    VL_OUT8(wbd_cyc_o,0,0);
    VL_OUT8(wbi_stb_o,0,0);
    VL_OUT8(wbi_cyc_o,0,0);
    VL_OUT8(wbd_dat_o,7,0);
    VL_OUT8(decoder_state,1,0);
    VL_IN8(p0_i,7,0);
    VL_OUT8(p0_o,7,0);
    VL_IN8(p1_i,7,0);
    VL_OUT8(p1_o,7,0);
    VL_IN8(p2_i,7,0);
    VL_OUT8(p2_o,7,0);
    VL_IN8(p3_i,7,0);
    VL_OUT8(p3_o,7,0);
    VL_OUT16(pc,15,0);
    VL_OUT16(dpc_ot,15,0);
    VL_OUT16(pc_log,15,0);
    VL_OUT16(pc_log_prev,15,0);
    VL_OUT16(dptr,15,0);
    VL_OUT16(wbd_adr_o,15,0);
    VL_OUT16(wbi_adr_o,15,0);
    VL_OUT16(cxrom_addr,15,0);
    VL_OUTW(iram,2047,0,64);
    VL_IN(wbi_dat_i,31,0);
    VL_IN(cxrom_data_out,31,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    VL_SIG8(oc8051_top__DOT__dptr_hi,7,0);
    VL_SIG8(oc8051_top__DOT__dptr_lo,7,0);
    VL_SIG8(oc8051_top__DOT__ri,7,0);
    VL_SIG8(oc8051_top__DOT__src_sel3,0,0);
    VL_SIG8(oc8051_top__DOT__wr_sfr,1,0);
    VL_SIG8(oc8051_top__DOT__src_sel2,1,0);
    VL_SIG8(oc8051_top__DOT__ram_rd_sel,2,0);
    VL_SIG8(oc8051_top__DOT__ram_wr_sel,2,0);
    VL_SIG8(oc8051_top__DOT__src_sel1,2,0);
    VL_SIG8(oc8051_top__DOT__ram_data,7,0);
    VL_SIG8(oc8051_top__DOT__ram_out,7,0);
    VL_SIG8(oc8051_top__DOT__sfr_out,7,0);
    VL_SIG8(oc8051_top__DOT__wr_addr,7,0);
    VL_SIG8(oc8051_top__DOT__rd_addr,7,0);
    VL_SIG8(oc8051_top__DOT__sfr_bit,0,0);
    VL_SIG8(oc8051_top__DOT__cy_sel,1,0);
    VL_SIG8(oc8051_top__DOT__bank_sel,1,0);
    VL_SIG8(oc8051_top__DOT__rmw,0,0);
    VL_SIG8(oc8051_top__DOT__ea_int,0,0);
    VL_SIG8(oc8051_top__DOT__mem_wait,0,0);
    VL_SIG8(oc8051_top__DOT__mem_act,2,0);
    VL_SIG8(oc8051_top__DOT__alu_op,3,0);
    VL_SIG8(oc8051_top__DOT__psw_set,1,0);
    VL_SIG8(oc8051_top__DOT__src1,7,0);
    VL_SIG8(oc8051_top__DOT__src2,7,0);
    VL_SIG8(oc8051_top__DOT__src3,7,0);
    VL_SIG8(oc8051_top__DOT__des_acc,7,0);
    VL_SIG8(oc8051_top__DOT__des1,7,0);
    VL_SIG8(oc8051_top__DOT__des2,7,0);
    VL_SIG8(oc8051_top__DOT__desCy,0,0);
    VL_SIG8(oc8051_top__DOT__desAc,0,0);
    VL_SIG8(oc8051_top__DOT__desOv,0,0);
    VL_SIG8(oc8051_top__DOT__alu_cy,0,0);
    VL_SIG8(oc8051_top__DOT__wr,0,0);
    VL_SIG8(oc8051_top__DOT__rd,0,0);
    VL_SIG8(oc8051_top__DOT__pc_wr,0,0);
    VL_SIG8(oc8051_top__DOT__pc_wr_sel,2,0);
    VL_SIG8(oc8051_top__DOT__op1_n,7,0);
    VL_SIG8(oc8051_top__DOT__op2_n,7,0);
    VL_SIG8(oc8051_top__DOT__op3_n,7,0);
    VL_SIG8(oc8051_top__DOT__irom_out_of_rst,0,0);
    VL_SIG8(oc8051_top__DOT__decoder_new_valid_pc,0,0);
    VL_SIG8(oc8051_top__DOT__comp_sel,1,0);
    VL_SIG8(oc8051_top__DOT__rd_ind,0,0);
    VL_SIG8(oc8051_top__DOT__wr_ind,0,0);
    VL_SIG8(oc8051_top__DOT__bit_addr,0,0);
    VL_SIG8(oc8051_top__DOT__bit_out,0,0);
    VL_SIG8(oc8051_top__DOT__wait_data,0,0);
    VL_SIG8(oc8051_top__DOT__iack_i,0,0);
    VL_SIG8(oc8051_top__DOT__enter_su_mode,0,0);
    VL_SIG8(oc8051_top__DOT__leave_su_mode,0,0);
    VL_SIG8(oc8051_top__DOT__sub_result,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_decoder1__DOT__state,1,0);
    VL_SIG8(oc8051_top__DOT__oc8051_decoder1__DOT__wr,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_decoder1__DOT__alu_op,3,0);
    VL_SIG8(oc8051_top__DOT__oc8051_decoder1__DOT__wr_sfr,1,0);
    VL_SIG8(oc8051_top__DOT__oc8051_decoder1__DOT__ram_wr_sel,2,0);
    VL_SIG8(oc8051_top__DOT__oc8051_decoder1__DOT__ram_rd_sel,2,0);
    VL_SIG8(oc8051_top__DOT__oc8051_decoder1__DOT__state_dec,1,0);
    VL_SIG8(oc8051_top__DOT__oc8051_decoder1__DOT__op,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_decoder1__DOT__ram_rd_sel_r,2,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__add4,4,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__add8,3,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__addc,1,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__sub4,4,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__sub8,3,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__subc,1,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__enable_mul,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__enable_div,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__da_tmp,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__da_tmp1,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__oc8051_mul1__DOT__cycle,1,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__oc8051_div1__DOT__div0,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__oc8051_div1__DOT__div1,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__oc8051_div1__DOT__rem0,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__oc8051_div1__DOT__rem1,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__oc8051_div1__DOT__rem2,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__oc8051_div1__DOT__div_out,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__oc8051_div1__DOT__cycle,1,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__oc8051_div1__DOT__tmp_div,5,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu1__DOT__oc8051_div1__DOT__tmp_rem,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_ram_top1__DOT__wr_data_m,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_ram_top1__DOT__rd_addr_m,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_ram_top1__DOT__wr_addr_m,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_ram_top1__DOT__rd_en,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_ram_top1__DOT__bit_addr_r,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_ram_top1__DOT__rd_en_r,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_ram_top1__DOT__wr_data_r,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_ram_top1__DOT__rd_data_m,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_ram_top1__DOT__bit_select,2,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu_src_sel1__DOT__op1_r,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu_src_sel1__DOT__op2_r,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_alu_src_sel1__DOT__op3_r,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_comp1__DOT__eq_r,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_indi_addr1__DOT__wr_bit_r,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__rd_addr_r,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__dack_ir,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__ddat_ir,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__ea_rom_sel,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__rn_r,4,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__ri_r,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__imm_r,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__imm2_r,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__int_ack_t,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__int_vec_buff,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__op2_buff,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__op3_buff,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__op1_o,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__op2_o,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__op3_o,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__istb_t,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__imem_wait,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__dmem_wait,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__op_length,1,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__op_pos,2,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__inc_pc,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__pc_wr_r,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__pc_wr_r2,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__cdata,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__cdone,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__out_of_rst_cycles,3,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__pcs_source,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_memory_interface1__DOT__pcs_cy,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_sfr1__DOT__p0_data,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_sfr1__DOT__p1_data,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_sfr1__DOT__p2_data,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_sfr1__DOT__p3_data,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_sfr1__DOT__wr_bit_r,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_sfr1__DOT__port_rd,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_sfr1__DOT__valid_sfr,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_sfr1__DOT__oc8051_acc1__DOT__acc,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_sfr1__DOT__oc8051_etr1__DOT__etr_c,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_sfr1__DOT__oc8051_sp1__DOT__pop,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_sfr1__DOT__oc8051_sp1__DOT__write,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_sfr1__DOT__oc8051_sp1__DOT__sp_t,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_sfr1__DOT__oc8051_sp1__DOT__sp,7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_sfr1__DOT__oc8051_psw1__DOT__data,7,1);
    VL_SIG8(oc8051_top__DOT__oc8051_sfr1__DOT__oc8051_psw1__DOT__psw_next_i,7,1);
    VL_SIG8(oc8051_top__DOT__oc8051_priv_lvl1__DOT__priv_counter,6,0);
    VL_SIG16(oc8051_top__DOT__mem_pc,15,0);
    VL_SIG16(oc8051_top__DOT__etr,15,0);
    VL_SIG16(oc8051_top__DOT__oc8051_alu1__DOT__inc,15,0);
    VL_SIG16(oc8051_top__DOT__oc8051_alu1__DOT__dec,15,0);
    VL_SIG16(oc8051_top__DOT__oc8051_alu1__DOT__oc8051_mul1__DOT__mul_result,15,0);
    VL_SIG16(oc8051_top__DOT__oc8051_alu1__DOT__oc8051_mul1__DOT__tmp_mul,15,0);
    VL_SIG16(oc8051_top__DOT__oc8051_alu1__DOT__oc8051_div1__DOT__sub0,8,0);
    VL_SIG16(oc8051_top__DOT__oc8051_alu1__DOT__oc8051_div1__DOT__sub1,8,0);
    VL_SIG16(oc8051_top__DOT__oc8051_alu1__DOT__oc8051_div1__DOT__cmp0,15,0);
    VL_SIG16(oc8051_top__DOT__oc8051_alu1__DOT__oc8051_div1__DOT__cmp1,15,0);
    VL_SIG16(oc8051_top__DOT__oc8051_memory_interface1__DOT__pc_buf,15,0);
    VL_SIG16(oc8051_top__DOT__oc8051_memory_interface1__DOT__alu,15,0);
    VL_SIG16(oc8051_top__DOT__oc8051_memory_interface1__DOT__iadr_t,15,0);
    VL_SIG16(oc8051_top__DOT__oc8051_memory_interface1__DOT__dadr_ot,15,0);
    VL_SIG16(oc8051_top__DOT__oc8051_memory_interface1__DOT__pc_out,15,0);
    VL_SIG16(oc8051_top__DOT__oc8051_memory_interface1__DOT__pcs_result,15,0);
    VL_SIG16(oc8051_top__DOT__oc8051_sfr1__DOT__oc8051_etr1__DOT__etr_reg,15,0);
    VL_SIG16(oc8051_top__DOT__oc8051_sfr1__DOT__oc8051_etr1__DOT__etr_next,15,0);
    VL_SIG(oc8051_top__DOT__idat_onchip,31,0);
    VL_SIG(oc8051_top__DOT__idat_i,31,0);
    VL_SIG(oc8051_top__DOT__oc8051_memory_interface1__DOT__idat_cur,31,0);
    VL_SIG(oc8051_top__DOT__oc8051_memory_interface1__DOT__idat_old,31,0);
    VL_SIG8(oc8051_top__DOT__oc8051_ram_top1__DOT__oc8051_idata__DOT__buff[257],7,0);
    VL_SIG8(oc8051_top__DOT__oc8051_indi_addr1__DOT__buff[8],7,0);
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    static VL_ST_SIG8(__Vtable1_oc8051_top__DOT__enter_su_mode[4096],0,0);
    static VL_ST_SIG8(__Vtable1_oc8051_top__DOT__leave_su_mode[4096],0,0);
    static VL_ST_SIG8(__Vtable1_oc8051_top__DOT__oc8051_decoder1__DOT__ram_rd_sel[4096],2,0);
    static VL_ST_SIG8(__Vtable1_oc8051_top__DOT__pc_wr[4096],0,0);
    static VL_ST_SIG8(__Vtable1_oc8051_top__DOT__pc_wr_sel[4096],2,0);
    static VL_ST_SIG8(__Vtable1_oc8051_top__DOT__comp_sel[4096],1,0);
    static VL_ST_SIG8(__Vtable1_oc8051_top__DOT__rmw[4096],0,0);
    static VL_ST_SIG8(__Vtable1_oc8051_top__DOT__bit_addr[4096],0,0);
    static VL_ST_SIG8(__Vtable2_oc8051_top__DOT__oc8051_decoder1__DOT__ram_wr_sel[4096],2,0);
    static VL_ST_SIG8(__Vtable2_oc8051_top__DOT__src_sel1[4096],2,0);
    static VL_ST_SIG8(__Vtable2_oc8051_top__DOT__src_sel2[4096],1,0);
    static VL_ST_SIG8(__Vtable2_oc8051_top__DOT__oc8051_decoder1__DOT__alu_op[4096],3,0);
    static VL_ST_SIG8(__Vtable2_oc8051_top__DOT__oc8051_decoder1__DOT__wr[4096],0,0);
    static VL_ST_SIG8(__Vtable2_oc8051_top__DOT__psw_set[4096],1,0);
    static VL_ST_SIG8(__Vtable2_oc8051_top__DOT__cy_sel[4096],1,0);
    static VL_ST_SIG8(__Vtable2_oc8051_top__DOT__src_sel3[4096],0,0);
    static VL_ST_SIG8(__Vtable2_oc8051_top__DOT__oc8051_decoder1__DOT__wr_sfr[4096],1,0);
    static VL_ST_SIG8(__Vtable3_oc8051_top__DOT__mem_act[1024],2,0);
    static VL_ST_SIG8(__Vtable4_oc8051_top__DOT__oc8051_memory_interface1__DOT__op_length[256],1,0);
    VL_SIG8(oc8051_top__DOT____Vcellinp__oc8051_indi_addr1__wr,0,0);
    VL_SIG8(oc8051_top__DOT____Vcellinp__oc8051_memory_interface1__pc_wr,0,0);
    VL_SIG8(oc8051_top__DOT____Vcellinp__oc8051_memory_interface1__rn,4,0);
    VL_SIG8(oc8051_top__DOT____Vcellinp__oc8051_sfr1__we,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_sfr1__DOT__oc8051_psw1__DOT____Vlvbound1,0,0);
    VL_SIG8(oc8051_top__DOT__oc8051_sfr1__DOT__oc8051_psw1__DOT____Vlvbound2,0,0);
    VL_SIG8(__Vtableidx4,7,0);
    VL_SIG8(__Vdlyvval__oc8051_top__DOT__oc8051_ram_top1__DOT__oc8051_idata__DOT__buff__v0,7,0);
    VL_SIG8(__Vdlyvset__oc8051_top__DOT__oc8051_ram_top1__DOT__oc8051_idata__DOT__buff__v0,0,0);
    VL_SIG8(__Vclklast__TOP__wb_clk_i,0,0);
    VL_SIG8(__Vclklast__TOP__wb_rst_i,0,0);
    VL_SIG8(__Vchglast__TOP__oc8051_top__DOT__oc8051_comp1__DOT__eq_r,0,0);
    VL_SIG8(__Vchglast__TOP__oc8051_top__DOT__oc8051_sfr1__DOT__oc8051_acc1__DOT__acc,7,0);
    VL_SIG16(oc8051_top__DOT____Vcellinp__oc8051_memory_interface1__dptr,15,0);
    VL_SIG16(__Vtableidx1,11,0);
    VL_SIG16(__Vdlyvdim0__oc8051_top__DOT__oc8051_ram_top1__DOT__oc8051_idata__DOT__buff__v0,8,0);
    VL_SIG16(__Vtablechg2[4096],8,0);
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    Voc8051_top__Syms* __VlSymsp;  // Symbol table
    
    // PARAMETERS
    // Parameters marked /*verilator public*/ for use by application code
    
    // CONSTRUCTORS
  private:
    Voc8051_top& operator= (const Voc8051_top&);  ///< Copying not allowed
    Voc8051_top(const Voc8051_top&);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible WRT DPI scope names.
    Voc8051_top(const char* name="TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~Voc8051_top();
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(Voc8051_top__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(Voc8051_top__Syms* symsp, bool first);
  private:
    static QData _change_request(Voc8051_top__Syms* __restrict vlSymsp);
  public:
    static void _combo__TOP__6(Voc8051_top__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset();
  public:
    static void _eval(Voc8051_top__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif // VL_DEBUG
  public:
    static void _eval_initial(Voc8051_top__Syms* __restrict vlSymsp);
    static void _eval_settle(Voc8051_top__Syms* __restrict vlSymsp);
    static void _initial__TOP__3(Voc8051_top__Syms* __restrict vlSymsp);
    static void _sequent__TOP__1(Voc8051_top__Syms* __restrict vlSymsp);
    static void _sequent__TOP__2(Voc8051_top__Syms* __restrict vlSymsp);
    static void _sequent__TOP__5(Voc8051_top__Syms* __restrict vlSymsp);
    static void _settle__TOP__4(Voc8051_top__Syms* __restrict vlSymsp);
} VL_ATTR_ALIGNED(128);

#endif // guard
