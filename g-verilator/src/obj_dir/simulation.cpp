#include <verilated.h>
#include <iostream>
#include "Voc8051_tb.h"

Voc8051_tb *top;
vluint64_t main_time = 0;
int clk = 0;
int temp;
double sc_time_stamp() { return main_time; }

// introducing delay for each eval call
int  wait(unsigned long delay, Voc8051_tb *top){
  while(delay){
    if(Verilated::gotFinish()){   // check if verilog code is finished
      std::cout << "finished ";
      return 1;
      //std::cin >> temp;
    }
    if (clk == 1){
      clk =0;
    }else {
      clk = 1;
    }
    top->oc8051_tb__DOT__clk = clk;
    //if (main_time % 2 == 0){
    //  clk++;
    //  clk = clk % 2;
    //  top->oc8051_tb__DOT__clk = clk;
    //}
    top->eval();
    //std::cout << (unsigned long)main_time << std::endl;
    std::cout << std::hex << "wait "<<(int) top->oc8051_tb__DOT__p0_out << "-" << (int)top->oc8051_tb__DOT__p1_out << "-" << (int)top->oc8051_tb__DOT__p2_out << "-" << (int)top->oc8051_tb__DOT__p3_out <<std::endl;
    delay--;
    main_time++;
    //std::cout << std::hex << "delay " << delay << top->oc8051_tb__DOT__rst << std::endl;
  }
  return 0;
}

int main() {
  top  = new Voc8051_tb;
  top->oc8051_tb__DOT__rst = 1;
  top->oc8051_tb__DOT__p0_in = 0x00;
  top->oc8051_tb__DOT__p1_in = 0x00;
  top->oc8051_tb__DOT__p2_in = 0xff;
  if(wait(2000,top)){
    delete top;
    return 0;
  }
  top->oc8051_tb__DOT__rst = 0;
  if(wait(6400000,top)){
    delete top;
    return 0;
  }
  main_time++;

  delete top;
  return 0;
}
