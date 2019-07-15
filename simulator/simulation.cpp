#include <verilated.h>
#include <iostream>
#include "../src/obj_dir/Voc8051_tb.h"
#include <array>
#include <fstream>
#include <algorithm>
#include <iterator>
#include <ctime>
#include <cstdlib>
using namespace std;

//#include "Voc8051_cxrom.h"
//Voc8051_cxrom *cxrom;

vluint64_t main_time = 0;
int clk = 0;
int temp;
double sc_time_stamp() { return main_time; }
int p0,p1,p2,p3,p_zero;
int addr;
int one_byte_instruction[] = {0x26, 0x27, 0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f, 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x56, 0x57, 0x58, 0x59, 0x5a, 0x5b, 0x5c, 0x5d, 0x5e, 0x5f, 0xc3, 0xe4, 0xf4, 0xb3, 0xd4, 0x14, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x84, 0x04, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0xa3, 0xf6, 0xf7, 0xe6, 0xe7, 0xe8, 0xe9, 0xea, 0xeb, 0xec, 0xed, 0xee, 0xef, 0xf8, 0xf9, 0xfa, 0xfb, 0xfc, 0xfd, 0xfe, 0xff, 0x93, 0x83, 0xf0, 0xf2, 0xf3, 0xe0, 0xe2, 0xe3, 0xa4, 0x00, 0x46, 0x47, 0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f, 0x23, 0x33, 0x03, 0x13, 0x96, 0x97, 0x98, 0x99, 0x9a, 0x9b, 0x9c, 0x9d, 0x9e, 0x9f, 0xc4, 0xa5, 0xc6, 0xc7, 0xc8, 0xc9, 0xca, 0xcb, 0xcc, 0xcd, 0xce, 0xcf, 0x66, 0x67, 0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f};
int two_byte_instruction[] = {0x24, 0x25, 0x34, 0x35, 0x52, 0x54, 0x55, 0x82, 0xb0, 0xc2, 0xb2, 0x15, 0x05, 0x76, 0x77, 0xa6, 0xa7, 0x74, 0xe5, 0xa2, 0x78, 0x79, 0x7a, 0x7b, 0x7c, 0x7d, 0x7e, 0x7f, 0xa8, 0xa9, 0xaa, 0xab, 0xac, 0xad, 0xae, 0xaf, 0x92, 0x86, 0x87, 0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f, 0xf5, 0x42, 0x44, 0x45, 0x72, 0xa0, 0xd0, 0xc0, 0x94, 0x95, 0xc5, 0x62, 0x64, 0x65};
int three_byte_instruction[] = {0x53, 0x90, 0x75, 0x85, 0x43, 0x63};






void valid_correction(Voc8051_tb* top, int init, int fin){
  int next_instruction, x;
  size_t n = sizeof(one_byte_instruction)/sizeof(one_byte_instruction[0]);
  std::cout << std::dec << "one byte instructions " << n << std::endl;
  n = sizeof(two_byte_instruction)/sizeof(two_byte_instruction[0]);
  std::cout << std::dec << "two byte instructions " << n << std::endl;
  n = sizeof(three_byte_instruction)/sizeof(three_byte_instruction[0]);
  std::cout << std::dec << "three byte instructions " << n << std::endl;
  for (int i = init; i<=fin;){
    x = top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[i];
    if (std::find(std::begin(one_byte_instruction), std::end(one_byte_instruction), x) != std::end(one_byte_instruction)){
      next_instruction = i+1;
    }else if (std::find(std::begin(two_byte_instruction), std::end(two_byte_instruction), x) != std::end(two_byte_instruction)){
      next_instruction = i+2;
    }else if (std::find(std::begin(three_byte_instruction), std::end(three_byte_instruction), x) != std::end(three_byte_instruction)){
      next_instruction = i+2;
    }else{
      next_instruction = i+1;
      top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[i] = 0;
    }

    if (next_instruction > (fin+1)){
      for(int j = i;j<=fin;j++){
        top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[j] = 0;
      }
      break;
    }
    i = next_instruction;
  }
}


void tamper(Voc8051_tb* top, int init, int fin){
  std::ifstream infile;
  infile.open("afl-in/rand_code.txt");
  int a;
  for (int i = init; i<= fin; i++){
    infile >> a;
    a = a % 256;
    std::cout << std::dec << "hi " << top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[i]  << std::endl;
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[i] = (unsigned int)a;
    //std::cout << std::dec << a  << std::endl;
  }
  infile.close();
  valid_correction(top, init, fin);
  return;
}

// generating rand_code itself

void tamper_internal(Voc8051_tb* top, int init, int fin) {
  int rand_instruction;
  srand(time(0));
  for (int i = init; i<= fin; i++){
    //std::cin >>rand_instruction;
    rand_instruction = rand() % 256;
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[i] = rand_instruction;
  }
  valid_correction(top, init, fin);


    /*top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[395] = 0x90;
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[396] = 0xe0;
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[397] = 0x0;
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[398] = 0x74;
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[399] = 0x1;
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[400] = 0xf0;*/

}

