// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Voc8051_tb.h for the primary calling header

#ifndef _Voc8051_tb_one_round_H_
#define _Voc8051_tb_one_round_H_

#include "verilated_heavy.h"

class Voc8051_tb__Syms;
class Voc8051_tb_T;

//----------

VL_MODULE(Voc8051_tb_one_round) {
  public:
    // CELLS
    Voc8051_tb_T*      	__PVT__t0__DOT__t0;
    Voc8051_tb_T*      	__PVT__t0__DOT__t1;
    Voc8051_tb_T*      	__PVT__t0__DOT__t2;
    Voc8051_tb_T*      	__PVT__t0__DOT__t3;
    Voc8051_tb_T*      	__PVT__t1__DOT__t0;
    Voc8051_tb_T*      	__PVT__t1__DOT__t1;
    Voc8051_tb_T*      	__PVT__t1__DOT__t2;
    Voc8051_tb_T*      	__PVT__t1__DOT__t3;
    Voc8051_tb_T*      	__PVT__t2__DOT__t0;
    Voc8051_tb_T*      	__PVT__t2__DOT__t1;
    Voc8051_tb_T*      	__PVT__t2__DOT__t2;
    Voc8051_tb_T*      	__PVT__t2__DOT__t3;
    Voc8051_tb_T*      	__PVT__t3__DOT__t0;
    Voc8051_tb_T*      	__PVT__t3__DOT__t1;
    Voc8051_tb_T*      	__PVT__t3__DOT__t2;
    Voc8051_tb_T*      	__PVT__t3__DOT__t3;
    
    // PORTS
    VL_IN8(clk,0,0);
    VL_INW(state_in,127,0,4);
    VL_INW(key,127,0,4);
    VL_OUTW(state_out,127,0,4);
    
    // LOCAL SIGNALS
    VL_SIG(__PVT__p00,31,0);
    VL_SIG(__PVT__p01,31,0);
    VL_SIG(__PVT__p02,31,0);
    VL_SIG(__PVT__p10,31,0);
    VL_SIG(__PVT__p11,31,0);
    VL_SIG(__PVT__p12,31,0);
    VL_SIG(__PVT__p20,31,0);
    VL_SIG(__PVT__p21,31,0);
    VL_SIG(__PVT__p22,31,0);
    VL_SIG(__PVT__p30,31,0);
    VL_SIG(__PVT__p31,31,0);
    VL_SIG(__PVT__p32,31,0);
    
    // LOCAL VARIABLES
    
    // INTERNAL VARIABLES
  private:
    Voc8051_tb__Syms* __VlSymsp;  // Symbol table
  public:
    
    // PARAMETERS
    
    // CONSTRUCTORS
  private:
    Voc8051_tb_one_round& operator= (const Voc8051_tb_one_round&);  ///< Copying not allowed
    Voc8051_tb_one_round(const Voc8051_tb_one_round&);  ///< Copying not allowed
  public:
    Voc8051_tb_one_round(const char* name="TOP");
    ~Voc8051_tb_one_round();
    
    // API METHODS
    
    // INTERNAL METHODS
    void __Vconfigure(Voc8051_tb__Syms* symsp, bool first);
    void _combo__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r1__29(Voc8051_tb__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset();
  public:
    void _sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r1__11(Voc8051_tb__Syms* __restrict vlSymsp);
    void _sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r2__12(Voc8051_tb__Syms* __restrict vlSymsp);
    void _sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r3__13(Voc8051_tb__Syms* __restrict vlSymsp);
    void _sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r4__14(Voc8051_tb__Syms* __restrict vlSymsp);
    void _sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r5__15(Voc8051_tb__Syms* __restrict vlSymsp);
    void _sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r6__16(Voc8051_tb__Syms* __restrict vlSymsp);
    void _sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r7__17(Voc8051_tb__Syms* __restrict vlSymsp);
    void _sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r8__18(Voc8051_tb__Syms* __restrict vlSymsp);
    void _sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r9__10(Voc8051_tb__Syms* __restrict vlSymsp);
    void _settle__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r1__19(Voc8051_tb__Syms* __restrict vlSymsp);
} VL_ATTR_ALIGNED(128);

#endif // guard
