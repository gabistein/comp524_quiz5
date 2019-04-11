PROGRAM matmult

	!! Declarations
	! Define 3 allocatable 2-dimensional integer arrays
	! and any temporary variables that you need
	integer, dimension(:,:), pointer,contiguous :: a1
	integer, dimension(:,:), pointer,contiguous :: a2
	integer, dimension(:,:), pointer,contiguous :: a3
	integer :: l,m,n
	integer :: i,j
	

	!! Create and initialize arrays
	! Prompt for 3 integers (call them L, M, and N)
	! They represent the dimensions of the arrays
	! The first array will be dimension L x M, the second will be M x N
	! and the product array, L x N
	PRINT*, "Enter array dimensions"
	READ(*,*)l,m,n
		
	! Allocate the 3 arrays of the correct size
	allocate(a1(l,m))
	allocate(a2(m,n))
	allocate(a3(l,n))
		
	
	!! Initialize arrays
	! Initialize the first array such that array(i,j) = 10i+j
	do i = 1, l
		do j = 1, m 
			a1(i,j) = (10 * i) + j
		end do 
	end do
	
	
	
	! Initialize the second array such that array(i,j) = 20i+2j
	do i = 1, m
		do j = 1, n
			a2(i,j) = (20 * i) + (2 * j)
		end do
	end do
	 

	! Multiply arrays
	! Matrix multiplication C = AB
	!        C(i,j) = the sum product of row i of A and column j of B     
	a3 = MATMUL(a1,a2)
	
	! Print the array row-by-row to STDOUT (terminal)
	! To print elements of an array in a row, you can define a loop as part of the WRITE
	! Assuming that vec is a one-dimensional array of length 5 and j is a declared variable,
	! the following will print that vector as a row
	! 		WRITE(*,*) (vec(j), j=1, 5)
	do i = 1, l
		WRITE(*,*)a3(i,:)
	end do
	
	! Deallocate arrays
	! If you allocate it, you need to deallocate it
	deallocate(a1)
	deallocate(a2)
	deallocate(a3)
	
END PROGRAM matmult
