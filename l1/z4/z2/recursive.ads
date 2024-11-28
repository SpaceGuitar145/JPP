with Interfaces.C;
use Interfaces.C;

package Recursive is
    type ExtGCDResult is record
        GCD : Interfaces.C.int;
        X   : Interfaces.C.int;
        Y   : Interfaces.C.int;
    end record;

    function Factorial_Recursive (N : int) return int;
    pragma Export (C, Factorial_Recursive, "factorial_recursive");

    function GCD_Recursive (A, B : int) return int;
    pragma Export (C, GCD_Recursive, "gcd_recursive");  

    function Extended_GCD_Recursive(A, B : Interfaces.C.int) return ExtGCDResult;
    pragma Export (C, Extended_GCD_Recursive, "extended_gcd_recursive");

    function Solve_Diophantine_Recursive(A, B, C : Interfaces.C.int) return ExtGCDResult;
    pragma Export (C, Solve_Diophantine_Recursive, "solve_diophantine_recursive");
end Recursive;