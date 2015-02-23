subroutine compute_l2norm(n, s, l2norm)
	implicit none
	integer :: n
	real, dimension(n) :: s
	real :: l2norm

	integer :: i

	l2norm = 0.0
	do i=1,n
	if (isnan(s(i))) stop 'compute_l2norm: q is a NaN'
	l2norm = l2norm + s(i)**2
	end do
	l2norm = sqrt(l2norm)/n
end subroutine compute_l2norm
