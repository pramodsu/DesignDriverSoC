#include <verilated.h>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <array>

#include "Voc8051_tb.h"
#include "Voc8051_tb__Syms.h"

using namespace std;

//#include "Voc8051_cxrom.h"
//Voc8051_cxrom *cxrom;
Voc8051_tb *top;
vluint64_t main_time = 0;
int clk = 0;
int temp;
double sc_time_stamp() { return main_time; }
int p0,p1,p2,p3;
int addr, count = 0;

void tamper(Voc8051_tb* top) {
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[395] = 0x90;
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[396] = 0xe0;
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[397] = 0x0;
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[398] = 0x74;
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[399] = 0x1;
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[400] = 0xf0;
}
// introducing delay for each eval call
int  wait(unsigned long delay, Voc8051_tb *top){
  while(delay || delay == -1){
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
    //std::cout <<std::dec << "pc  " << top->oc8051_tb__DOT__oc8051_top_1__DOT__pc << std::endl;
    if (top->oc8051_tb__DOT__oc8051_top_1__DOT__pc == 407){
      count++;

    }

    if (addr != top->oc8051_tb__DOT__oc8051_top_1__DOT__iadr_o){
      addr = top->oc8051_tb__DOT__oc8051_top_1__DOT__iadr_o;
      //std::cout << "iadr_o " << addr << std::endl;
    }
    if (0 || p0 != top->oc8051_tb__DOT__p0_out ||
             p1 != top->oc8051_tb__DOT__p1_out ||
             p2 != top->oc8051_tb__DOT__p2_out ||
             p3 != top->oc8051_tb__DOT__p3_out)
    {
      std::cout << "wait @ " << 
                std::dec << std::setw(7) << main_time << " " << 
                std::hex << ": " <<
                std::setw(2) << p0 << "-" << 
                std::setw(2) << p1 << "-" << 
                std::setw(2) << p2 << "-" << 
                std::setw(2) << p3 << std::endl;

      p0 = top->oc8051_tb__DOT__p0_out;
      p1 = top->oc8051_tb__DOT__p1_out;
      p2 = top->oc8051_tb__DOT__p2_out;
      p3 = top->oc8051_tb__DOT__p3_out;
    }

    //std::cout << (unsigned long)main_time << std::endl;
    //std::cout << std::hex << "wait "<<(int) top->oc8051_tb__DOT__p0_out << "-" << (int)top->oc8051_tb__DOT__p1_out << "-" << (int)top->oc8051_tb__DOT__p2_out << "-" << (int)top->oc8051_tb__DOT__p3_out <<std::endl;
    delay--;
    main_time++;
    //std::cout << std::hex << "delay " << delay << top->oc8051_tb__DOT__rst << std::endl;
  }
  return 0;
}
void load_test(Voc8051_tb *top, const char* filename){
  //top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[0U] = 2U;
  std::ifstream infile(filename);
  unsigned num_buff, addr, data;
  infile >> num_buff;
  for (unsigned i=0; i != num_buff; i++){
    infile >> addr >> data;
    assert (addr == i);
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[addr] = data;
  }
  for (;num_buff<65535;num_buff++){
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[num_buff] = 0U;
  }

  return;
}

int reset_uc(Voc8051_tb* top)
{
  top->oc8051_tb__DOT__rst = 1;
  top->oc8051_tb__DOT__p0_in = 0x00;
  top->oc8051_tb__DOT__p1_in = 0x00;
  top->oc8051_tb__DOT__p2_in = 0xff;
  if(wait(5,top)){
    delete top;
    return 0;
  }
  top->oc8051_tb__DOT__rst = 0;
}

int main(int argc, char* argv[]) {
  top  = new Voc8051_tb;
  if(!reset_uc(top)) {
    delete top;
    return 1;
  }
  load_test(top, argv[1]);
  wait(-1, top);

  delete top;
  return 0;
}
