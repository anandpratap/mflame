	subroutine boundary_conditions(x, q)
		use params_global
		implicit none
		real, dimension(nx) :: x
		real, dimension(nx, nq) :: q


		integer :: j

	    ! left boundary, dirichlet
	    do j=1, nq
	    	q(1,j) = qinf(j)
	    end do

	    ! right boundary, neumann
	    do j=1, nq
	    	q(nx, j) = q(nx-1, j)
	    end do
	    
	end subroutine boundary_conditions
