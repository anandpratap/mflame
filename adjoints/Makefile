TPN             = /home/anandps/local/tapenade3.6/bin/tapenade
TPNFLAGS        = -r8 -backward -html -difffuncname "_bq"

all:
	$(TPN) $(TPNFLAGS) \
	../src/modules.f90 ../src/step.f90 ../src/advection.f90 ../src/diffusion.f90 \
	../src/source.f90 ../src/boundary_conditions.f90 \
	-vars "q residual" -head "compute_residual"
	@bash cleanup.bash

clean:
	rm *_bq*