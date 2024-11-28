cmake_minimum_required(VERSION 3.10)  

project(MyLibraries VERSION 1.0)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED True)

add_library(recursive SHARED recursive.c)
add_library(iterative SHARED iterative.c)