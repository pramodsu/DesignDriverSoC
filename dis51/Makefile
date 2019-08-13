CC=gcc
CFLAGS=-c -I. -Wall
LDFLAGS=
SHAREDLDFLAGS=-lhexfile

OBJECTS=main.o pass1.o pass2.o global.o
HFOBJ=hexfile.o

default: dis51

dis51: $(OBJECTS) $(HFOBJ)
	$(CC) $(LDFLAGS) $(OBJECTS) $(HFOBJ) -o dis51

main.o: pass1.h main.c
	$(CC) $(CFLAGS) main.c -o main.o

pass1.o: pass1.c distypes.h global.h
	$(CC) $(CFLAGS) pass1.c -o pass1.o

pass2.o: pass2.c distypes.h global.h
	$(CC) $(CFLAGS) pass2.c -o pass2.o

global.o: global.c distypes.h
	$(CC) $(CFLAGS) global.c -o global.o

hexfile.o: hexfile.c
	$(CC) $(CFLAGS) hexfile.c -o hexfile.o

# use "make shared" if you have libhexfile installed as a shared library
shared: $(OBJECTS)
	$(CC) $(SHAREDLDFLAGS) $(OBJECTS) -o dis51

clean:
	rm -f *.o dis51 core
