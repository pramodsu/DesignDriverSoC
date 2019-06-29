#include <verilated.h>
#include <iostream>
#include "Voc8051_tb.h"
#include <array>
#include <fstream>
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
int addr;
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
    std::cout <<std::dec << "pc  " << top->oc8051_tb__DOT__oc8051_top_1__DOT__pc << std::endl;
    if (top->oc8051_tb__DOT__oc8051_top_1__DOT__pc == 382){
      top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[381] = 0x80;
      top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[382] = 0x02;
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
      std::cout << "wait @ " << main_time << " " << std::hex << ": "<< p0 << "-"<< p1 << "-" << p2 << "-" << p3 << std::endl;
      std::cout << "length " << std::hex << "- " << (int)top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[0U] << std::endl;
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
void test(){
  return;
}
void new_test(Voc8051_tb *top){
  //top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[0U] = 2U;
  std::ifstream infile("../test1.txt");
  int counter = 0 ;
  int num_buff,a,b;
  infile >> num_buff;
  for (int i=0; i<num_buff; i++){
    infile >> a;
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[i] = (unsigned int)a;
  }
  for (;num_buff<10000;num_buff++){
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[num_buff] = 0U;
  }

  return;
}
int main() {
  top  = new Voc8051_tb;
  //cxrom = new Voc8051_cxrom;
  top->oc8051_tb__DOT__rst = 1;
  top->oc8051_tb__DOT__p0_in = 0x00;
  top->oc8051_tb__DOT__p1_in = 0x00;
  top->oc8051_tb__DOT__p2_in = 0xff;
  std::cout << "length " << std::hex << "- " << (int)top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[0U] << std::endl;
  //std::cin >> temp;
  //top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[0U] = 5U;
  if(wait(5,top)){
    delete top;
    return 0;
  }
  //top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[0U] = 5U;
  //std::cout << "length " << std::hex << "- " << (int)top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[0U] << std::endl;
  top->oc8051_tb__DOT__rst = 0;
  wait(5,top);
  top->oc8051_tb__DOT__rst = 1;
  top->oc8051_tb__DOT__p0_in = 0x00;
  top->oc8051_tb__DOT__p1_in = 0x00;
  top->oc8051_tb__DOT__p2_in = 0xff;
  new_test(top);
  wait(5,top);
  std::cout << "length " << std::hex << "- " << (int)top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[0U] << std::endl;
  top->oc8051_tb__DOT__rst = 0;
  //cxrom->eval();
  test();
  if(wait(6400000,top)){
    delete top;
    return 0;
  }
  main_time++;
  //delete cxrom;
  delete top;
  return 0;
}
