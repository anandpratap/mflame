	subroutine advection(x, q, residual)
		use params_global
		implicit none
		real, dimension(nx) :: x
		real, dimension(nx, nq) :: q, residual
		
		integer :: i, j
		
		do i=nhalo+1, nx-nhalo
			do j=1, nq
				residual(i,j) = residual(i,j) - mdot*(q(i,j) - q(i-1,j))/(x(i) - x(i-1))
			end do
		end do
		
		
	end subroutine advection
