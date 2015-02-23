	program mflame
		use params_global
		implicit none

	    ! q(i,j) i is the spatial coordinate, j is the variable coordinate
	    real, dimension(:), allocatable :: x
	    real, dimension(:,:), allocatable :: q

	    ! local variable used in iterations
	    real :: l2norm
	    integer :: iteration = 0

	    ! read inputs and preprocessing stuff, does nothing at the moment, io.f90
	    call read_inputs()

	    ! allocate the array for solution and spatial coordinates
	    allocate(x(nx), q(nx, nq))

	    ! intialize solution and spatial array, setup.f90
	    call initialize(x, q)
	    if(iread) then
	    	call read_solution(q)
	    end if

	    ! open file for residual logging
	    open(unit=log_residual, file='residual.log', status='unknown', form='formatted', buffered='no')

	    ! enter solution loop
	    do

	        ! one step
	        call step(x, q, l2norm)

	        ! check for stopping criteria
	        if(iteration .ge. maximum_iteration .or. l2norm .le. absolute_tolerance) then 
	        	print *, 'exiting ', l2norm
	        	exit
	        end if

	        ! print to screen, save data and residual
	
	        if(mod(iteration, print_freq) .eq. 0) then
	        	call write_outputs(x, q)
	        	write(log_residual, *) iteration, l2norm
	        	print *, 'counter: ', iteration,' l2norm: ', l2norm
	        end if

	        iteration =  iteration + 1
	    end do

	    ! close residual log file
	    close(log_residual)

	    ! write final solution
	    call write_outputs(x, q)

	    ! deallocate arrays
	    deallocate(q, x)

	end program mflame