#include <verilated.h>
#include <iostream>
#include "Voc8051_top.h"

Voc8051_top *top;
vluint64_t main_time = 0;

double sc_time_stamp() { return main_time; }

int main() {
  top  = new Voc8051_top;
 
  while(! Verilated::gotFinish()) {

    VL_OUT8(p0_o,7, 0);
    VL_OUT8(p1_o,7, 0);
    VL_OUT8(p2_o,7, 0);
    VL_OUT8(p3_o,7, 0);
    std::cout << "hello "<<(int) p0_o << "-" << (int)p1_o << "-" << (int)p2_o << "-" << (int)p3_o <<std::endl;
    top->eval();
    main_time++;
  }
  
  delete top;
}
