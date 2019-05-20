#include "xmodel.h"
#include <iomanip>
#include <fstream>

xm_state_t::xm_state_t()
{
    aes.reg_state = 0;
    aes.reg_addr = 0;
    aes.reg_len  = 0;
    aes.reg_num_op_bytes = 0;
    aes.reg_block_ctr = 0;

    for(int i=0; i != 16; i++) {
        aes.reg_ctr[i] = aes.reg_key[i] = 0;
    }

    sha.reg_state = 0;
    sha.reg_rdaddr = 0;
    sha.reg_wraddr = 0;
    sha.reg_len = 0;
    sha.reg_bytes_read = 0;
    sha.reg_block_ctr = 0;

    xram.def = 0;
    xram.others.clear();
}

void xm_state_t::read(std::istream& in)
{
    in >> std::hex >> aes.reg_state;
    in >> std::hex >> aes.reg_addr;
    in >> std::hex >> aes.reg_len;
    in >> std::hex >> aes.reg_num_op_bytes;
    in >> std::hex >> aes.reg_block_ctr;
    for(unsigned i=0; i != 16; i++) {
        int c;
        in >> std::hex >> c;
        aes.reg_ctr[i] = c;
    }
    for(unsigned i=0; i != 16; i++) {
        int c;
        in >> std::hex >> c;
        aes.reg_key[i] = c;
    }

    in >> std::hex >> sha.reg_state;
    in >> std::hex >> sha.reg_rdaddr;
    in >> std::hex >> sha.reg_wraddr;
    in >> std::hex >> sha.reg_len;
    in >> std::hex >> sha.reg_bytes_read;
    in >> std::hex >> sha.reg_block_ctr;

    in >> xram;
}

void xm_state_t::write(std::ostream& out)
{
    out << std::hex << aes.reg_state << " ";
    out << std::hex << aes.reg_addr << " ";
    out << std::hex << aes.reg_len << " ";
    out << std::hex << aes.reg_num_op_bytes << " ";
    out << std::hex << aes.reg_block_ctr << std::endl;

    for(unsigned i=0; i != 16; i++) {
        out << std::hex << (int) aes.reg_ctr[i] << " ";
    }
    out << std::endl;

    for(unsigned i=0; i != 16; i++) {
        out << std::hex << (int) aes.reg_key[i] << " ";
    }
    out << std::endl;

    out << std::hex << sha.reg_state << " ";
    out << std::hex << sha.reg_rdaddr << " ";
    out << std::hex << sha.reg_wraddr << " ";
    out << std::hex << sha.reg_len << " ";
    out << std::hex << sha.reg_bytes_read << " ";
    out << std::hex << sha.reg_block_ctr << " ";
    out << std::endl;

    out << xram << std::endl;
}

bool xm_state_t::operator==(const xm_state_t& other) const
{
    if(aes.reg_state != other.aes.reg_state) return false;
    if(aes.reg_addr != other.aes.reg_addr) return false;
    if(aes.reg_len != other.aes.reg_len) return false;
    if(aes.reg_num_op_bytes != other.aes.reg_num_op_bytes) return false;
    if(aes.reg_block_ctr != other.aes.reg_block_ctr) return false;
    for(int i=0; i < 16; i++) {
        if(aes.reg_ctr[i] != other.aes.reg_ctr[i]) return false;
        if(aes.reg_key[i] != other.aes.reg_key[i]) return false;
    }

    if(sha.reg_state != other.sha.reg_state) return false;
    if(sha.reg_rdaddr != other.sha.reg_rdaddr) return false;
    if(sha.reg_wraddr != other.sha.reg_wraddr) return false;
    if(sha.reg_len != other.sha.reg_len) return false;
    if(sha.reg_bytes_read != other.sha.reg_bytes_read) return false;
    if(sha.reg_block_ctr != other.sha.reg_block_ctr) return false;

    if(xram.def != other.xram.def) return false;
    if(xram.others != other.xram.others) return false;
    return true;
}

void xm_init_state(const xm_state_t& state)
{
    set_aes_state(state.aes.reg_state);
    set_aes_addr(state.aes.reg_addr);
    set_aes_len(state.aes.reg_len);
    set_aes_num_op_bytes(state.aes.reg_num_op_bytes);
    set_aes_block_ctr(state.aes.reg_block_ctr);
    set_aes_ctr(state.aes.reg_ctr);
    set_aes_key(state.aes.reg_key);

    set_sha_state(state.sha.reg_state);
    set_sha_rdaddr(state.sha.reg_rdaddr);
    set_sha_wraddr(state.sha.reg_wraddr);
    set_sha_len(state.sha.reg_len);
    set_sha_bytes_read(state.sha.reg_bytes_read);
    set_sha_block_ctr(state.sha.reg_block_ctr);

    set_xram_val(state.xram);
}

void xm_read_state(xm_state_t& state)
{
    state.aes.reg_state = get_aes_state();
    state.aes.reg_addr = get_aes_addr();
    state.aes.reg_len = get_aes_len();
    state.aes.reg_num_op_bytes = get_aes_num_op_bytes();
    state.aes.reg_block_ctr = get_aes_block_ctr();
    get_aes_ctr(state.aes.reg_ctr);
    get_aes_key(state.aes.reg_key);

    state.sha.reg_state = get_sha_state();
    state.sha.reg_rdaddr = get_sha_rdaddr();
    state.sha.reg_wraddr = get_sha_wraddr();
    state.sha.reg_len = get_sha_len();
    state.sha.reg_bytes_read = get_sha_bytes_read();
    state.sha.reg_block_ctr = get_sha_block_ctr();

    get_xram_val(state.xram);
}

