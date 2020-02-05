CCFLAGS = -g -std=c++11

NTLINCDIR = -I../ntl-10.5.0-multithread/include
NTLLIB = ../ntl-10.5.0-multithread/src/ntl.a

FHEINCDIR = -I../HElib-multithread/src
FHELIB = ../HElib-multithread/src/fhe.a

LIPHEINCDIR = -I../liphe/include
LIPHELIBDIR = -L../liphe/src

LIBS = $(LIPHELIBDIR) -lliphe $(FHELIB) $(NTLLIB) -lgmp -lpthread
INCS = $(NTLINCDIR) $(FHEINCDIR) $(LIPHEINCDIR)

all: test_zp test_helib

#all: test min fast_min min2 min3

test_zp: test_zp.o
	g++ $(LDFLAGS) -o $@ $^ $(LIBS)

test_helib: test_helib.o
	g++ $(LDFLAGS) -o $@ $^ $(LIBS)


%.o: %.cc
	g++ $(CCFLAGS) -c  $(INCS) $<

clean:
	rm -f *.o test_zp test_helib

