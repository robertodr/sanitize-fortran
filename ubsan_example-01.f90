program ubsan_example_01
  type mytype
    integer :: x
    real :: y
  end type mytype

  type (mytype) :: a
  a%x = 1 ; a%y = 2.
  call assign(a)
  print *, a

contains

  subroutine assign(this)
    type (mytype), intent (out) :: this
    this%x = 2
  end subroutine

end program
