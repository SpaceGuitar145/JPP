from dataclasses import dataclass

@dataclass
class ExtGCDResult:
    gcd: int
    x: int
    y: int

def factorial_iterative(n):
    result = 1
    for i in range(1, n + 1):
        result *= i
    return result

def gcd_iterative(a, b):
    while b != 0:
        a, b = b, a % b
    return a

def extended_gcd_iterative(a, b):
    x0, y0, x1, y1 = 1, 0, 0, 1
    while b != 0:
        q = a // b
        a, b = b, a % b
        x0, x1 = x1, x0 - q * x1
        y0, y1 = y1, y0 - q * y1
    return ExtGCDResult(gcd=a, x=x0, y=y0)

def solve_diophantine_iterative(a, b, c):
    result = extended_gcd_iterative(a, b)
    if c % result.gcd != 0:
        return "No solution"
    result.x *= c // result.gcd
    result.y *= c // result.gcd
    return ExtGCDResult(gcd=result.gcd, x=result.x, y=result.y)