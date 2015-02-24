	subroutine source(x, q, residual)
		use params_global
		implicit none
		real, dimension(nx), intent(in) :: x
		real, dimension(nx, nq), intent(in) :: q
		real, dimension(nx, nq), intent(inout) :: residual
		
		integer :: i, j
		real :: kf, qi
		real, dimension(nq) :: wdot
		real, dimension(nq) :: wddot
		
		do i=nhalo+1, nx-nhalo
			kf = arh_a*q(i,1)*exp(-arh_ta/q(i,1))
			qi = kf*q(i,2)*q(i,3)
			
			wdot(2) = -qi
			wdot(3) = -qi
			wdot(4) = qi
			do j=2,nq
				wddot(j) = wdot(j)*mw
			end do
			
			wdot(1) = qi*hk/cp
						
			do j=2, nq
				residual(i,j) = residual(i,j) +  wddot(j)
			end do
			
			residual(i,1) = residual(i,1) + wdot(1)
			
		end do
	end subroutine source
	
