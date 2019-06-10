#include <verilated.h>
#include <iostream>
#include "Voc8051_top.h"

Voc8051_top *top;
vluint64_t main_time = 0;

double sc_time_stamp() { return main_time; }

int main(int argc, char* argv[])
{
  Verilated::commandArgs(argc, argv);
  top  = new Voc8051_top;
  int temp=0;
  while(! Verilated::gotFinish()) {

    VL_OUT8(p0_o,7, 0);
    VL_OUT8(p1_o,7, 0);
    VL_OUT8(p2_o,7, 0);
    VL_OUT8(p3_o,7, 0);
    if (temp == 0)
    {
      temp = (int)p0_o;
      std::cout << std::hex << "hello "<< p0_o << "-" << (int)p1_o << "-" << (int)p2_o << "-" << (int)p3_o <<std::endl;
    }
    if (temp != p0_o){
      std::cout << std::hex <<  p0_o << std::endl;
      std::cin >> temp;
    }

    std::cout << std::hex << "hello "<< p0_o << "-" << (int)p1_o << "-" << (int)p2_o << "-" << (int)p3_o <<std::endl;
    top->eval();
    //std::cout << "eval done " <<std::endl;
    std::cin >> temp;
    main_time++;
  }
  std::cout << "eval done " <<std::endl;
  delete top;
}
