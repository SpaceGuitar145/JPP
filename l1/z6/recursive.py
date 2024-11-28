import ctypes

class ExtGCDResult(ctypes.Structure):
    _fields_ = [("gcd", ctypes.c_int), ("x", ctypes.c_int), ("y", ctypes.c_int)]

recursive = ctypes.CDLL('./z1/build/librecursive.so')

recursive.factorial_recursive.argtypes = [ctypes.c_int]
recursive.factorial_recursive.restype = ctypes.c_int

recursive.gcd_recursive.argtypes = [ctypes.c_int, ctypes.c_int]
recursive.gcd_recursive.restype = ctypes.c_int

recursive.solve_diophantine_recursive.argtypes = [ctypes.c_int, ctypes.c_int, ctypes.c_int]
recursive.solve_diophantine_recursive.restype = ExtGCDResult

factorial_recursive = recursive.factorial_recursive
gcd_recursive = recursive.gcd_recursive
solve_diophantine_recursive = recursive.solve_diophantine_recursive