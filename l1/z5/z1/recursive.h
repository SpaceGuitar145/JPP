#ifndef RECURSIVE_H
#define RECURSIVE_H

#include "common.h"

#ifdef __cplusplus
extern "C" {
#endif

int factorial_recursive(int N);
int gcd_recursive(int A, int B);
ExtGCDResult extended_gcd_recursive(int A, int B);
ExtGCDResult solve_diophantine_recursive(int A, int B, int C);

#ifdef __cplusplus
}
#endif

#endif