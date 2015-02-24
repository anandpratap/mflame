	subroutine step(x, q, l2norm)
		use params_global
		implicit none
		real, dimension(nx), intent(in) :: x
		real, dimension(nx, nq), intent(inout) :: q
		real, intent(out) :: l2norm

		real, dimension(nx, nq) :: residual
		integer :: i, j, stage, nstage

		nstage = 4
	    ! initialize residual to zero
	    do stage = 1, nstage
	    	call compute_residual(x, q, residual)
	    	q(:,:) = residual(:,:)*dt/(nstage - stage + 1) + q(:,:)
	    end do
	    call compute_l2norm(nx, residual(:,1), l2norm)

	end subroutine step
	

	subroutine compute_residual(x, q, residual)
		use params_global
		implicit none
		real, dimension(nx), intent(in) :: x
		real, dimension(nx, nq), intent(inout) :: q
		real, dimension(nx, nq), intent(out) :: residual
		residual(:, :) = 0.0	    
		call boundary_conditions(x, q)
		call advection(x, q, residual)
		call diffusion(x, q, residual)
		call source(x, q, residual)
		
	end subroutine compute_residual