// introducing delay for each eval call
int  wait(unsigned long delay, Voc8051_tb *top){
  int good = 0;
  int a = 0xff,b,c,d;
  while(delay || delay == -1){
    if(Verilated::gotFinish()){   // check if verilog code is finished
      std::cout << "finished " << std::endl;
      return a;
    }
    if (clk == 1){
      clk =0;
    }else {
      clk = 1;
    }
    top->oc8051_tb__DOT__clk = clk;
    top->eval();
    if (top->oc8051_tb__DOT__p0_out != p_zero){
      if(top->oc8051_tb__DOT__p0_out == 0xde){
        a = p_zero;
      }
      p_zero = top->oc8051_tb__DOT__p0_out;
      //std::cout << p_zero << std::endl;
    }
    //std:cout << "iadr " << std::dec << top->oc8051_tb__DOT__oc8051_top_1__DOT__iadr_o << std::endl;
    /*if (0 || p0 != top->oc8051_tb__DOT__p0_out ||
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
    }*/

    delay--;
    main_time++;
  }
  return 2;
}
void new_test(Voc8051_tb *top){
  std::ifstream infile;
  infile.open("test1.txt");
  int counter = 0 ;
  int num_buff,a,b;
  infile >> num_buff;
  //std::cout << num_buff << std::endl;
  for (int i=0; i<num_buff; i++){
    infile >> a;
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[i] = (unsigned int)a;
  }
  for (;num_buff<10000;num_buff++){
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[num_buff] = 0U;
  }
  infile.close();
  return;
}

int reset_uc(Voc8051_tb* top)
{
  top->oc8051_tb__DOT__rst = 1;
  top->oc8051_tb__DOT__p0_in = 0x00;
  top->oc8051_tb__DOT__p1_in = 0x00;
  top->oc8051_tb__DOT__p2_in = 0xff;
  int a = wait(5,top);
  //std::cout<< a << std::endl;
  if(a!=2){
    return 1;
  }
  top->oc8051_tb__DOT__rst = 0;
  a = wait(5,top);
  //std::cout<< a << std::endl;
  if(a!=2){
    return 1;
  }
}

void test(int option){
  Voc8051_tb *top;
  top  = new Voc8051_tb;
  if(!reset_uc(top)) {
    delete top;
    std::cout << "error reset top "  << std::endl;
    return;
  }

  new_test(top);
  if (option == 1)
    tamper(top,394,416);
  else if (option == 2)
    tamper_internal(top,394,416);
// check the random input
  ofstream outfile_code;
  outfile_code.open("rand_code.txt");
  for (int i = 394; i<= 416; i++){
    outfile_code << (int) (top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[i]) << "\n";
  }
  outfile_code.close();


  int r1 = wait(124000,top);
  //ofstream outfile;
  fstream outfile("out.txt", std::fstream::in | std::fstream::out | std::fstream::app);
  //outfile.open("out.txt");
  outfile << r1 << "\n";
  outfile.close();
  std::cout << "r1 " << r1 << std::endl;
  delete top;
  top = NULL;
}

int main(int argc, char *argv[]) {
  /*if(argc == 2){
    if (argv[1] == "1")
      test(1);
    else
      test(2);
  }else
    test(1);*/

  test(1);

  /*Voc8051_tb *top, *top_tempered;
  int good_changed = 0;
  int infini_loop = 0;
  int test_number = 20;
  std::cout << top << std::endl;
  while(test_number){
    std::cout << "start " << std::endl;
    try{
      top  = new Voc8051_tb;
      //top_tempered  = new Voc8051_tb;
    }
    catch(std::bad_alloc&){
      std::cout << "not creating new variables" << std::endl;
    }
    std::cout << top << std::endl;

    if(!reset_uc(top)) {
      delete top;
      std::cout << "error reset top "  << std::endl;
      return 1;
    }
    std::cout << top->oc8051_tb__DOT__rst << std::endl;
    if(!reset_uc(top_tempered)) {
      delete top_tempered;
      std::cout << "error reset top_tempered "  << std::endl;
      return 1;
    }
    new_test(top);
    //new_test(top_tempered);

    //tamper(top_tempered,394,417);

    int r1 = wait(64000,top);

    std::cout << "r1 " << r1 << std::endl;
    //int r2 = wait(6400,top_tempered);
    //std::cout << "r2 " << r2 << std::endl;
    if (r2 == 0xff){
      infini_loop++;
    }else if (r1 != r2){
      good_changed++;
    }
    delete top_tempered;
    top_tempered = NULL;
    delete top;
    top = NULL;

    //std::cout << "r2 " << r1 << std::endl;
    test_number--;
  }
  std::cout << good_changed << "  " << infini_loop << std::endl;*/
  return 0;
}
