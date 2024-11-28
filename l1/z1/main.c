#include "iterative.c"
#include "recursive.c"
#include <stdio.h>

int main() {
    int a = 1180, b = 482, c = 2; 
    int n = 10;

    unsigned long long factorial_iter = factorial_iterative(n);
    int gcd_iter = gcd_iterative(a, b);
    ExtGCDResult diophantine_iter = solve_diophantine_iterative(a, b, c);

    unsigned long long factorial_rec = factorial_recursive(n);
    int gcd_rec = gcd_recursive(a, b);
    ExtGCDResult diophantine_rec = solve_diophantine_recursive(a, b, c);

    printf("Iterative results:\n");
    printf("Factorial of %d (iterative): %llu\n", n, factorial_iter);
    printf("GCD of %d and %d (iterative): %d\n", a, b, gcd_iter);
    if (diophantine_iter.gcd != 0) {
        printf("Diophantine solution (iterative) for %dx + %dy = %d: x = %d, y = %d\n", a, b, c, diophantine_iter.x, diophantine_iter.y);
    } else {
        printf("No solution (iterative)\n");
    }

    printf("Recursive results:\n");
    printf("Factorial of %d (recursive): %llu\n", n, factorial_rec);
    printf("GCD of %d and %d (recursive): %d\n", a, b, gcd_rec);
    if (diophantine_rec.gcd != 0) {
        printf("Diophantine solution (recursive) for %dx + %dy = %d: x = %d, y = %d\n", a, b, c, diophantine_rec.x, diophantine_rec.y);
    } else {
        printf("No solution (recursive)\n");
    }

    return 0;
}
