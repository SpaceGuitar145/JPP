#include "common.h"

__attribute__((constructor))
void init_python() {
    Py_Initialize();

    char cwd[1024];
    if (getcwd(cwd, sizeof(cwd)) == NULL) {
        perror("getcwd() error");
        return;
    }

    PyObject* sysPath = PySys_GetObject("path");
    PyObject* path = PyUnicode_FromString(cwd);
    PyList_Append(sysPath, path);
    Py_DECREF(path);
}


__attribute__((destructor))
void finalize_python() {
    Py_Finalize();
}

long call_python_function(char *module, char *function, PyObject *args) {
    PyObject *pName, *pModule, *pFunc, *pValue;
    long result = -1;

    pName = PyUnicode_FromString(module);
    pModule = PyImport_Import(pName);
    Py_DECREF(pName);

    if (pModule != NULL) {
        pFunc = PyObject_GetAttrString(pModule, function);
        if (pFunc && PyCallable_Check(pFunc)) {
            pValue = PyObject_CallObject(pFunc, args);
            Py_DECREF(args);

            if (pValue != NULL) {
                result = PyLong_AsLong(pValue);
                Py_DECREF(pValue);
            } else {
                PyErr_Print();
            }
        } else {
            PyErr_Print();
        }
        Py_XDECREF(pFunc);
        Py_DECREF(pModule);
    } else {
        PyErr_Print();
    }
    return result;
}

ExtGCDResult call_python_function_diophantine(char *module, char *function, int a, int b, int c) {
    PyObject *pName, *pModule, *pFunc, *pArgs, *pValue;
    ExtGCDResult result = {0, 0, 0};

    pName = PyUnicode_FromString(module);
    pModule = PyImport_Import(pName);
    Py_DECREF(pName);

    if (pModule != NULL) {
        pFunc = PyObject_GetAttrString(pModule, function);
        if (pFunc && PyCallable_Check(pFunc)) {
            pArgs = PyTuple_Pack(3, PyLong_FromLong(a), PyLong_FromLong(b), PyLong_FromLong(c));
            pValue = PyObject_CallObject(pFunc, pArgs);
            Py_DECREF(pArgs);

            if (pValue != NULL && PyObject_HasAttrString(pValue, "gcd")) {
                PyObject *pGCD = PyObject_GetAttrString(pValue, "gcd");
                PyObject *pX = PyObject_GetAttrString(pValue, "x");
                PyObject *pY = PyObject_GetAttrString(pValue, "y");
                if (pGCD && pX && pY) {
                    result.gcd = PyLong_AsLong(pGCD);
                    result.x = PyLong_AsLong(pX);
                    result.y = PyLong_AsLong(pY);
                }
                Py_DECREF(pGCD);
                Py_DECREF(pX);
                Py_DECREF(pY);
            } else {
                PyErr_Print();
            }
            Py_DECREF(pValue);
        } else {
            PyErr_Print();
        }
        Py_DECREF(pFunc);
        Py_DECREF(pModule);
    } else {
        PyErr_Print();
    }

    return result;
}