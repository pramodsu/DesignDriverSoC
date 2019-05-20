// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsim8051_rom.h for the primary calling header

#include "Vsim8051_rom.h"      // For This
#include "Vsim8051_rom__Syms.h"

//--------------------
// STATIC VARIABLES


//--------------------

VL_CTOR_IMP(Vsim8051_rom) {
    Vsim8051_rom__Syms* __restrict vlSymsp = __VlSymsp = new Vsim8051_rom__Syms(this, name());
    Vsim8051_rom* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    clk = VL_RAND_RESET_I(1);
    rst = VL_RAND_RESET_I(1);
    wr = VL_RAND_RESET_I(1);
    simrom_addr = VL_RAND_RESET_I(16);
    wr_addr = VL_RAND_RESET_I(16);
    wr_data = VL_RAND_RESET_I(32);
    simrom_data_out = VL_RAND_RESET_I(32);
    v__DOT__addr = VL_RAND_RESET_I(16);
    { int __Vi0=0; for (; __Vi0<65536; ++__Vi0) {
	    v__DOT__buff[__Vi0] = VL_RAND_RESET_I(8);
    }}
    v__DOT__data_o0 = VL_RAND_RESET_I(8);
    v__DOT__data_o1 = VL_RAND_RESET_I(8);
    v__DOT__data_o2 = VL_RAND_RESET_I(8);
    v__DOT__data_o3 = VL_RAND_RESET_I(8);
    v__DOT__idx = VL_RAND_RESET_I(32);
    __Vclklast__TOP__clk = VL_RAND_RESET_I(1);
}

