cmake_minimum_required(VERSION 3.10)
project(z4) 

set(CMAKE_C_STANDARD 99)

set(OBJECT_DIR "${CMAKE_SOURCE_DIR}/z2")

set(ITERATIVE_OBJECT "${OBJECT_DIR}/build/iterative.o")
set(RECURSIVE_OBJECT "${OBJECT_DIR}/build/recursive.o")

if(NOT EXISTS "${ITERATIVE_OBJECT}")
    message(FATAL_ERROR "iterative.o not found in ${ITERATIVE_OBJECT}")
endif()

if(NOT EXISTS "${RECURSIVE_OBJECT}")
    message(FATAL_ERROR "recursive.o not found in ${RECURSIVE_OBJECT}")
endif()

add_executable(main main.c "${ITERATIVE_OBJECT}" "${RECURSIVE_OBJECT}")

target_link_libraries(main gnat)
