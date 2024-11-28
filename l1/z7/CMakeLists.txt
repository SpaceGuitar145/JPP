cmake_minimum_required(VERSION 3.10)
project(z7)

set(CMAKE_C_STANDARD 99)

find_package(Python3 COMPONENTS Interpreter Development REQUIRED)

include_directories(${Python3_INCLUDE_DIRS})

add_executable(main main.c iterative.c recursive.c common.c)

target_link_libraries(main Python3::Python)
