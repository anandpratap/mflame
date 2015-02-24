 UNAME_S := $(shell uname -s)
 ifeq ($(UNAME_S),Linux)
 FC = ifort
 FCFLAGS = -r8 -debug
 endif
 ifeq ($(UNAME_S),Darwin)
 FC = /Users/maverick/local/gcc/bin/gfortran
 FCFLAGS = -fdefault-real-8 --std=f95 -Wuninitialized -O -ffree-form
 endif


OBJECTS = modules.o main.o io.o setup.o step.o advection.o diffusion.o source.o boundary_conditions.o utils.o
BIN = bin/
SRC = src/

mflame:$(OBJECTS)
	$(FC) -o mflame $(OBJECTS)
	mv mflame bin/.
	cp bin/mflame examples/basic/.

%.o:$(SRC)%.f90
	$(FC) $(FCFLAGS) -c $<

clean:
	rm *.o bin/mflame *.mod