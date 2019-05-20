IDIR = ~/workSpace/myBuildDir/verilator/verilator-3.882/include/
CC = g++
CFLAGS = -I $(IDIR) -g -Wall

SRCS = rom_simulate.cpp Vsim8051_rom.cpp Vsim8051_rom__Syms.cpp $(IDIR)/verilated.cpp
SRCS = simulate.cpp Vsim8051_top.cpp Vsim8051_top__Syms.cpp $(IDIR)/verilated.cpp

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
