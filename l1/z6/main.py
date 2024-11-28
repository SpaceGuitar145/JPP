from iterative import *
from recursive import *

def main():
    n = 10
    a, b, c = 1180, 482, 2

    print("Iterative results:")
    print("Factorial of {} (iterative): {}".format(n, factorial_iterative(n)))
    print("GCD of {} and {} (iterative): {}".format(a, b, gcd_iterative(a, b)))
    diophantine_iterative = solve_diophantine_iterative(a, b, c)
    print("Diophantine soultion (iterative) for {}x + {}y = {}:".format(a, b, c) + " x = {}, y = {}".format(diophantine_iterative.x, diophantine_iterative.y))

    print("Recursive results:")
    print("Factorial of {} (recursive): {}".format(n, factorial_recursive(n)))
    print("GCD of {} and {} (recursive): {}".format(a, b, gcd_recursive(a, b)))
    diophantine_recursive = solve_diophantine_recursive(a, b, c)
    print("Diophantine soultion (recursive) for {}x + {}y = {}:".format(a, b, c) + " x = {}, y = {}".format(diophantine_recursive.x, diophantine_recursive.y))

if __name__ == "__main__":
    main()

# gcc -shared -fPIC -o recursive.so recursive.c
# gcc -shared -fPIC -o iterative.so iterative.c
