	subroutine source(x, q, residual)
		use params_global
		implicit none
		real, dimension(nx) :: x
		real, dimension(nx, nq) :: q, residual
		
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
				wddot(j) = wdot(j)*0.029
			end do
			wdot(1) = 0.0
			do j=2, nq
				wdot(1) = wdot(1) + wddot(j)*q(i,1)
			end do
			
			do j=2, nq
				residual(i,j) = residual(i,j) +  wddot(j)
			end do
			
			residual(i,1) = residual(i,j) + wdot(1)
			
		end do
	end subroutine source
	