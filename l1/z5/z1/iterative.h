#ifndef ITERATIVE_H
#define ITERATIVE_H

#include "common.h"

#ifdef __cplusplus
extern "C" {
#endif

int factorial_iterative(int N);
int gcd_iterative(int A, int B);
ExtGCDResult extended_gcd_iterative(int A, int B);
ExtGCDResult solve_diophantine_iterative(int A, int B, int C);

#ifdef __cplusplus
}
#endif

#endif
