#include <iostream>
#include "Vsim8051_rom.h"

Vsim8051_rom* rom = NULL;

void setState() 
{
}

void getState()
{
    std::cout << "data_out: " << rom->simrom_data_out << "\n";
    if (rom->clk) 
        std::cout << "clk: 1\n";
    else 
        std::cout << "clk: 0\n";
}

void simEval(int nSteps)
{
    for (int i = 0; i != nSteps; i++) {
        for (int j = 0; j < 2; j++) {
            if (j % 2 == 0) {
                rom->clk = 0;
            } else if (j % 2 == 1) {
                rom->clk = 1;
            }
            rom->eval();
            getState();
        }
    }
}

int main(int argc, char* argv[])
{
    rom = new Vsim8051_rom;

    rom->rst = 1;
    simEval(1);

    rom->rst = 0;
    rom->wr_addr = 1;
    rom->wr_data = 0x010;
    rom->wr = 1;    
    simEval(1);

    rom->wr_addr = 5;
    rom->wr_data = 0x000A;
    rom->wr = 1;
    simEval(1);
    
    std::cout << "READ\n";
    rom->simrom_addr = 5;
    rom->wr = 0;
    simEval(1);

    std::cout << "READ\n";
    rom->rst = 0;
    rom->simrom_addr = 1;
    rom->wr = 0;
    simEval(1);

    std::cout << "FINAL\n";
    rom->final();
    return 0;
}
