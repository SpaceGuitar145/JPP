#include <stdlib.h>
#include "iterative.h"

long factorial_iterative(int n) {
    PyObject *args = PyTuple_Pack(1, PyLong_FromLong(n));
    return call_python_function("iterative", "factorial_iterative", args);
}

long gcd_iterative(int a, int b) {
    PyObject *args = PyTuple_Pack(2, PyLong_FromLong(a), PyLong_FromLong(b));
    return call_python_function("iterative", "gcd_iterative", args);
}

ExtGCDResult solve_diophantine_iterative(int a, int b, int c) {
    return call_python_function_diophantine("iterative", "solve_diophantine_iterative", a, b, c);
}