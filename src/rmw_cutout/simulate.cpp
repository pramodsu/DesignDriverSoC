#include <iostream>
#include <fstream>
#include <vector>

#include <assert.h>
#include <stdint.h>

#include <verilated.h>

#include "Voc8051_rmw_cutout.h"
#include "simulate.h"

Voc8051_rmw_cutout* top;
vluint64_t main_time = 0;

double sc_time_stamp() {
    return main_time;
}

int main(int argc, char *argv[])
{
    Verilated::commandArgs(argc, argv);
    top = new Voc8051_rmw_cutout();

    std::vector<int> rmw_ops;

    for(int i = 0; i < 256; i++) {
        top->op_cur = i;
        top->eval();
        if(top->rmw == 1) {
            rmw_ops.push_back(i);
        }
    }

    std::cout << "[";
    for(unsigned i=0; i != rmw_ops.size(); i++) {
        std::cout << std::hex << "0x" << rmw_ops[i];
        if(i+1 != rmw_ops.size()) {
            std::cout << ", ";
        }
    }
    std::cout << "]" << std::endl;


    delete top;
    return 0;
}
