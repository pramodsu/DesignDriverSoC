#ifndef _SIMULATE_H_DEFINED_
#define _SIMULATE_H_DEFINED_

#include <iostream>

#include "Voc8051_rmw_cutout.h"

extern Voc8051_rmw_cutout* top;
extern vluint64_t main_time;

double sc_time_stamp();

#endif
