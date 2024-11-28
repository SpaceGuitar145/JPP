#ifndef ITERATIVE_MATH_H
#define ITERATIVE_MATH_H

#include <stdio.h>
#include "common.h"

unsigned long long factorial_iterative(int n);
int gcd_iterative(int a, int b);
ExtGCDResult extended_gcd_iterative(int a, int b);
ExtGCDResult solve_diophantine_iterative(int a, int b, int c);

unsigned long long factorial_iterative(int n) {
    unsigned long long result = 1;
    for (int i = 1; i <= n; i++) {
        result *= i;
    }
    return result;
}

int gcd_iterative(int a, int b) {
    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

ExtGCDResult extended_gcd_iterative(int a, int b) {
    int x0 = 1, y0 = 0, x1 = 0, y1 = 1;
    while (b != 0) {
        int q = a / b;
        int temp_a = a, temp_b = b;
        a = temp_b;
        b = temp_a % temp_b;
        int temp_x0 = x0, temp_x1 = x1;
        x0 = temp_x1;
        x1 = temp_x0 - q * temp_x1;
        int temp_y0 = y0, temp_y1 = y1;
        y0 = temp_y1;
        y1 = temp_y0 - q * temp_y1;
    }
    return (ExtGCDResult){a, x0, y0};
}

ExtGCDResult solve_diophantine_iterative(int a, int b, int c) {
    ExtGCDResult result = extended_gcd_iterative(a, b);
    if (c % result.gcd != 0) return (ExtGCDResult){0, 0, 0};
    result.x *= c / result.gcd;
    result.y *= c / result.gcd;
    return result;
}

#endif
