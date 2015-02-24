	subroutine initialize(x, q)
		use params_global
		implicit none
		real, dimension(nx), intent(out) :: x
		real, dimension(nx, nq), intent(out) :: q


		integer :: i, j
		real :: dx


		dx = length/(nx - 1)
	    ! initialize x
	    do i = 1, nx
	    	x(i) = (i-1)*dx
	    end do

	    ! initialize solution with freestream
	    do i = 1, nx
	    	do j=1, nq
	    		q(i,j) = qinf(j)
	    	end do
	    end do

	    ! forced combustion
	    do i = 1, nx
	    	if(x(i) .ge. 8e-3 .and. x(i) .le. 10e-3) then
	    		q(i,1) = 1000.0
	    	end if
	    end do

	end subroutine initialize


