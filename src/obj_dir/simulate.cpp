#include <iostream>
#include "simulate.h"
#include <fstream>

Vsim8051_top* top = NULL;

void initRom(const int& addr, const int& data)
{
    // TODO
    top->v__DOT__sim8051_rom_1__DOT__buff[addr] = (uint8_t)data;
}
bool noninit = false;
void setOthers()
{
    top->int0_i = 0;
    top->int1_i = 0;
    top->ea_in = 0;
    top->wbd_ack_i = 1;
    top->wbi_ack_i = 1;
    top->wbd_err_i = 0;
    top->wbi_err_i = 0;
//    top->wbd_dat_i = 0xfc;
//    top->wbd_dat_i = (noninit) ? 0x01 : 0xfc; 
    top->p0_i = 0;
    top->p1_i = 0;
    top->p2_i = 0;
    top->p3_i = 0;
    top->wbi_dat_i = 0xfa;
}

void incrTime()
{
    for (int i=0; i<20; i++) {
        if (i % 20 == 10) {
            top->clk = 1;
        } else if (i % 20 == 0) {
            top->clk = 0;
        }
        setOthers();
        top->eval();
    }
}

//std::ofstream out("states.txt");
std::ostream& out = cout;

void printOutStates()
{
    out << std::hex << "pc: " << top->pc << " " 
        << (int)top->v__DOT__oc8051_top_1__DOT__mem_pc << " " 
        << std::hex 
        << "op: "  
        << (int)top->op1 << " " 
        << (int)top->op1_d << " " 
        << (int)top->op2 << " " 
        << (int)top->op3 << " "
        << (int)top->v__DOT__oc8051_top_1__DOT__op1_n << " " 

        << "acc: " 
        << (int)top->acc << " "
        << (int)top->v__DOT__oc8051_top_1__DOT__oc8051_sfr1__DOT__oc8051_acc1__DOT__acc << " "
        << (int)top->__Vchglast__TOP__v__DOT__oc8051_top_1__DOT__oc8051_sfr1__DOT__oc8051_acc1__DOT__acc << " " 
        << (int)top->v__DOT__oc8051_top_1__DOT__des_acc << " "

        << "rom: " << std::hex << top->rom_addr_in << " " << top->rom_data_out << " ";
    out << "\n";
}

void testRom()
{
    std::cout << "Start Reset\n";
    for (int i=0; i<7; i++) {
        top->init = 0;
        incrTime();
        printOutStates();
    }
    std::cout << "End Reset\n";
    noninit = true;
    for (int i=0; i<5; i++) {
        incrTime();
        printOutStates();
    }
//    std::cout << "break\n";
//    top->v__DOT__oc8051_top_1__DOT__mem_pc = 0;
//    top->v__DOT__oc8051_top_1__DOT__oc8051_memory_interface1__DOT__pc_buf = 0;
//    top->v__DOT__oc8051_top_1__DOT__oc8051_memory_interface1__DOT__pcs_result = 0;
//    top->v__DOT__oc8051_top_1__DOT__oc8051_memory_interface1__DOT__pc_out = 0;
    for (int i=0; i<25; i++) {
        incrTime();
        printOutStates();
    }
}

int main(int argc, char* argv[]) 
{
    top = new Vsim8051_top;

    top->rst = 0;
    // Initialize the ROM
    std::cout << "Init ROM\n";
    top->init = 1;
    // ADD 10
    // AJUMP
    for (int i = 0; i < 255; i++)
        initRom(i, 0);
    initRom(0x10, 0x24);
    initRom(0x11, 0x10);
    initRom(0x1c, 0x21);
   
    /*
    // begining of secureboot.v
    initRom(0x00, 0x2);
    initRom(0x01, 0x00);
    initRom(0x02, 0x34);
    initRom(0x03, 0x2);
    initRom(0x04, 0x00);
    initRom(0x05, 0xbc);
    initRom(0x06, 0xe5);
    initRom(0x07, 0x81);
    initRom(0x08, 0x24);
    initRom(0x09, 0xfc);
    initRom(0x0a, 0xc3);
    initRom(0x0b, 0xc8);
    initRom(0x0c, 0xc0);
    initRom(0x0d, 0xe0);
    initRom(0x0e, 0xc0);
    initRom(0x0f, 0x82);
    initRom(0x10, 0xe6);
    initRom(0x11, 0x8);
    initRom(0x12, 0x46);
    initRom(0x13, 0x70);
    initRom(0x14, 0x6);
    */

    // Reset 8051
    top->init = 0;
    testRom();

    // Run 8051

    // Get state update results
    
    top->eval();

    top->final();
//    out.close();
    return 0;
}
