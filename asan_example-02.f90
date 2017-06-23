program asan_example_02
  integer, pointer :: x1, x2, x3
  allocate(x1)
  x2=>x1
  deallocate(x1)
  x2=0
end program
