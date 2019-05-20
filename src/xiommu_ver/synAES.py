from ast import *
from synthesizer import Synthesizer
from aes_eval import AesState, eval_aes
import argparse

def createInputs(syn):
    #'state', 'addr', 'length', 'num_op_bytes', 'block_ctr',
    #'ctr', 'key', 'xram', 'op', 'addr_in', 'data_in'
    syn.addInput(BitVecVar('state', 1))
    syn.addInput(BitVecVar('addr', 16))
    syn.addInput(BitVecVar('length', 16))
    syn.addInput(BitVecVar('num_op_bytes', 16))
    syn.addInput(BitVecVar('block_ctr', 16))
    syn.addInput(BitVecVar('ctr', 128))
    syn.addInput(BitVecVar('key', 128))
    syn.addInput(MemVar('xram', 16, 8))
    syn.addInput(BitVecVar('op', 2))
    syn.addInput(BitVecVar('addr_in', 16))
    syn.addInput(BitVecVar('data_in', 8))
    for i in xrange(16):
        syn.addInput(FuncVar('AES%d' % i, 384, 8))

def to_byte_array(l, num_bytes):
    data = []
    for i in xrange(num_bytes):
        n = int((l >> (i*8)) & 0xFF)
        data.append(n)
    return data

def from_byte_array(bs):
    n = 0
    for b in reversed(bs):
        n = (n << 8) | b
    return n

def evalAES(sim_inputs, sim_outputs):
    inputs = {}
    for (k,v) in sim_inputs.iteritems():
        if k.startswith('AES'):
            continue
        elif k == 'ctr' or k == 'key':
            inputs[k] = to_byte_array(v, 16)
        else:
            inputs[k] = v

    sin = AesState(**inputs)
    data_out, sout = eval_aes(sin)

    sim_outputs['data_out'] = data_out
    for k in sout._fields:
        v = getattr(sout, k)
        if k == 'ctr' or k == 'key':
            sim_outputs[k] = from_byte_array(v)
        else:
            sim_outputs[k] = v

def write1byteReg(wr, addr, reg, REG_ADDR, data_in):
    return If(And(wr, Equal(addr, REG_ADDR)), data_in, reg)

def write2byteReg(wr, addr, reg, REG_ADDR, data_in):
    addr16 = Concat(Extract(15, 1, addr), BitVecVal(0, 1))
    hi_byte = Equal(Extract(0, 0, addr), BitVecVal(1, 1))

    reg_out = If(And(wr, Equal(addr16, REG_ADDR)),
                    If(hi_byte, Concat(data_in, Extract(7, 0, reg)),
                                Concat(Extract(15, 8, reg), data_in)),
                    reg)
    return reg_out                

def write16byteReg(wr, addr, reg, REG_ADDR, data_in):
    addr128 = Concat(Extract(15, 4, addr), BitVecVal(0, 4))
    reg_out = If(And(wr, Equal(addr128, REG_ADDR)),
                If(Equal(Extract(3, 0, addr), BitVecVal(0, 4)), Concat(Extract(127, 8, reg), data_in),
                If(Equal(Extract(3, 0, addr), BitVecVal(1, 4)), Concat(Extract(127, 16, reg), data_in, Extract(7, 0, reg)),
                If(Equal(Extract(3, 0, addr), BitVecVal(2, 4)), Concat(Extract(127, 24, reg), data_in, Extract(15, 0, reg)),
                If(Equal(Extract(3, 0, addr), BitVecVal(3, 4)), Concat(Extract(127, 32, reg), data_in, Extract(23, 0, reg)),
                If(Equal(Extract(3, 0, addr), BitVecVal(4, 4)), Concat(Extract(127, 40, reg), data_in, Extract(31, 0, reg)),
                If(Equal(Extract(3, 0, addr), BitVecVal(5, 4)), Concat(Extract(127, 48, reg), data_in, Extract(39, 0, reg)),
                If(Equal(Extract(3, 0, addr), BitVecVal(6, 4)), Concat(Extract(127, 56, reg), data_in, Extract(47, 0, reg)),
                If(Equal(Extract(3, 0, addr), BitVecVal(7, 4)), Concat(Extract(127, 64, reg), data_in, Extract(55, 0, reg)),
                If(Equal(Extract(3, 0, addr), BitVecVal(8, 4)), Concat(Extract(127, 72, reg), data_in, Extract(63, 0, reg)),
                If(Equal(Extract(3, 0, addr), BitVecVal(9, 4)), Concat(Extract(127, 80, reg), data_in, Extract(71, 0, reg)),
                If(Equal(Extract(3, 0, addr), BitVecVal(10, 4)), Concat(Extract(127, 88, reg), data_in, Extract(79, 0, reg)),
                If(Equal(Extract(3, 0, addr), BitVecVal(11, 4)), Concat(Extract(127, 96, reg), data_in, Extract(87, 0, reg)),
                If(Equal(Extract(3, 0, addr), BitVecVal(12, 4)), Concat(Extract(127, 104, reg), data_in, Extract(95, 0, reg)),
                If(Equal(Extract(3, 0, addr), BitVecVal(13, 4)), Concat(Extract(127, 112, reg), data_in, Extract(103, 0, reg)),
                If(Equal(Extract(3, 0, addr), BitVecVal(14, 4)), Concat(Extract(127, 120, reg), data_in, Extract(111, 0, reg)),
                Concat(data_in, Extract(119, 0, reg))))))))))))))))),
                reg)
    return reg_out

