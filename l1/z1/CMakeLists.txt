cmake_minimum_required(VERSION 3.10)
project(z1)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED True)

include_directories(${PROJECT_SOURCE_DIR})

add_executable(main main.c)