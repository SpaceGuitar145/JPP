#include <stdlib.h>
#include "recursive.h"

long factorial_recursive(int n) {
    PyObject *args = PyTuple_Pack(1, PyLong_FromLong(n));
    return call_python_function("recursive", "factorial_recursive", args);
}

long gcd_recursive(int a, int b) {
    PyObject *args = PyTuple_Pack(2, PyLong_FromLong(a), PyLong_FromLong(b));
    return call_python_function("recursive", "gcd_recursive", args);
}

ExtGCDResult solve_diophantine_recursive(int a, int b, int c) {
    return call_python_function_diophantine("recursive", "solve_diophantine_recursive", a, b, c);
}