void eval_state(
    xm_op_t op,
    int addrin,
    int datain,
    int& dataout,
    const xm_state_t& state_in,
    xm_state_t& state_out
)
{

    if (op == XM_RD || op == XM_WR) {
        top->proc_wr = (op == XM_WR) ? 1 : 0; 
        top->proc_stb = 1; 
        top->proc_addr = addrin; 
        top->proc_data_in = datain;
        xm_init_state(state_in);

        do {
            incrtime(10);
        } while(top->proc_ack == 0);
        top->proc_stb = 0; top->proc_wr = 0;
        dataout = top->proc_data_out;
        xm_read_state(state_out);
    } else {
        top->proc_wr = 0;
        top->proc_stb = 0; 
        top->proc_addr = addrin; 
        top->proc_data_in = datain;

        xm_init_state(state_in);

        if (state_in.aes.reg_state == 0 && state_in.sha.reg_state == 0) {
            incrtime(10);
        } else {
            assert(state_in.aes.reg_state == 0 || state_in.aes.reg_state == 1);
            assert(state_in.sha.reg_state == 0 || state_in.sha.reg_state == 1);

            int aes_state, sha_state;
            bool different_state = false;
            do {
                incrtime(10);
                aes_state = get_aes_state();
                sha_state = get_sha_state();

                if (different_state && (aes_state == 0 || aes_state == 1)) break;
                if (different_state && (sha_state == 0 || sha_state == 1)) break;

                if (aes_state != state_in.aes_reg_state) {
                    different_state = true;
                }
                if (sha_state != state_in.sha.reg_state) {
                    different_state == true;
                }
            } while (true);
        }
        dataout = top->proc_data_out;
        xm_read_state(state_out);
    }
}

void test_harness(void)
{
    top->rst = 1;
    incrtime(50);

    top->rst = 0;
    incrtime(21);

    xm_state_t s0;
    s0.aes.reg_state = 0;
    s0.aes.reg_addr = 0x1000;
    s0.aes.reg_len  = 0x10;

    for(int i=0; i < 16; i++) {
        s0.aes.reg_ctr[i] = 0;
        s0.aes.reg_key[i] = i;
    }

    for(int i=0; i < 0x100; i++) {
        s0.xram.set_val(0x1000+i, i);
    }

    xm_state_t s1;
    int dataout = 0;
    eval_state(XM_NOP, 0x0, 0x0, dataout, s0, s1);
    s0 = s1;

    eval_state(XM_WR, 0xFF00, 0x1, dataout, s0, s1);
    assert(s1.aes.reg_state == 1);
    s0 = s1;

    std::cout << "initial data: " << std::endl;
    for(int i=0; i < 0x100; i++) {
        if((i % 32) == 0 && i != 0) {
            std::cout << std::endl;
        }
        int vi = s0.xram.get_val(i+0x1000);
        std::cout << std::hex << std::setw(2) << vi << " ";
    }
    std::cout << std::endl;

    int done = 0;
    do {
        eval_state(XM_NOP, 0x0, 0x0, dataout, s0, s1);
        done = s1.aes.reg_state == 0;
        s0 = s1;
    } while(!done);

    std::cout << "encrypted data: " << std::endl;
    for(int i=0; i < 0x100; i++) {
        if((i % 32) == 0 && i != 0) {
            std::cout << std::endl;
        }
        int vi = s0.xram.get_val(i+0x1000);
        std::cout << std::hex << std::setw(2) << vi << " ";
    }
    std::cout << std::endl;

    eval_state(XM_WR, 0xFF00, 0x1, dataout, s0, s1);
    assert(s1.aes.reg_state == 1);
    s0 = s1;

    done = 0;
    int iter=0;
    do {
        iter++;
        eval_state(XM_NOP, 0x0, 0x0, dataout, s0, s1);
        done = s1.aes.reg_state == 0;
        s0 = s1;
    } while(!done);

    std::cout << "decrypted data: " << std::endl;
    for(int i=0; i < 0x100; i++) {
        if((i % 32) == 0 && i != 0) {
            std::cout << std::endl;
        }
        int vi = s0.xram.get_val(i+0x1000);
        std::cout << std::hex << std::setw(2) << vi << " ";
    }
    std::cout << std::endl;


    s0.sha.reg_rdaddr = 0x1000;
    s0.sha.reg_wraddr = 0x2000;
    s0.sha.reg_len  = 0x100;
    for(int i=0; i < 0x100; i++) {
        s0.xram.set_val(0x1000+i, i);
    }

    eval_state(XM_WR, 0xFE00, 0x1, dataout, s0, s1);
    assert(s1.sha.reg_state == 1);
    s0 = s1;

    done = 0;
    do {
        eval_state(XM_NOP, 0x0, 0x0, dataout, s0, s1);
        done = s1.sha.reg_state == 0;
        s0 = s1;
    } while(!done);

    std::cout << "hash: " << std::endl;
    for(int i=0; i < 20; i++) {
        int vi = s0.xram.get_val(i+0x2000);
        std::cout << std::hex << std::setw(2) << vi << " ";
    }
    std::cout << std::endl;

}

void xm_simulate(const char* filein)
{
    std::ifstream fin(filein);

    if(!fin) {
        std::cout << "error opening file." << std::endl;
        return;
    }

    int op, addrin, datain, dataout;
    xm_state_t sin, sout;

    fin >> std::hex >> op;
    fin >> std::hex >> addrin;
    fin >> std::hex >> datain;
    sin.read(fin);

    assert(op == XM_NOP || op == XM_RD || op == XM_WR);

    eval_state((xm_op_t)op, addrin, datain, dataout, sin, sout);
    std::cout << std::hex << dataout << std::endl;
    sout.write(std::cout);
}
