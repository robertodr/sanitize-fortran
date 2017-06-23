Program dot_test
  Implicit None
  Real, Dimension( 1:100 ) :: a, b
  Real :: r
  a = 1.0
  b = 2.0
  !$omp parallel default( none ) shared( a, b, r )
  Call dot( a, b, r )
  Write( *, * ) r
  !$omp end parallel
Contains
  Subroutine dot( a, b, r )
    Real, Dimension( : ), Intent( In    ) :: a, b
    Real,                 Intent(   Out ) :: r
    Real, Save :: s
    Integer :: i
    !$omp single
    s = 0.0
    !$omp end single
    !$omp do reduction( +:s )
    Do i = 1, Size( a )
       s = s + a( i ) * b( i )
    End Do
    !$omp end do
    !$omp single
    r = s
    !$omp end single
  End Subroutine dot
End Program dot_test
