	program mflame_ad
		use params_global
		implicit none

	    ! q(i,j) i is the spatial coordinate, j is the variable coordinate
	    real, dimension(:), allocatable :: x
	    real, dimension(:,:), allocatable :: q, qb, residual, residualb

	    ! local variable used in iterations
	    real :: l2norm
	    integer :: iteration = 0

	    ! read inputs and preprocessing stuff, does nothing at the moment, io.f90
	    call read_inputs()

	    ! allocate the array for solution and spatial coordinates
	    allocate(x(nx), q(nx, nq), qb(nx, nq), residual(nx, nq), residualb(nx, nq))

	    ! intialize solution and spatial array, setup.f90
	    call initialize(x, q)
	    call read_solution(q)
	    residualb(:,:) = 1.0
	    call compute_residual_bq(x, q, qb, residual, residualb)

	    ! write final solution
	    call write_outputs(x, qb)

	    ! deallocate arrays
	    deallocate(residualb, residual, qb, q, x)

	end program mflame_ad