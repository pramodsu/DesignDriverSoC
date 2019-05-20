// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table implementation internals

#include "Voc8051_rmw_cutout__Syms.h"
#include "Voc8051_rmw_cutout.h"

// FUNCTIONS
Voc8051_rmw_cutout__Syms::Voc8051_rmw_cutout__Syms(Voc8051_rmw_cutout* topp, const char* namep)
	// Setup locals
	: __Vm_namep(namep)
	, __Vm_activity(false)
	, __Vm_didInit(false)
	// Setup submodule names
{
    // Pointer to top level
    TOPp = topp;
    // Setup each module's pointers to their submodules
    // Setup each module's pointer back to symbol table (for public functions)
    TOPp->__Vconfigure(this, true);
    // Setup scope names
}
