// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Voc8051_tb.h for the primary calling header

#include "Voc8051_tb_one_round.h" // For This
#include "Voc8051_tb__Syms.h"


//--------------------
// STATIC VARIABLES


//--------------------

VL_CTOR_IMP(Voc8051_tb_one_round) {
    VL_CELL (__PVT__t0__DOT__t0, Voc8051_tb_T);
    VL_CELL (__PVT__t0__DOT__t1, Voc8051_tb_T);
    VL_CELL (__PVT__t0__DOT__t2, Voc8051_tb_T);
    VL_CELL (__PVT__t0__DOT__t3, Voc8051_tb_T);
    VL_CELL (__PVT__t1__DOT__t0, Voc8051_tb_T);
    VL_CELL (__PVT__t1__DOT__t1, Voc8051_tb_T);
    VL_CELL (__PVT__t1__DOT__t2, Voc8051_tb_T);
    VL_CELL (__PVT__t1__DOT__t3, Voc8051_tb_T);
    VL_CELL (__PVT__t2__DOT__t0, Voc8051_tb_T);
    VL_CELL (__PVT__t2__DOT__t1, Voc8051_tb_T);
    VL_CELL (__PVT__t2__DOT__t2, Voc8051_tb_T);
    VL_CELL (__PVT__t2__DOT__t3, Voc8051_tb_T);
    VL_CELL (__PVT__t3__DOT__t0, Voc8051_tb_T);
    VL_CELL (__PVT__t3__DOT__t1, Voc8051_tb_T);
    VL_CELL (__PVT__t3__DOT__t2, Voc8051_tb_T);
    VL_CELL (__PVT__t3__DOT__t3, Voc8051_tb_T);
    // Reset internal values
    // Reset structure values
    _ctor_var_reset();
}

