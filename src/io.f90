	subroutine read_inputs()
		implicit none
		
	end subroutine read_inputs
	
	subroutine write_outputs(x, q)
		use params_global
		implicit none
		real, dimension(nx) :: x
		real, dimension(nx,nq) :: q
		
		integer :: i, j
		
		open(unit=log_data, file='data.dat', status='unknown', form='formatted')
		write(log_data, *) "TITLE = ""MFlame Solution FIle"""
		write(log_data, *) "VARIABLES = ""X"" ""T"" ""Y1"" ""Y2"" ""Y3"""
		write(log_data, *) "ZONE T=""Only Zone"", I = ", nx, ", F = Point"
		do i = 1, nx
			write(log_data, *) x(i), (q(i,j),j=1,nq)
		end do
		close(log_data)
		
	end subroutine write_outputs
	