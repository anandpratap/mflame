	subroutine compute_l2norm(n, s, l2norm)
		use, intrinsic :: ieee_arithmetic
		implicit none
		integer, intent(in) :: n
		real, dimension(n), intent(in) :: s
		real, intent(out) :: l2norm
		
		integer :: i
		
		l2norm = 0.0
		do i=1,n
			if (ieee_is_nan(s(i))) stop 'compute_l2norm: q is NaN'
			l2norm = l2norm + s(i)**2
		end do
		l2norm = sqrt(l2norm)/n
	end subroutine compute_l2norm
	