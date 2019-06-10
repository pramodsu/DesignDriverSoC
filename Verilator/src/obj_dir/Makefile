IDIR = /usr/share/verilator/include
CC = g++
CFLAGS = -I $(IDIR) -g -Wall -I obj_dir

# SRCS = rom_simulate.cpp Vsim8051_rom.cpp Vsim8051_rom__Syms.cpp $(IDIR)/verilated.cpp
SRCS =  Voc8051_tb_S.cpp  Voc8051_tb.cpp Voc8051_tb__Syms.cpp $(IDIR)/verilated.cpp

OBJS = $(SRCS:.cpp=.o)
EXE = rom
EXE = 8051sim

all: $(SRCS) $(EXE)

$(EXE): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	@rm *.o
