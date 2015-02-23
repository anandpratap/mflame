FC = ifort
FCFLAGS = -r8 -debug
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