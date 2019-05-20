// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _Vsim8051_rom_H_
#define _Vsim8051_rom_H_

#include "verilated.h"
class Vsim8051_rom__Syms;

//----------

VL_MODULE(Vsim8051_rom) {
  public:
    // CELLS
    // Public to allow access to /*verilator_public*/ items;
    // otherwise the application code can consider these internals.
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(clk,0,0);
    VL_IN8(rst,0,0);
    VL_IN8(wr,0,0);
    //char	__VpadToAlign3[1];
    VL_IN16(simrom_addr,15,0);
    VL_IN16(wr_addr,15,0);
    VL_IN(wr_data,31,0);
    VL_OUT(simrom_data_out,31,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    VL_SIG8(v__DOT__data_o0,7,0);
    VL_SIG8(v__DOT__data_o1,7,0);
    VL_SIG8(v__DOT__data_o2,7,0);
    VL_SIG8(v__DOT__data_o3,7,0);
    VL_SIG16(v__DOT__addr,15,0);
    //char	__VpadToAlign26[2];
    VL_SIG(v__DOT__idx,31,0);
    VL_SIG8(v__DOT__buff[65536],7,0);
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    VL_SIG8(__Vclklast__TOP__clk,0,0);
    //char	__VpadToAlign65573[3];
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    //char	__VpadToAlign65580[4];
    Vsim8051_rom__Syms*	__VlSymsp;		// Symbol table
    
    // PARAMETERS
    // Parameters marked /*verilator public*/ for use by application code
    
    // CONSTRUCTORS
  private:
    Vsim8051_rom& operator= (const Vsim8051_rom&);	///< Copying not allowed
    Vsim8051_rom(const Vsim8051_rom&);	///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible WRT DPI scope names.
    Vsim8051_rom(const char* name="TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~Vsim8051_rom();
    
    // USER METHODS
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(Vsim8051_rom__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(Vsim8051_rom__Syms* symsp, bool first);
  private:
    static QData	_change_request(Vsim8051_rom__Syms* __restrict vlSymsp);
  public:
    static void	_combo__TOP__2(Vsim8051_rom__Syms* __restrict vlSymsp);
    static void	_combo__TOP__4(Vsim8051_rom__Syms* __restrict vlSymsp);
    static void	_eval(Vsim8051_rom__Syms* __restrict vlSymsp);
    static void	_eval_initial(Vsim8051_rom__Syms* __restrict vlSymsp);
    static void	_eval_settle(Vsim8051_rom__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__1(Vsim8051_rom__Syms* __restrict vlSymsp);
    static void	_settle__TOP__3(Vsim8051_rom__Syms* __restrict vlSymsp);
} VL_ATTR_ALIGNED(128);

#endif  /*guard*/
