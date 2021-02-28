cmake_minimum_required(VERSION 3.17.0)
project(touch_cuda LANGUAGES CXX CUDA VERSION  0.1.0)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CUDA_ARCHITECTURES 61)

enable_testing()

add_executable(touch_cuda "")
add_subdirectory(src)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
