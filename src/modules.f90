	module params_global
		implicit none
		real :: absolute_tolerance, relative_tolerance
		real :: dt
		integer :: maximum_iteration

		data absolute_tolerance, relative_tolerance/1e-6, 1e-6/
		data dt/1e-6/
		data maximum_iteration/1000000000/

		integer :: nx, nq
		data nx, nq/100, 4/

		integer :: print_freq
		data print_freq/10000/


		integer :: log_data, log_residual
		data log_data, log_residual/10, 11/


		real :: mdot, alpha, d
		data mdot, alpha, d/0.2476, 1.5e-5, 1.5e-5/

		real :: arh_a, arh_ta
		data arh_a, arh_ta/1.2e9, 14000.0/

		real :: length
		data length/30e-3/

	    ! ideally this should be variable sized
	    real :: qinf(4)
	    data qinf/300.0, 0.2, 0.2, 0.0/

	    integer :: nhalo
	    data nhalo/1/

	    integer :: iread
	    data iread/0/

	end module params_global