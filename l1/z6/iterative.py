import ctypes

class ExtGCDResult(ctypes.Structure):
    _fields_ = [("gcd", ctypes.c_int), ("x", ctypes.c_int), ("y", ctypes.c_int)]

iterative = ctypes.CDLL('./z1/build/libiterative.so')

iterative.factorial_iterative.argtypes = [ctypes.c_int]
iterative.factorial_iterative.restype = ctypes.c_int

iterative.gcd_iterative.argtypes = [ctypes.c_int, ctypes.c_int]
iterative.gcd_iterative.restype = ctypes.c_int

iterative.solve_diophantine_iterative.argtypes = [ctypes.c_int, ctypes.c_int, ctypes.c_int]
iterative.solve_diophantine_iterative.restype = ExtGCDResult

factorial_iterative = iterative.factorial_iterative
gcd_iterative = iterative.gcd_iterative
solve_diophantine_iterative = iterative.solve_diophantine_iterative