def getAESArgs(ctr, key, xram, addr, block_ctr):
    b0 = ReadMem(xram, Add(addr, Add(block_ctr, BitVecVal(0, 16))))
    b1 = ReadMem(xram, Add(addr, Add(block_ctr, BitVecVal(1, 16))))
    b2 = ReadMem(xram, Add(addr, Add(block_ctr, BitVecVal(2, 16))))
    b3 = ReadMem(xram, Add(addr, Add(block_ctr, BitVecVal(3, 16))))
    b4 = ReadMem(xram, Add(addr, Add(block_ctr, BitVecVal(4, 16))))
    b5 = ReadMem(xram, Add(addr, Add(block_ctr, BitVecVal(5, 16))))
    b6 = ReadMem(xram, Add(addr, Add(block_ctr, BitVecVal(6, 16))))
    b7 = ReadMem(xram, Add(addr, Add(block_ctr, BitVecVal(7, 16))))
    b8 = ReadMem(xram, Add(addr, Add(block_ctr, BitVecVal(8, 16))))
    b9 = ReadMem(xram, Add(addr, Add(block_ctr, BitVecVal(9, 16))))
    b10 = ReadMem(xram, Add(addr, Add(block_ctr, BitVecVal(10, 16))))
    b11 = ReadMem(xram, Add(addr, Add(block_ctr, BitVecVal(11, 16))))
    b12 = ReadMem(xram, Add(addr, Add(block_ctr, BitVecVal(12, 16))))
    b13 = ReadMem(xram, Add(addr, Add(block_ctr, BitVecVal(13, 16))))
    b14 = ReadMem(xram, Add(addr, Add(block_ctr, BitVecVal(14, 16))))
    b15 = ReadMem(xram, Add(addr, Add(block_ctr, BitVecVal(15, 16))))
    args = Concat(ctr, key, b0, b1, b2, b3,
                            b4, b5, b6, b7,
                            b8, b9, b10, b11,
                            b12, b13, b14, b15)
    return args

def getUpdatedXram(xram, addr, block_ctr, args, aesfns):
    f0 = Apply(aesfns[0], args)
    xram = WriteMem(xram, Add(addr, Add(block_ctr, BitVecVal(0, 16))), f0)
    f1 = Apply(aesfns[1], args)
    xram = WriteMem(xram, Add(addr, Add(block_ctr, BitVecVal(1, 16))), f0)
    f2 = Apply(aesfns[2], args)
    xram = WriteMem(xram, Add(addr, Add(block_ctr, BitVecVal(2, 16))), f0)
    f3 = Apply(aesfns[3], args)
    xram = WriteMem(xram, Add(addr, Add(block_ctr, BitVecVal(3, 16))), f0)
    f4 = Apply(aesfns[4], args)
    xram = WriteMem(xram, Add(addr, Add(block_ctr, BitVecVal(4, 16))), f0)
    f5 = Apply(aesfns[5], args)
    xram = WriteMem(xram, Add(addr, Add(block_ctr, BitVecVal(5, 16))), f0)
    f6 = Apply(aesfns[6], args)
    xram = WriteMem(xram, Add(addr, Add(block_ctr, BitVecVal(6, 16))), f0)
    f7 = Apply(aesfns[7], args)
    xram = WriteMem(xram, Add(addr, Add(block_ctr, BitVecVal(7, 16))), f0)
    f8 = Apply(aesfns[8], args)
    xram = WriteMem(xram, Add(addr, Add(block_ctr, BitVecVal(8, 16))), f0)
    f9 = Apply(aesfns[9], args)
    xram = WriteMem(xram, Add(addr, Add(block_ctr, BitVecVal(9, 16))), f0)
    f10 = Apply(aesfns[10], args)
    xram = WriteMem(xram, Add(addr, Add(block_ctr, BitVecVal(10, 16))), f0)
    f11 = Apply(aesfns[11], args)
    xram = WriteMem(xram, Add(addr, Add(block_ctr, BitVecVal(11, 16))), f0)
    f12 = Apply(aesfns[12], args)
    xram = WriteMem(xram, Add(addr, Add(block_ctr, BitVecVal(12, 16))), f0)
    f13 = Apply(aesfns[13], args)
    xram = WriteMem(xram, Add(addr, Add(block_ctr, BitVecVal(13, 16))), f0)
    f14 = Apply(aesfns[14], args)
    xram = WriteMem(xram, Add(addr, Add(block_ctr, BitVecVal(14, 16))), f0)
    f15 = Apply(aesfns[15], args)
    xram = WriteMem(xram, Add(addr, Add(block_ctr, BitVecVal(15, 16))), f0)
    return xram

