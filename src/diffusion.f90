	subroutine diffusion(x, q, residual)
		use params_global
		implicit none
		real, dimension(nx), intent(in) :: x
		real, dimension(nx, nq), intent(in) :: q
		real, dimension(nx, nq), intent(inout) :: residual
	

		real :: dqdxl, dqdxr
		integer :: i, j 

		do i=nhalo+1, nx-nhalo
			do j=1, nq
				dqdxl = (q(i, j) - q(i-1, j))/(x(i) - x(i-1))
				dqdxr = (q(i+1, j) - q(i, j))/(x(i+1) - x(i))
				if(j.eq.1) then
					residual(i, j) = residual(i,j) + (dqdxr - dqdxr)/(x(i+1) - x(i-1))*alpha
				else
					residual(i, j) = residual(i,j) + (dqdxr - dqdxr)/(x(i+1) - x(i-1))*D
				end if
			end do
		end do

	end subroutine diffusion
