// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header

#ifndef _Voc8051_top__Syms_H_
#define _Voc8051_top__Syms_H_

#include "verilated.h"

// INCLUDE MODULE CLASSES
#include "Voc8051_top.h"

// SYMS CLASS
class Voc8051_top__Syms : public VerilatedSyms {
  public:
    
    // LOCAL STATE
    const char* __Vm_namep;
    bool __Vm_didInit;
    
    // SUBCELL STATE
    Voc8051_top*                   TOPp;
    
    // CREATORS
    Voc8051_top__Syms(Voc8051_top* topp, const char* namep);
    ~Voc8051_top__Syms() {}
    
    // METHODS
    inline const char* name() { return __Vm_namep; }
    
} VL_ATTR_ALIGNED(64);

#endif // guard