def synAES(st):
    syn = Synthesizer()
    createInputs(syn)

    state = syn.inp('state')
    addr = syn.inp('addr')
    length = syn.inp('length')
    num_op_bytes = syn.inp('num_op_bytes')
    block_ctr = syn.inp('block_ctr')
    ctr = syn.inp('ctr')
    key = syn.inp('key')
    xram = syn.inp('xram')
    op = syn.inp('op')
    addr_in = syn.inp('addr_in')
    data_in = syn.inp('data_in')
    aesfns = [syn.inp('AES%d' % i) for i in xrange(16)]

    addrlist = [BitVecVal(x, 16) for x in [0xFF00, 0xFF01, 0xFF02, 0xFF04, 0xFF10, 0xFF20]]

    init_state = BitVecVal(0, 1)
    op_state = BitVecVal(1, 1)
    in_init_state = Equal(state, init_state)

    REG_STATE_ADDR = Choice('REG_STATE_ADDR', state, addrlist)
    REG_START_ADDR = Choice('REG_START_ADDR', state, addrlist)
    REG_ADDR_ADDR  = Choice('REG_ADDR_ADDR',  state, addrlist)
    REG_LEN_ADDR   = Choice('REG_LEN_ADDR',   state, addrlist)
    REG_CTR_ADDR   = Choice('REG_CTR_ADDR',   state, addrlist)
    REG_KEY_ADDR   = Choice('REG_KEY_ADDR',   state, addrlist)

    nop = Equal(op, BitVecVal(0, 2))
    rd = Equal(op, BitVecVal(1, 2))
    wr = And(in_init_state, Equal(op, BitVecVal(2, 2)))

    start_out = write1byteReg(wr, addr_in, BitVecVal(0,8), REG_START_ADDR, data_in)
    addr_out = write2byteReg(wr, addr_in, addr, REG_ADDR_ADDR, data_in)
    length_out = write2byteReg(wr, addr_in, length, REG_LEN_ADDR, data_in)
    ctr_out = write16byteReg(wr, addr_in, ctr, REG_CTR_ADDR, data_in)
    key_out = write16byteReg(wr, addr_in, key, REG_KEY_ADDR, data_in)


    start = And(wr, Equal(Extract(0, 0, start_out), BitVecVal(1, 1)))

    num_op_bytes_out = If(in_init_state, 
                            If(start, BitVecVal(0, 16), num_op_bytes),
                            Add(num_op_bytes, BitVecVal(16, 16)))
    more_blocks = ULT(num_op_bytes_out, length)
    block_ctr_out = If(in_init_state,
                        If(start, BitVecVal(0, 16), block_ctr),
                        If(more_blocks, Add(block_ctr, BitVecVal(16, 16)), block_ctr))
                  
    init_state_next = If(start, op_state, init_state)
    op_state_next = If(more_blocks, op_state, init_state)
    state_next = If(in_init_state, init_state_next, op_state_next)

    aes_args = getAESArgs(ctr, key, xram, addr, block_ctr)
    aes_xram = getUpdatedXram(xram, addr, block_ctr, aes_args, aesfns)
    xram_out = If(in_init_state, xram, aes_xram)

    syn.addOutput('addr', addr_out, Synthesizer.BITVEC)
    syn.addOutput('length', length_out, Synthesizer.BITVEC)
    syn.addOutput('ctr', ctr_out, Synthesizer.BITVEC)
    syn.addOutput('key', key_out, Synthesizer.BITVEC)
    syn.addOutput('num_op_bytes', num_op_bytes_out, Synthesizer.BITVEC)
    syn.addOutput('block_ctr', block_ctr_out, Synthesizer.BITVEC)
    syn.addOutput('state', state_next, Synthesizer.BITVEC)
    syn.addOutput('xram', xram_out, Synthesizer.MEM)

    cnsts = [
        Equal(state, BitVecVal(st, 1)),
        And(UGT(addr_in, BitVecVal(0xFF00-1, 16)), ULT(addr_in, BitVecVal(0xFF40, 16)))
    ]
    outputs = ['addr', 'length', 'ctr', 'key', 'num_op_bytes', 'block_ctr', 'state']
    # syn.debug()
    return syn.synthesize(['addr'], cnsts, evalAES)

for st in xrange(2):
    r = synAES(st)
    print 'state: %d\n=========\n' % st
    print '\n\n'.join(str(s) for s in r), '\n'















































#####
#####
#####
#####
#####
#####
#####
#####
#####
#####
#####
#####
#####
#####
#####
#####
#####
#####
#####
#####
#####
#####
#####
#####
