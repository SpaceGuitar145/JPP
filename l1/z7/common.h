#ifndef COMMON_H
#define COMMON_H

#include <Python.h>
#include <unistd.h>

typedef struct {
    int gcd;
    int x;
    int y;
} ExtGCDResult;

void init_python();
void finalize_python();
long call_python_function(char *module, char *function, PyObject *args);
ExtGCDResult call_python_function_diophantine(char *module, char *function, int a, int b, int c);

#endif
