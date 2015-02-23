subroutine step(x, q, l2norm)
	use params_global
	implicit none
	real, dimension(nx) :: x
	real, dimension(nx, nq) :: q
	real :: l2norm

	real, dimension(nx, nq) :: residual
	integer :: i, j
	
	! initialize residual to zero
	residual(:, :) = 0.0

	call compute_residual(x, q, residual)
	call compute_l2norm(nx, residual(:,1), l2norm)
	
	! update solution
	q(:,:) = residual(:,:)*dt + q(:,:)
	
end subroutine step


subroutine compute_residual(x, q, residual)
	use params_global
	implicit none
	real, dimension(nx) :: x
	real, dimension(nx, nq) :: q, residual
	
	call boundary_conditions(x, q)
	call advection(x, q, residual)
	call diffusion(x, q, residual)
	call source(x, q, residual)

end subroutine compute_residual

