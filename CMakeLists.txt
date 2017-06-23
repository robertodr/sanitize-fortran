# set minimum cmake version
cmake_minimum_required(VERSION 3.0 FATAL_ERROR)

# project name
project(sanitize-fortran Fortran)

# do not rebuild if rules (compiler flags) change
set(CMAKE_SKIP_RULE_DEPENDENCY TRUE)

# if CMAKE_BUILD_TYPE undefined, we set it to Debug
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Debug")
endif()

# directories which hold included cmake modules
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/cmake/custom)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/cmake/downloaded)

include(autocmake_default_build_paths)

add_executable(asan_example-01 asan_example-01.f90)
set_target_properties(asan_example-01
  PROPERTIES POSITION_INDEPENDENT_CODE 1
             COMPILE_OPTIONS "-fsanitize=address"
             LINK_FLAGS "-fsanitize=address"
  )

add_executable(asan_example-02 asan_example-02.f90)
set_target_properties(asan_example-02
  PROPERTIES POSITION_INDEPENDENT_CODE 1
             COMPILE_OPTIONS "-fsanitize=address"
             LINK_FLAGS "-fsanitize=address"
  )

add_executable(tsan_example-01 tsan_example-01.f90)
set_target_properties(tsan_example-01
  PROPERTIES POSITION_INDEPENDENT_CODE 1
             COMPILE_OPTIONS "-fsanitize=thread;-fopenmp"
             LINK_FLAGS "-fopenmp"
             LINK_LIBRARIES "-ltsan"
  )
