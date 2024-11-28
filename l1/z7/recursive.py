from dataclasses import dataclass

@dataclass
class ExtGCDResult:
    gcd: int
    x: int
    y: int

def factorial_recursive(n):
    if n == 0:
        return 1
    else:
        return n * factorial_recursive(n-1)

def gcd_recursive(a, b):
    if b == 0:
        return a
    else:
        return gcd_recursive(b, a % b)

def extended_gcd_recursive(a, b):
    if b == 0:
        return ExtGCDResult(gcd=a, x=1, y=0)
    else:
        temp = extended_gcd_recursive(b, a % b)
        return ExtGCDResult(gcd=temp.gcd, x=temp.y, y=temp.x - (a // b) * temp.y)

def solve_diophantine_recursive(a, b, c):
    result = extended_gcd_recursive(a, b)
    if c % result.gcd != 0:
        return "No solution"
    result.x *= c // result.gcd
    result.y *= c // result.gcd
    return ExtGCDResult(gcd=result.gcd, x=result.x, y=result.y)