void Voc8051_tb_one_round::__Vconfigure(Voc8051_tb__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

Voc8051_tb_one_round::~Voc8051_tb_one_round() {
}

//--------------------
// Internal Methods

VL_INLINE_OPT void Voc8051_tb_one_round::_sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r1__11(Voc8051_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Voc8051_tb_one_round::_sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r1__11\n"); );
    Voc8051_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at aes_round.v:46
    this->state_out[0U] = ((((this->__PVT__p01 ^ this->__PVT__p12) 
			     ^ __PVT__t2__DOT__t3->__PVT__out) 
			    ^ this->__PVT__p30) ^ vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k0b[0U]);
    this->state_out[1U] = ((((this->__PVT__p02 ^ __PVT__t1__DOT__t3->__PVT__out) 
			     ^ this->__PVT__p20) ^ this->__PVT__p31) 
			   ^ vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k0b[1U]);
    this->state_out[2U] = (IData)((((QData)((IData)(
						    ((((this->__PVT__p00 
							^ this->__PVT__p11) 
						       ^ this->__PVT__p22) 
						      ^ __PVT__t3__DOT__t3->__PVT__out) 
						     ^ 
						     vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k0b[3U]))) 
				    << 0x20U) | (QData)((IData)(
								((((__PVT__t0__DOT__t3->__PVT__out 
								    ^ this->__PVT__p10) 
								   ^ this->__PVT__p21) 
								  ^ this->__PVT__p32) 
								 ^ 
								 vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k0b[2U])))));
    this->state_out[3U] = (IData)(((((QData)((IData)(
						     ((((this->__PVT__p00 
							 ^ this->__PVT__p11) 
							^ this->__PVT__p22) 
						       ^ __PVT__t3__DOT__t3->__PVT__out) 
						      ^ 
						      vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k0b[3U]))) 
				     << 0x20U) | (QData)((IData)(
								 ((((__PVT__t0__DOT__t3->__PVT__out 
								     ^ this->__PVT__p10) 
								    ^ this->__PVT__p21) 
								   ^ this->__PVT__p32) 
								  ^ 
								  vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k0b[2U])))) 
				   >> 0x20U));
}

void Voc8051_tb_one_round::_settle__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r1__19(Voc8051_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Voc8051_tb_one_round::_settle__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r1__19\n"); );
    Voc8051_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    this->__PVT__p00 = ((0xff000000U & this->__PVT__p00) 
			| (0xffffffU & (__PVT__t0__DOT__t0->__PVT__out 
					>> 8U)));
    this->__PVT__p00 = ((0xffffffU & this->__PVT__p00) 
			| (0xff000000U & (__PVT__t0__DOT__t0->__PVT__out 
					  << 0x18U)));
    this->__PVT__p01 = ((0xffff0000U & this->__PVT__p01) 
			| (0xffffU & (__PVT__t0__DOT__t1->__PVT__out 
				      >> 0x10U)));
    this->__PVT__p01 = ((0xffffU & this->__PVT__p01) 
			| (0xffff0000U & (__PVT__t0__DOT__t1->__PVT__out 
					  << 0x10U)));
    this->__PVT__p02 = ((0xffffff00U & this->__PVT__p02) 
			| (0xffU & (__PVT__t0__DOT__t2->__PVT__out 
				    >> 0x18U)));
    this->__PVT__p02 = ((0xffU & this->__PVT__p02) 
			| (0xffffff00U & (__PVT__t0__DOT__t2->__PVT__out 
					  << 8U)));
    this->__PVT__p10 = ((0xff000000U & this->__PVT__p10) 
			| (0xffffffU & (__PVT__t1__DOT__t0->__PVT__out 
					>> 8U)));
    this->__PVT__p10 = ((0xffffffU & this->__PVT__p10) 
			| (0xff000000U & (__PVT__t1__DOT__t0->__PVT__out 
					  << 0x18U)));
    this->__PVT__p11 = ((0xffff0000U & this->__PVT__p11) 
			| (0xffffU & (__PVT__t1__DOT__t1->__PVT__out 
				      >> 0x10U)));
    this->__PVT__p11 = ((0xffffU & this->__PVT__p11) 
			| (0xffff0000U & (__PVT__t1__DOT__t1->__PVT__out 
					  << 0x10U)));
    this->__PVT__p12 = ((0xffffff00U & this->__PVT__p12) 
			| (0xffU & (__PVT__t1__DOT__t2->__PVT__out 
				    >> 0x18U)));
    this->__PVT__p12 = ((0xffU & this->__PVT__p12) 
			| (0xffffff00U & (__PVT__t1__DOT__t2->__PVT__out 
					  << 8U)));
    this->__PVT__p20 = ((0xff000000U & this->__PVT__p20) 
			| (0xffffffU & (__PVT__t2__DOT__t0->__PVT__out 
					>> 8U)));
    this->__PVT__p20 = ((0xffffffU & this->__PVT__p20) 
			| (0xff000000U & (__PVT__t2__DOT__t0->__PVT__out 
					  << 0x18U)));
    this->__PVT__p21 = ((0xffff0000U & this->__PVT__p21) 
			| (0xffffU & (__PVT__t2__DOT__t1->__PVT__out 
				      >> 0x10U)));
    this->__PVT__p21 = ((0xffffU & this->__PVT__p21) 
			| (0xffff0000U & (__PVT__t2__DOT__t1->__PVT__out 
					  << 0x10U)));
    this->__PVT__p22 = ((0xffffff00U & this->__PVT__p22) 
			| (0xffU & (__PVT__t2__DOT__t2->__PVT__out 
				    >> 0x18U)));
    this->__PVT__p22 = ((0xffU & this->__PVT__p22) 
			| (0xffffff00U & (__PVT__t2__DOT__t2->__PVT__out 
					  << 8U)));
    this->__PVT__p30 = ((0xff000000U & this->__PVT__p30) 
			| (0xffffffU & (__PVT__t3__DOT__t0->__PVT__out 
					>> 8U)));
    this->__PVT__p30 = ((0xffffffU & this->__PVT__p30) 
			| (0xff000000U & (__PVT__t3__DOT__t0->__PVT__out 
					  << 0x18U)));
    this->__PVT__p31 = ((0xffff0000U & this->__PVT__p31) 
			| (0xffffU & (__PVT__t3__DOT__t1->__PVT__out 
				      >> 0x10U)));
    this->__PVT__p31 = ((0xffffU & this->__PVT__p31) 
			| (0xffff0000U & (__PVT__t3__DOT__t1->__PVT__out 
					  << 0x10U)));
    this->__PVT__p32 = ((0xffffff00U & this->__PVT__p32) 
			| (0xffU & (__PVT__t3__DOT__t2->__PVT__out 
				    >> 0x18U)));
    this->__PVT__p32 = ((0xffU & this->__PVT__p32) 
			| (0xffffff00U & (__PVT__t3__DOT__t2->__PVT__out 
					  << 8U)));
}

VL_INLINE_OPT void Voc8051_tb_one_round::_combo__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r1__29(Voc8051_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Voc8051_tb_one_round::_combo__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r1__29\n"); );
    Voc8051_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    this->__PVT__p00 = ((0xff000000U & this->__PVT__p00) 
			| (0xffffffU & (__PVT__t0__DOT__t0->__PVT__out 
					>> 8U)));
    this->__PVT__p00 = ((0xffffffU & this->__PVT__p00) 
			| (0xff000000U & (__PVT__t0__DOT__t0->__PVT__out 
					  << 0x18U)));
    this->__PVT__p11 = ((0xffff0000U & this->__PVT__p11) 
			| (0xffffU & (__PVT__t1__DOT__t1->__PVT__out 
				      >> 0x10U)));
    this->__PVT__p11 = ((0xffffU & this->__PVT__p11) 
			| (0xffff0000U & (__PVT__t1__DOT__t1->__PVT__out 
					  << 0x10U)));
    this->__PVT__p22 = ((0xffffff00U & this->__PVT__p22) 
			| (0xffU & (__PVT__t2__DOT__t2->__PVT__out 
				    >> 0x18U)));
    this->__PVT__p22 = ((0xffU & this->__PVT__p22) 
			| (0xffffff00U & (__PVT__t2__DOT__t2->__PVT__out 
					  << 8U)));
    this->__PVT__p10 = ((0xff000000U & this->__PVT__p10) 
			| (0xffffffU & (__PVT__t1__DOT__t0->__PVT__out 
					>> 8U)));
    this->__PVT__p10 = ((0xffffffU & this->__PVT__p10) 
			| (0xff000000U & (__PVT__t1__DOT__t0->__PVT__out 
					  << 0x18U)));
    this->__PVT__p21 = ((0xffff0000U & this->__PVT__p21) 
			| (0xffffU & (__PVT__t2__DOT__t1->__PVT__out 
				      >> 0x10U)));
    this->__PVT__p21 = ((0xffffU & this->__PVT__p21) 
			| (0xffff0000U & (__PVT__t2__DOT__t1->__PVT__out 
					  << 0x10U)));
    this->__PVT__p32 = ((0xffffff00U & this->__PVT__p32) 
			| (0xffU & (__PVT__t3__DOT__t2->__PVT__out 
				    >> 0x18U)));
    this->__PVT__p32 = ((0xffU & this->__PVT__p32) 
			| (0xffffff00U & (__PVT__t3__DOT__t2->__PVT__out 
					  << 8U)));
    this->__PVT__p02 = ((0xffffff00U & this->__PVT__p02) 
			| (0xffU & (__PVT__t0__DOT__t2->__PVT__out 
				    >> 0x18U)));
    this->__PVT__p02 = ((0xffU & this->__PVT__p02) 
			| (0xffffff00U & (__PVT__t0__DOT__t2->__PVT__out 
					  << 8U)));
    this->__PVT__p20 = ((0xff000000U & this->__PVT__p20) 
			| (0xffffffU & (__PVT__t2__DOT__t0->__PVT__out 
					>> 8U)));
    this->__PVT__p20 = ((0xffffffU & this->__PVT__p20) 
			| (0xff000000U & (__PVT__t2__DOT__t0->__PVT__out 
					  << 0x18U)));
    this->__PVT__p31 = ((0xffff0000U & this->__PVT__p31) 
			| (0xffffU & (__PVT__t3__DOT__t1->__PVT__out 
				      >> 0x10U)));
    this->__PVT__p31 = ((0xffffU & this->__PVT__p31) 
			| (0xffff0000U & (__PVT__t3__DOT__t1->__PVT__out 
					  << 0x10U)));
    this->__PVT__p01 = ((0xffff0000U & this->__PVT__p01) 
			| (0xffffU & (__PVT__t0__DOT__t1->__PVT__out 
				      >> 0x10U)));
    this->__PVT__p01 = ((0xffffU & this->__PVT__p01) 
			| (0xffff0000U & (__PVT__t0__DOT__t1->__PVT__out 
					  << 0x10U)));
    this->__PVT__p12 = ((0xffffff00U & this->__PVT__p12) 
			| (0xffU & (__PVT__t1__DOT__t2->__PVT__out 
				    >> 0x18U)));
    this->__PVT__p12 = ((0xffU & this->__PVT__p12) 
			| (0xffffff00U & (__PVT__t1__DOT__t2->__PVT__out 
					  << 8U)));
    this->__PVT__p30 = ((0xff000000U & this->__PVT__p30) 
			| (0xffffffU & (__PVT__t3__DOT__t0->__PVT__out 
					>> 8U)));
    this->__PVT__p30 = ((0xffffffU & this->__PVT__p30) 
			| (0xff000000U & (__PVT__t3__DOT__t0->__PVT__out 
					  << 0x18U)));
}

VL_INLINE_OPT void Voc8051_tb_one_round::_sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r2__12(Voc8051_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Voc8051_tb_one_round::_sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r2__12\n"); );
    Voc8051_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at aes_round.v:46
    this->state_out[0U] = ((((this->__PVT__p01 ^ this->__PVT__p12) 
			     ^ __PVT__t2__DOT__t3->__PVT__out) 
			    ^ this->__PVT__p30) ^ vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k1b[0U]);
    this->state_out[1U] = ((((this->__PVT__p02 ^ __PVT__t1__DOT__t3->__PVT__out) 
			     ^ this->__PVT__p20) ^ this->__PVT__p31) 
			   ^ vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k1b[1U]);
    this->state_out[2U] = (IData)((((QData)((IData)(
						    ((((this->__PVT__p00 
							^ this->__PVT__p11) 
						       ^ this->__PVT__p22) 
						      ^ __PVT__t3__DOT__t3->__PVT__out) 
						     ^ 
						     vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k1b[3U]))) 
				    << 0x20U) | (QData)((IData)(
								((((__PVT__t0__DOT__t3->__PVT__out 
								    ^ this->__PVT__p10) 
								   ^ this->__PVT__p21) 
								  ^ this->__PVT__p32) 
								 ^ 
								 vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k1b[2U])))));
    this->state_out[3U] = (IData)(((((QData)((IData)(
						     ((((this->__PVT__p00 
							 ^ this->__PVT__p11) 
							^ this->__PVT__p22) 
						       ^ __PVT__t3__DOT__t3->__PVT__out) 
						      ^ 
						      vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k1b[3U]))) 
				     << 0x20U) | (QData)((IData)(
								 ((((__PVT__t0__DOT__t3->__PVT__out 
								     ^ this->__PVT__p10) 
								    ^ this->__PVT__p21) 
								   ^ this->__PVT__p32) 
								  ^ 
								  vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k1b[2U])))) 
				   >> 0x20U));
}

VL_INLINE_OPT void Voc8051_tb_one_round::_sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r3__13(Voc8051_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Voc8051_tb_one_round::_sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r3__13\n"); );
    Voc8051_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at aes_round.v:46
    this->state_out[0U] = ((((this->__PVT__p01 ^ this->__PVT__p12) 
			     ^ __PVT__t2__DOT__t3->__PVT__out) 
			    ^ this->__PVT__p30) ^ vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k2b[0U]);
    this->state_out[1U] = ((((this->__PVT__p02 ^ __PVT__t1__DOT__t3->__PVT__out) 
			     ^ this->__PVT__p20) ^ this->__PVT__p31) 
			   ^ vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k2b[1U]);
    this->state_out[2U] = (IData)((((QData)((IData)(
						    ((((this->__PVT__p00 
							^ this->__PVT__p11) 
						       ^ this->__PVT__p22) 
						      ^ __PVT__t3__DOT__t3->__PVT__out) 
						     ^ 
						     vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k2b[3U]))) 
				    << 0x20U) | (QData)((IData)(
								((((__PVT__t0__DOT__t3->__PVT__out 
								    ^ this->__PVT__p10) 
								   ^ this->__PVT__p21) 
								  ^ this->__PVT__p32) 
								 ^ 
								 vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k2b[2U])))));
    this->state_out[3U] = (IData)(((((QData)((IData)(
						     ((((this->__PVT__p00 
							 ^ this->__PVT__p11) 
							^ this->__PVT__p22) 
						       ^ __PVT__t3__DOT__t3->__PVT__out) 
						      ^ 
						      vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k2b[3U]))) 
				     << 0x20U) | (QData)((IData)(
								 ((((__PVT__t0__DOT__t3->__PVT__out 
								     ^ this->__PVT__p10) 
								    ^ this->__PVT__p21) 
								   ^ this->__PVT__p32) 
								  ^ 
								  vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k2b[2U])))) 
				   >> 0x20U));
}

VL_INLINE_OPT void Voc8051_tb_one_round::_sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r4__14(Voc8051_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Voc8051_tb_one_round::_sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r4__14\n"); );
    Voc8051_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at aes_round.v:46
    this->state_out[0U] = ((((this->__PVT__p01 ^ this->__PVT__p12) 
			     ^ __PVT__t2__DOT__t3->__PVT__out) 
			    ^ this->__PVT__p30) ^ vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k3b[0U]);
    this->state_out[1U] = ((((this->__PVT__p02 ^ __PVT__t1__DOT__t3->__PVT__out) 
			     ^ this->__PVT__p20) ^ this->__PVT__p31) 
			   ^ vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k3b[1U]);
    this->state_out[2U] = (IData)((((QData)((IData)(
						    ((((this->__PVT__p00 
							^ this->__PVT__p11) 
						       ^ this->__PVT__p22) 
						      ^ __PVT__t3__DOT__t3->__PVT__out) 
						     ^ 
						     vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k3b[3U]))) 
				    << 0x20U) | (QData)((IData)(
								((((__PVT__t0__DOT__t3->__PVT__out 
								    ^ this->__PVT__p10) 
								   ^ this->__PVT__p21) 
								  ^ this->__PVT__p32) 
								 ^ 
								 vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k3b[2U])))));
    this->state_out[3U] = (IData)(((((QData)((IData)(
						     ((((this->__PVT__p00 
							 ^ this->__PVT__p11) 
							^ this->__PVT__p22) 
						       ^ __PVT__t3__DOT__t3->__PVT__out) 
						      ^ 
						      vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k3b[3U]))) 
				     << 0x20U) | (QData)((IData)(
								 ((((__PVT__t0__DOT__t3->__PVT__out 
								     ^ this->__PVT__p10) 
								    ^ this->__PVT__p21) 
								   ^ this->__PVT__p32) 
								  ^ 
								  vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k3b[2U])))) 
				   >> 0x20U));
}

VL_INLINE_OPT void Voc8051_tb_one_round::_sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r5__15(Voc8051_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Voc8051_tb_one_round::_sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r5__15\n"); );
    Voc8051_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at aes_round.v:46
    this->state_out[0U] = ((((this->__PVT__p01 ^ this->__PVT__p12) 
			     ^ __PVT__t2__DOT__t3->__PVT__out) 
			    ^ this->__PVT__p30) ^ vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k4b[0U]);
    this->state_out[1U] = ((((this->__PVT__p02 ^ __PVT__t1__DOT__t3->__PVT__out) 
			     ^ this->__PVT__p20) ^ this->__PVT__p31) 
			   ^ vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k4b[1U]);
    this->state_out[2U] = (IData)((((QData)((IData)(
						    ((((this->__PVT__p00 
							^ this->__PVT__p11) 
						       ^ this->__PVT__p22) 
						      ^ __PVT__t3__DOT__t3->__PVT__out) 
						     ^ 
						     vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k4b[3U]))) 
				    << 0x20U) | (QData)((IData)(
								((((__PVT__t0__DOT__t3->__PVT__out 
								    ^ this->__PVT__p10) 
								   ^ this->__PVT__p21) 
								  ^ this->__PVT__p32) 
								 ^ 
								 vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k4b[2U])))));
    this->state_out[3U] = (IData)(((((QData)((IData)(
						     ((((this->__PVT__p00 
							 ^ this->__PVT__p11) 
							^ this->__PVT__p22) 
						       ^ __PVT__t3__DOT__t3->__PVT__out) 
						      ^ 
						      vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k4b[3U]))) 
				     << 0x20U) | (QData)((IData)(
								 ((((__PVT__t0__DOT__t3->__PVT__out 
								     ^ this->__PVT__p10) 
								    ^ this->__PVT__p21) 
								   ^ this->__PVT__p32) 
								  ^ 
								  vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k4b[2U])))) 
				   >> 0x20U));
}

VL_INLINE_OPT void Voc8051_tb_one_round::_sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r6__16(Voc8051_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Voc8051_tb_one_round::_sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r6__16\n"); );
    Voc8051_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at aes_round.v:46
    this->state_out[0U] = ((((this->__PVT__p01 ^ this->__PVT__p12) 
			     ^ __PVT__t2__DOT__t3->__PVT__out) 
			    ^ this->__PVT__p30) ^ vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k5b[0U]);
    this->state_out[1U] = ((((this->__PVT__p02 ^ __PVT__t1__DOT__t3->__PVT__out) 
			     ^ this->__PVT__p20) ^ this->__PVT__p31) 
			   ^ vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k5b[1U]);
    this->state_out[2U] = (IData)((((QData)((IData)(
						    ((((this->__PVT__p00 
							^ this->__PVT__p11) 
						       ^ this->__PVT__p22) 
						      ^ __PVT__t3__DOT__t3->__PVT__out) 
						     ^ 
						     vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k5b[3U]))) 
				    << 0x20U) | (QData)((IData)(
								((((__PVT__t0__DOT__t3->__PVT__out 
								    ^ this->__PVT__p10) 
								   ^ this->__PVT__p21) 
								  ^ this->__PVT__p32) 
								 ^ 
								 vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k5b[2U])))));
    this->state_out[3U] = (IData)(((((QData)((IData)(
						     ((((this->__PVT__p00 
							 ^ this->__PVT__p11) 
							^ this->__PVT__p22) 
						       ^ __PVT__t3__DOT__t3->__PVT__out) 
						      ^ 
						      vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k5b[3U]))) 
				     << 0x20U) | (QData)((IData)(
								 ((((__PVT__t0__DOT__t3->__PVT__out 
								     ^ this->__PVT__p10) 
								    ^ this->__PVT__p21) 
								   ^ this->__PVT__p32) 
								  ^ 
								  vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k5b[2U])))) 
				   >> 0x20U));
}

VL_INLINE_OPT void Voc8051_tb_one_round::_sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r7__17(Voc8051_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Voc8051_tb_one_round::_sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r7__17\n"); );
    Voc8051_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at aes_round.v:46
    this->state_out[0U] = ((((this->__PVT__p01 ^ this->__PVT__p12) 
			     ^ __PVT__t2__DOT__t3->__PVT__out) 
			    ^ this->__PVT__p30) ^ vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k6b[0U]);
    this->state_out[1U] = ((((this->__PVT__p02 ^ __PVT__t1__DOT__t3->__PVT__out) 
			     ^ this->__PVT__p20) ^ this->__PVT__p31) 
			   ^ vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k6b[1U]);
    this->state_out[2U] = (IData)((((QData)((IData)(
						    ((((this->__PVT__p00 
							^ this->__PVT__p11) 
						       ^ this->__PVT__p22) 
						      ^ __PVT__t3__DOT__t3->__PVT__out) 
						     ^ 
						     vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k6b[3U]))) 
				    << 0x20U) | (QData)((IData)(
								((((__PVT__t0__DOT__t3->__PVT__out 
								    ^ this->__PVT__p10) 
								   ^ this->__PVT__p21) 
								  ^ this->__PVT__p32) 
								 ^ 
								 vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k6b[2U])))));
    this->state_out[3U] = (IData)(((((QData)((IData)(
						     ((((this->__PVT__p00 
							 ^ this->__PVT__p11) 
							^ this->__PVT__p22) 
						       ^ __PVT__t3__DOT__t3->__PVT__out) 
						      ^ 
						      vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k6b[3U]))) 
				     << 0x20U) | (QData)((IData)(
								 ((((__PVT__t0__DOT__t3->__PVT__out 
								     ^ this->__PVT__p10) 
								    ^ this->__PVT__p21) 
								   ^ this->__PVT__p32) 
								  ^ 
								  vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k6b[2U])))) 
				   >> 0x20U));
}

VL_INLINE_OPT void Voc8051_tb_one_round::_sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r8__18(Voc8051_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Voc8051_tb_one_round::_sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r8__18\n"); );
    Voc8051_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at aes_round.v:46
    this->state_out[0U] = ((((this->__PVT__p01 ^ this->__PVT__p12) 
			     ^ __PVT__t2__DOT__t3->__PVT__out) 
			    ^ this->__PVT__p30) ^ vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k7b[0U]);
    this->state_out[1U] = ((((this->__PVT__p02 ^ __PVT__t1__DOT__t3->__PVT__out) 
			     ^ this->__PVT__p20) ^ this->__PVT__p31) 
			   ^ vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k7b[1U]);
    this->state_out[2U] = (IData)((((QData)((IData)(
						    ((((this->__PVT__p00 
							^ this->__PVT__p11) 
						       ^ this->__PVT__p22) 
						      ^ __PVT__t3__DOT__t3->__PVT__out) 
						     ^ 
						     vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k7b[3U]))) 
				    << 0x20U) | (QData)((IData)(
								((((__PVT__t0__DOT__t3->__PVT__out 
								    ^ this->__PVT__p10) 
								   ^ this->__PVT__p21) 
								  ^ this->__PVT__p32) 
								 ^ 
								 vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k7b[2U])))));
    this->state_out[3U] = (IData)(((((QData)((IData)(
						     ((((this->__PVT__p00 
							 ^ this->__PVT__p11) 
							^ this->__PVT__p22) 
						       ^ __PVT__t3__DOT__t3->__PVT__out) 
						      ^ 
						      vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k7b[3U]))) 
				     << 0x20U) | (QData)((IData)(
								 ((((__PVT__t0__DOT__t3->__PVT__out 
								     ^ this->__PVT__p10) 
								    ^ this->__PVT__p21) 
								   ^ this->__PVT__p32) 
								  ^ 
								  vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k7b[2U])))) 
				   >> 0x20U));
}

VL_INLINE_OPT void Voc8051_tb_one_round::_sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r9__10(Voc8051_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Voc8051_tb_one_round::_sequent__TOP__oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__r9__10\n"); );
    Voc8051_tb* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at aes_round.v:46
    this->state_out[0U] = ((((this->__PVT__p01 ^ this->__PVT__p12) 
			     ^ __PVT__t2__DOT__t3->__PVT__out) 
			    ^ this->__PVT__p30) ^ vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k8b[0U]);
    this->state_out[1U] = ((((this->__PVT__p02 ^ __PVT__t1__DOT__t3->__PVT__out) 
			     ^ this->__PVT__p20) ^ this->__PVT__p31) 
			   ^ vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k8b[1U]);
    this->state_out[2U] = (IData)((((QData)((IData)(
						    ((((this->__PVT__p00 
							^ this->__PVT__p11) 
						       ^ this->__PVT__p22) 
						      ^ __PVT__t3__DOT__t3->__PVT__out) 
						     ^ 
						     vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k8b[3U]))) 
				    << 0x20U) | (QData)((IData)(
								((((__PVT__t0__DOT__t3->__PVT__out 
								    ^ this->__PVT__p10) 
								   ^ this->__PVT__p21) 
								  ^ this->__PVT__p32) 
								 ^ 
								 vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k8b[2U])))));
    this->state_out[3U] = (IData)(((((QData)((IData)(
						     ((((this->__PVT__p00 
							 ^ this->__PVT__p11) 
							^ this->__PVT__p22) 
						       ^ __PVT__t3__DOT__t3->__PVT__out) 
						      ^ 
						      vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k8b[3U]))) 
				     << 0x20U) | (QData)((IData)(
								 ((((__PVT__t0__DOT__t3->__PVT__out 
								     ^ this->__PVT__p10) 
								    ^ this->__PVT__p21) 
								   ^ this->__PVT__p32) 
								  ^ 
								  vlTOPp->oc8051_tb__DOT__oc8051_xiommu1__DOT__aes_top_i__DOT__aes_128_i__DOT__k8b[2U])))) 
				   >> 0x20U));
}

void Voc8051_tb_one_round::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Voc8051_tb_one_round::_ctor_var_reset\n"); );
    // Body
    clk = VL_RAND_RESET_I(1);
    VL_RAND_RESET_W(128,state_in);
    VL_RAND_RESET_W(128,key);
    VL_RAND_RESET_W(128,state_out);
    __PVT__p00 = VL_RAND_RESET_I(32);
    __PVT__p01 = VL_RAND_RESET_I(32);
    __PVT__p02 = VL_RAND_RESET_I(32);
    __PVT__p10 = VL_RAND_RESET_I(32);
    __PVT__p11 = VL_RAND_RESET_I(32);
    __PVT__p12 = VL_RAND_RESET_I(32);
    __PVT__p20 = VL_RAND_RESET_I(32);
    __PVT__p21 = VL_RAND_RESET_I(32);
    __PVT__p22 = VL_RAND_RESET_I(32);
    __PVT__p30 = VL_RAND_RESET_I(32);
    __PVT__p31 = VL_RAND_RESET_I(32);
    __PVT__p32 = VL_RAND_RESET_I(32);
}