void Vsim8051_rom::__Vconfigure(Vsim8051_rom__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

Vsim8051_rom::~Vsim8051_rom() {
    delete __VlSymsp; __VlSymsp=NULL;
}

//--------------------


void Vsim8051_rom::eval() {
    Vsim8051_rom__Syms* __restrict vlSymsp = this->__VlSymsp; // Setup global symbol table
    Vsim8051_rom* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    VL_DEBUG_IF(VL_PRINTF("\n----TOP Evaluate Vsim8051_rom::eval\n"); );
    int __VclockLoop = 0;
    QData __Vchange=1;
    while (VL_LIKELY(__Vchange)) {
	VL_DEBUG_IF(VL_PRINTF(" Clock loop\n"););
	vlSymsp->__Vm_activity = true;
	_eval(vlSymsp);
	__Vchange = _change_request(vlSymsp);
	if (++__VclockLoop > 100) vl_fatal(__FILE__,__LINE__,__FILE__,"Verilated model didn't converge");
    }
}

void Vsim8051_rom::_eval_initial_loop(Vsim8051_rom__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    vlSymsp->__Vm_activity = true;
    int __VclockLoop = 0;
    QData __Vchange=1;
    while (VL_LIKELY(__Vchange)) {
	_eval_settle(vlSymsp);
	_eval(vlSymsp);
	__Vchange = _change_request(vlSymsp);
	if (++__VclockLoop > 100) vl_fatal(__FILE__,__LINE__,__FILE__,"Verilated model didn't DC converge");
    }
}

//--------------------
// Internal Methods

VL_INLINE_OPT void Vsim8051_rom::_sequent__TOP__1(Vsim8051_rom__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vsim8051_rom::_sequent__TOP__1\n"); );
    Vsim8051_rom* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    VL_SIG8(__Vdlyvval__v__DOT__buff__v0,7,0);
    VL_SIG8(__Vdlyvset__v__DOT__buff__v0,0,0);
    VL_SIG8(__Vdlyvval__v__DOT__buff__v1,7,0);
    VL_SIG8(__Vdlyvval__v__DOT__buff__v2,7,0);
    VL_SIG8(__Vdlyvval__v__DOT__buff__v3,7,0);
    //char	__VpadToAlign9[1];
    VL_SIG16(__Vdlyvdim0__v__DOT__buff__v0,15,0);
    VL_SIG16(__Vdlyvdim0__v__DOT__buff__v1,15,0);
    VL_SIG16(__Vdlyvdim0__v__DOT__buff__v2,15,0);
    VL_SIG16(__Vdlyvdim0__v__DOT__buff__v3,15,0);
    //char	__VpadToAlign18[2];
    // Body
    __Vdlyvset__v__DOT__buff__v0 = 0U;
    // ALWAYS at sim8051_rom.v:37
    if (vlTOPp->rst) {
	vlTOPp->v__DOT__idx = 0U;
	while (VL_GTES_III(1,32,32, 0xffffU, vlTOPp->v__DOT__idx)) {
	    vlTOPp->v__DOT__buff[(0xffffU & vlTOPp->v__DOT__idx)] = 0U;
	    vlTOPp->v__DOT__idx = ((IData)(1U) + vlTOPp->v__DOT__idx);
	}
    } else {
	vlTOPp->v__DOT__idx = 0U;
	while (VL_GTES_III(1,32,32, 0xffffU, vlTOPp->v__DOT__idx)) {
	    vlTOPp->v__DOT__buff[(0xffffU & vlTOPp->v__DOT__idx)] 
		= vlTOPp->v__DOT__buff[(0xffffU & vlTOPp->v__DOT__idx)];
	    vlTOPp->v__DOT__idx = ((IData)(1U) + vlTOPp->v__DOT__idx);
	}
	if (vlTOPp->wr) {
	    __Vdlyvval__v__DOT__buff__v0 = (0xffU & vlTOPp->wr_data);
	    __Vdlyvset__v__DOT__buff__v0 = 1U;
	    __Vdlyvdim0__v__DOT__buff__v0 = vlTOPp->v__DOT__addr;
	    __Vdlyvval__v__DOT__buff__v1 = (0xffU & 
					    (vlTOPp->wr_data 
					     >> 8U));
	    __Vdlyvdim0__v__DOT__buff__v1 = (0xffffU 
					     & ((IData)(1U) 
						+ (IData)(vlTOPp->v__DOT__addr)));
	    __Vdlyvval__v__DOT__buff__v2 = (0xffU & 
					    (vlTOPp->wr_data 
					     >> 0x10U));
	    __Vdlyvdim0__v__DOT__buff__v2 = (0xffffU 
					     & ((IData)(2U) 
						+ (IData)(vlTOPp->v__DOT__addr)));
	    __Vdlyvval__v__DOT__buff__v3 = (0xffU & 
					    (vlTOPp->wr_data 
					     >> 0x18U));
	    __Vdlyvdim0__v__DOT__buff__v3 = (0xffffU 
					     & ((IData)(3U) 
						+ (IData)(vlTOPp->v__DOT__addr)));
	    vlTOPp->simrom_data_out = 0U;
	} else {
	    vlTOPp->simrom_data_out = (((IData)(vlTOPp->v__DOT__data_o3) 
					<< 0x18U) | 
				       (((IData)(vlTOPp->v__DOT__data_o2) 
					 << 0x10U) 
					| (((IData)(vlTOPp->v__DOT__data_o1) 
					    << 8U) 
					   | (IData)(vlTOPp->v__DOT__data_o0))));
	}
    }
    // ALWAYSPOST at sim8051_rom.v:47
    if (__Vdlyvset__v__DOT__buff__v0) {
	vlTOPp->v__DOT__buff[__Vdlyvdim0__v__DOT__buff__v0] 
	    = __Vdlyvval__v__DOT__buff__v0;
	vlTOPp->v__DOT__buff[__Vdlyvdim0__v__DOT__buff__v1] 
	    = __Vdlyvval__v__DOT__buff__v1;
	vlTOPp->v__DOT__buff[__Vdlyvdim0__v__DOT__buff__v2] 
	    = __Vdlyvval__v__DOT__buff__v2;
	vlTOPp->v__DOT__buff[__Vdlyvdim0__v__DOT__buff__v3] 
	    = __Vdlyvval__v__DOT__buff__v3;
    }
}

VL_INLINE_OPT void Vsim8051_rom::_combo__TOP__2(Vsim8051_rom__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vsim8051_rom::_combo__TOP__2\n"); );
    Vsim8051_rom* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->v__DOT__addr = ((IData)(vlTOPp->wr) ? (IData)(vlTOPp->wr_addr)
			     : (IData)(vlTOPp->simrom_addr));
}

void Vsim8051_rom::_settle__TOP__3(Vsim8051_rom__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vsim8051_rom::_settle__TOP__3\n"); );
    Vsim8051_rom* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->v__DOT__addr = ((IData)(vlTOPp->wr) ? (IData)(vlTOPp->wr_addr)
			     : (IData)(vlTOPp->simrom_addr));
    vlTOPp->v__DOT__data_o0 = vlTOPp->v__DOT__buff[vlTOPp->v__DOT__addr];
    vlTOPp->v__DOT__data_o1 = vlTOPp->v__DOT__buff[
	(0xffffU & ((IData)(1U) + (IData)(vlTOPp->v__DOT__addr)))];
    vlTOPp->v__DOT__data_o2 = vlTOPp->v__DOT__buff[
	(0xffffU & ((IData)(2U) + (IData)(vlTOPp->v__DOT__addr)))];
    vlTOPp->v__DOT__data_o3 = vlTOPp->v__DOT__buff[
	(0xffffU & ((IData)(3U) + (IData)(vlTOPp->v__DOT__addr)))];
}

VL_INLINE_OPT void Vsim8051_rom::_combo__TOP__4(Vsim8051_rom__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vsim8051_rom::_combo__TOP__4\n"); );
    Vsim8051_rom* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->v__DOT__data_o0 = vlTOPp->v__DOT__buff[vlTOPp->v__DOT__addr];
    vlTOPp->v__DOT__data_o1 = vlTOPp->v__DOT__buff[
	(0xffffU & ((IData)(1U) + (IData)(vlTOPp->v__DOT__addr)))];
    vlTOPp->v__DOT__data_o2 = vlTOPp->v__DOT__buff[
	(0xffffU & ((IData)(2U) + (IData)(vlTOPp->v__DOT__addr)))];
    vlTOPp->v__DOT__data_o3 = vlTOPp->v__DOT__buff[
	(0xffffU & ((IData)(3U) + (IData)(vlTOPp->v__DOT__addr)))];
}

void Vsim8051_rom::_eval(Vsim8051_rom__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vsim8051_rom::_eval\n"); );
    Vsim8051_rom* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk)))) {
	vlTOPp->_sequent__TOP__1(vlSymsp);
    }
    vlTOPp->_combo__TOP__2(vlSymsp);
    vlTOPp->_combo__TOP__4(vlSymsp);
    // Final
    vlTOPp->__Vclklast__TOP__clk = vlTOPp->clk;
}

void Vsim8051_rom::_eval_initial(Vsim8051_rom__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vsim8051_rom::_eval_initial\n"); );
    Vsim8051_rom* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vsim8051_rom::final() {
    VL_DEBUG_IF(VL_PRINTF("    Vsim8051_rom::final\n"); );
    // Variables
    Vsim8051_rom__Syms* __restrict vlSymsp = this->__VlSymsp;
    Vsim8051_rom* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vsim8051_rom::_eval_settle(Vsim8051_rom__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vsim8051_rom::_eval_settle\n"); );
    Vsim8051_rom* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__3(vlSymsp);
}

VL_INLINE_OPT QData Vsim8051_rom::_change_request(Vsim8051_rom__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vsim8051_rom::_change_request\n"); );
    Vsim8051_rom* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}
