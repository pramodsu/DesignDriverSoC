import sys
import subprocess
import tempfile
from collections import namedtuple

xm_state = namedtuple('xm_state', [
    'op', 'addrin', 'datain',
    'aes_state', 'aes_addr', 'aes_length', 'aes_num_op_bytes', 'aes_block_ctr', 'aes_ctr', 'aes_key', 
    'sha_state', 'sha_rdaddr', 'sha_wraddr', 'sha_len', 'sha_bytes_read', 'sha_block_ctr',
    'xram'
])
    
def dump_aes_state(fileobject, s):
    hexstr = lambda x: hex(x)[2:]

    t = [hexstr(x) for x in [s.op, s.addrin, s.datain]]
    print >> fileobject, ' '.join(t)

    t = [hexstr(x) for x in [s.aes_state, s.aes_addr, s.aes_length, s.aes_num_op_bytes, s.aes_block_ctr]]
    print >> fileobject, ' '.join(t)

    t = [hexstr(x) for x in s.aes_ctr]
    print >> fileobject, ' '.join(t)

    t = [hexstr(x) for x in s.aes_key]
    print >> fileobject, ' '.join(t)

    t = [hexstr(x) for x in [s.sha_state, s.sha_rdaddr, s.sha_wraddr, s.sha_len, s.sha_bytes_read, s.sha_block_ctr]]
    print >> fileobject, ' '.join(t)

    xram = s.xram
    print >> fileobject, hexstr(len(xram[:-1])), hexstr(xram[-1])
    for [a,d] in xram[:-1]:
        print >> fileobject, hexstr(a), hexstr(d), 

    fileobject.flush()

def eval_xm(s_in):
    with tempfile.NamedTemporaryFile() as fileobject:
        dump_aes_state(fileobject, s_in)

        #print subprocess.check_output(['cat', fileobject.name])
        state = subprocess.check_output(['./simulate', fileobject.name])
        #print 'output:', state

        hex_int = lambda x: int(x, 16)
        words = state.split()

        data_out = hex_int(words[0])

        aes_state = hex_int(words[1])
        aes_addr = hex_int(words[2])
        aes_length = hex_int(words[3])
        aes_num_op_bytes = hex_int(words[4])
        aes_block_ctr = hex_int(words[5])
        aes_ctr = [hex_int(x) for x in words[6:6+16]]
        aes_key = [hex_int(x) for x in words[6+16:6+32]]

        sha_state = hex_int(words[38])
        sha_rdaddr = hex_int(words[39])
        sha_wraddr = hex_int(words[40])
        sha_len = hex_int(words[41])
        sha_bytes_read = hex_int(words[42])
        sha_block_ctr = hex_int(words[43])

        sz = hex_int(words[44])
        defval = hex_int(words[45])

        mem = []
        assert len(words) == 46 + 2*sz
        for i in xrange(46, 46+2*sz, 2):
            a = hex_int(words[i])
            d = hex_int(words[i+1])
            mem.append([a, d])
        mem.append(defval)
        xram = mem

        s_out = xm_state(
            op=0, addrin=0, datain=0,
            aes_state=aes_state, aes_addr=aes_addr, aes_length=aes_length, 
            aes_num_op_bytes=aes_num_op_bytes, aes_block_ctr=aes_block_ctr,
            aes_ctr=aes_ctr, aes_key=aes_key,
            sha_state=sha_state, sha_rdaddr=sha_rdaddr, sha_wraddr=sha_wraddr, 
            sha_len=sha_len, sha_bytes_read=sha_bytes_read, sha_block_ctr=sha_block_ctr,
            xram=xram)

        return data_out, s_out
    return None, None

XM_NOP = 0
XM_RD  = 1
XM_WR  = 2

def test_eval():
    # aes
    aes_state = 0
    aes_addr = 0x1000
    aes_length = 0x10
    aes_num_op_bytes = 0
    aes_block_ctr = 0
    aes_ctr = [0]*16
    aes_key = [(i) for i in xrange(16)]

    # sha
    sha_state = 0
    sha_rdaddr = 0
    sha_wraddr = 0
    sha_len = 0
    sha_bytes_read = 0
    sha_block_ctr = 0

    # xram
    xram = [[0x1000+i,i+1] for i in xrange(16)] + [0x0]

    # op
    op = XM_WR
    addr_in = 0xFF00
    data_in = 1

    # state
    s_in = xm_state(
        op=op, addrin=addr_in, datain=data_in,
        aes_state=aes_state, aes_addr=aes_addr, aes_length=aes_length, 
        aes_num_op_bytes=aes_num_op_bytes, aes_block_ctr=aes_block_ctr,
        aes_ctr=aes_ctr, aes_key=aes_key,
        sha_state=sha_state, sha_rdaddr=sha_rdaddr, sha_wraddr=sha_wraddr, 
        sha_len=sha_len, sha_bytes_read=sha_bytes_read, sha_block_ctr=sha_block_ctr,
        xram=xram)

    data_out, s_out = eval_xm(s_in)
    while True:
        s_in = s_out._replace(op=0)
        data_out, s_out = eval_xm(s_in)
        print
        print s_out
        if s_out.aes_state == 0:
            break
    print s_out.xram

    s_in = s_out._replace(op=2, addrin=0xFF00, datain=1)
    data_out, s_out = eval_xm(s_in)
    while True:
        s_in = s_out._replace(op=0)
        data_out, s_out = eval_xm(s_in)
        if s_out.aes_state == 0:
            break
    print s_out.xram



if __name__ == '__main__':
    test_eval()
