#include <verilated.h>
#include <verilated_vcd_c.h>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <memory>
#include <array>

#include "Voc8051_tb.h"
#include "Voc8051_tb__Syms.h"

using namespace std;

Voc8051_tb *top = NULL;
VerilatedVcdC* tfp = NULL;
vluint64_t main_time = 0;
int clk = 0;
int temp;
double sc_time_stamp() { return main_time; }
int p0,p1,p2,p3;
int addr, count = 0;

// introducing delay for each eval call
int  wait(unsigned long delay, Voc8051_tb *top){
  while(delay){
    main_time++;
    if(Verilated::gotFinish()){   // check if verilog code is finished
      std::cout << "finished ";
      return 1;
    }
    if (clk == 1){
      clk =0;
    }else {
      clk = 1;
    }
    top->oc8051_tb__DOT__clk = clk;
    top->eval();
    if (tfp) {
      tfp->dump(main_time);
    }

    if (addr != top->oc8051_tb__DOT__oc8051_top_1__DOT__iadr_o){
      addr = top->oc8051_tb__DOT__oc8051_top_1__DOT__iadr_o;
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

    delay--;
  }
  return 0;
}
void load_test(Voc8051_tb *top, const char* filename){
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

int load_flash(Voc8051_tb* top, const char* filename)
{
    FILE* fp = fopen(filename, "rt");
    if (fp != NULL) {
        int i = 0;
        while (!feof(fp)) {
            int v = 0;
            fscanf(fp, "%x", &v);
            assert(v >= 0 && v <= 0xff);
            top->oc8051_tb__DOT__oc8051_xiommu1__DOT__memwr_i__DOT__block[i] = v;
            if (i == 65535) break;
            i++;
        }
        fclose(fp);
    }
}

int main(int argc, char* argv[]) {
  if (argc < 2) {
      std::cerr << "Syntax error. Usage: " << std::endl;
      std::cerr << argv[0] << " ROM-file [flash-file]" << std::endl;
      std::cerr << std::endl;
      std::cerr << "        ROM-file    is the file contain the instruction ROM." << std::endl;
      std::cerr << "        flash-file  is the file contain the data to be loaded in the flash." << std::endl;
      std::cerr << std::endl;
      return 1;
  }
  //Verilated::traceEverOn(true);
  //tfp = new VerilatedVcdC;
  top = new Voc8051_tb;
  //top->trace(tfp, 99);  // Trace 99 levels of hierarchy

  if(tfp) tfp->open("sim.vcd");
  top  = new Voc8051_tb;
  if(!reset_uc(top)) {
    delete top;
    return 1;
  }
  load_test(top, argv[1]);
  if (argc == 3) {
      load_flash(top, argv[2]);
  }
  wait(-1, top);

  if(tfp) {
    tfp->close();
    delete tfp;
  }
  delete top;
  return 0;
}
