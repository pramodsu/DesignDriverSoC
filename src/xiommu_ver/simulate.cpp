#include <iostream>
#include <iomanip>

#include <assert.h>
#include <stdint.h>

#include <verilated.h>
#include "Voc8051_xiommu.h"
#include "aes_harness.h"
#include "sha_harness.h"
#include "xmodel.h"

#include <vector>
#include <map>


Voc8051_xiommu* top;
vluint64_t main_time = 0;
const int XRAM_SIZE = 65536;

int xram_val_t::get_val(int addr) const
{
    auto pos = others.find(addr);
    if (pos != others.end()) return pos->second;
    else return def;
}

void xram_val_t::set_val(int addr, int val)
{
    if(val != def)  {
        others[addr] = val;
    }
}

double sc_time_stamp() {
    return main_time;
}

void incrtime(int nsteps) {
    for(int i=0; i < nsteps; i++) {
        if(main_time % 10 == 0) {
            top->clk = 1;
        } else if(main_time % 10 == 5) {
            top->clk = 0;
        }
        top->eval();
        main_time++;
    }
}


void setWData(WDataOutP reg, const uint8_t* data, int len)
{
    memcpy(reg, data, len);
}

void getWData(WDataInP reg, uint8_t* data, int len)
{
    memcpy(data, reg, len);
}

int read_addr(uint16_t addr)
{
    top->proc_wr = 0; top->proc_stb = 1; top->proc_addr = addr; 
    do {
        incrtime(10);
    } while(top->proc_ack == 0);
    top->proc_stb = 0; top->proc_wr = 0;
    return (top->proc_data_out);
}

void write_addr(uint16_t addr, uint8_t data)
{
    top->proc_wr = 1; top->proc_stb = 1; top->proc_addr = addr; top->proc_data_in = data;
    do {
        incrtime(10);
    } while(top->proc_ack == 0);
    top->proc_stb = 0; top->proc_wr = 0;
}

void init_xram(uint8_t def)
{
    for(int i=0; i != XRAM_SIZE; i++) {
        top->v__DOT__oc8051_xram_i__DOT__buff[i] = def;
    }
}

void set_xram_val(int addr, int val)
{
    top->v__DOT__oc8051_xram_i__DOT__buff[addr] = val;
}

void set_xram_val(const xram_val_t& xv)
{
    init_xram(xv.def);
    for(auto it=xv.others.begin(); it != xv.others.end(); it++) {
        set_xram_val(it->first, it->second);
    }
}

int get_xram_val(int addr)
{
    return top->v__DOT__oc8051_xram_i__DOT__buff[addr];
}

void get_xram_val(xram_val_t& xv)
{
    std::map<int, int> counts;
    for(int i =0; i != XRAM_SIZE; i++) {
        counts[get_xram_val(i)] += 1;
    }

    int max_val = -1, max_count = 0;
    for(auto it=counts.begin(); it != counts.end(); it++) {
        if(it->second > max_count) {
            max_val = it->first;
            max_count = it->second;
        }
    }
    assert (max_val != -1);
    xv.def = max_val;
    xv.others.clear();
    for(int i=0; i != XRAM_SIZE; i++) {
        int vi = get_xram_val(i);
        if(vi != xv.def) {
            xv.others[i] = vi;
        }
    }
}

std::ostream& operator<<(std::ostream& out, const xram_val_t& xram)
{
    out << std::hex << xram.others.size() << " ";
    out << std::hex << xram.def << " " << std::endl;
    for (auto it : xram.others) {
        out << std::hex << it.first << " "
            << std::hex << it.second << " ";
    }
    return (out << std::dec);
}

std::istream& operator>>(std::istream& in, xram_val_t& xram)
{
    unsigned sz;
    in >> std::hex >> sz >> std::hex >> xram.def;

    xram.others.clear();
    for(unsigned i=0; i != sz; i++) {
        int addr, val;
        in >> std::hex >> addr >> std::hex >> val;
        xram.others[addr] = val;
    }
    assert(xram.others.size() == sz);

    in >> std::dec;
    return in;
}

int main(int argc, char* argv[])
{
    Verilated::commandArgs(argc, argv);
    if (argc != 2) {
        std::cerr << "Syntax error. " << std::endl;
        std::cerr << "Usage:  " << argv[0]  << " <state-file>" << std::endl;
        return 1;
    }
    top = new Voc8051_xiommu;

    // test_harness();
    xm_simulate(argv[1]);

    top->final();
    delete top;
}
