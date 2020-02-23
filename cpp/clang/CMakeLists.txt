cmake_minimum_required(VERSION 3.16)
project(ml-mandel-clang CXX)

set(CMAKE_CXX_STANDARD 17) # C++17
set(CMAKE_CXX_FLAGS "-O2 -Wall")

file(GLOB SOURCES ../src/*.cpp)

add_executable(
  ml-mandel-clang
  ${SOURCES}
)

target_link_libraries (
  ml-mandel-clang
)
