	subroutine read_inputs()
		use params_global
		implicit none
		read(5, inputs)
		write(*, inputs)
	end subroutine read_inputs

	subroutine write_outputs(x, q)
		use params_global
		implicit none
		real, dimension(nx), intent(in) :: x
		real, dimension(nx,nq), intent(in) :: q

		integer :: i, j

		open(unit=log_data, file='data.dat', status='unknown', form='formatted')
		write(log_data, *) "TITLE = ""MFlame Solution FIle"""
		write(log_data, *) "VARIABLES = ""X"" ""T"" ""Y1"" ""Y2"" ""Y3"""
		write(log_data, *) "ZONE T=""Only Zone"", I = ", nx, ", F = Point"
		do i = 1, nx
			write(log_data, *) x(i), (q(i,j),j=1,nq)
		end do
		close(log_data)

		open(unit=log_data, file="data.g", status='unknown', form='unformatted')
		write(log_data) nx, nq
		write(log_data) ((q(i,j), i=1,nx), j=1,nq)
		close(log_data)

	end subroutine write_outputs

	subroutine read_solution(q)
		use params_global
		implicit none
		real, dimension(nx,nq), intent(out) :: q

		integer :: i, j

		open(unit=log_data, file="data.g", status='unknown', form='unformatted')
		read(log_data) nx, nq
		read(log_data) ((q(i,j), i=1,nx), j=1,nq)
		close(log_data)

	end subroutine read_solution