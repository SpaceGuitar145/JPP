#include <stdio.h>
#include "common.h"

unsigned long long factorial_recursive(int n);
int gcd_recursive(int a, int b);
ExtGCDResult extended_gcd_recursive(int a, int b);
ExtGCDResult solve_diophantine_recursive(int a, int b, int c);

unsigned long long factorial_recursive(int n) {
    if (n == 0) {
        return 1;
    } else {
        return n * factorial_recursive(n - 1);
    }
}

int gcd_recursive(int a, int b) {
    if (b == 0) {
        return a;
    } else {
        return gcd_recursive(b, a % b);
    }
}

ExtGCDResult extended_gcd_recursive(int a, int b) {
    if (b == 0) {
        return (ExtGCDResult){a, 1, 0};
    } else {
        ExtGCDResult temp = extended_gcd_recursive(b, a % b);
        return (ExtGCDResult){temp.gcd, temp.y, temp.x - (a / b) * temp.y};
    }
}

ExtGCDResult solve_diophantine_recursive(int a, int b, int c) {
    ExtGCDResult result = extended_gcd_recursive(a, b);
    if (c % result.gcd != 0) return (ExtGCDResult){0, 0, 0};
    result.x *= c / result.gcd;
    result.y *= c / result.gcd;
    return result;
}