// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _Voc8051_rmw_cutout_H_
#define _Voc8051_rmw_cutout_H_

#include "verilated.h"
class Voc8051_rmw_cutout__Syms;

//----------

VL_MODULE(Voc8051_rmw_cutout) {
  public:
    // CELLS
    // Public to allow access to /*verilator_public*/ items;
    // otherwise the application code can consider these internals.
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(op_cur,7,0);
    VL_OUT8(bit_addr,0,0);
    VL_OUT8(pc_wr,0,0);
    VL_OUT8(rmw,0,0);
    VL_OUT8(comp_sel,1,0);
    VL_OUT8(pc_sel,2,0);
    //char	__VpadToAlign6[2];
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    static VL_ST_SIG8(__Vtable1_pc_wr[256],0,0);
    static VL_ST_SIG8(__Vtable1_pc_sel[256],2,0);
    static VL_ST_SIG8(__Vtable1_comp_sel[256],1,0);
    static VL_ST_SIG8(__Vtable1_rmw[256],0,0);
    static VL_ST_SIG8(__Vtable1_bit_addr[256],0,0);
    VL_SIG8(__Vtableidx1,7,0);
    //char	__VpadToAlign17[3];
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    Voc8051_rmw_cutout__Syms*	__VlSymsp;		// Symbol table
    
    // PARAMETERS
    // Parameters marked /*verilator public*/ for use by application code
    
    // CONSTRUCTORS
  private:
    Voc8051_rmw_cutout& operator= (const Voc8051_rmw_cutout&);	///< Copying not allowed
    Voc8051_rmw_cutout(const Voc8051_rmw_cutout&);	///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible WRT DPI scope names.
    Voc8051_rmw_cutout(const char* name="TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~Voc8051_rmw_cutout();
    
    // USER METHODS
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(Voc8051_rmw_cutout__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(Voc8051_rmw_cutout__Syms* symsp, bool first);
  private:
    static IData	_change_request(Voc8051_rmw_cutout__Syms* __restrict vlSymsp);
  public:
    static void	_combo__TOP__1(Voc8051_rmw_cutout__Syms* __restrict vlSymsp);
    static void	_eval(Voc8051_rmw_cutout__Syms* __restrict vlSymsp);
    static void	_eval_initial(Voc8051_rmw_cutout__Syms* __restrict vlSymsp);
    static void	_eval_settle(Voc8051_rmw_cutout__Syms* __restrict vlSymsp);
} VL_ATTR_ALIGNED(128);

#endif  /*guard*/
