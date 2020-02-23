cmake_minimum_required(VERSION 3.16)

set(CMAKE_CXX_COMPILER g++-9)
set(CMAKE_C_COMPILER gcc-9)
set(CMAKE_CXX_STANDARD 17) # C++17
set(CMAKE_CXX_FLAGS "-O2 -Wall")

project(ml-mandel-gcc CXX)

file(GLOB SOURCES ../src/*.cpp)

add_executable(
  ml-mandel-gcc
  ${SOURCES}
)

target_link_libraries (
  ml-mandel-gcc
)
