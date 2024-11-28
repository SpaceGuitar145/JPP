with Interfaces.C;
use Interfaces.C;

package Recursive is
    type ExtGCDResult is record
        GCD : Integer;
        X   : Integer;
        Y   : Integer;
    end record;

    function Factorial_Recursive (N : Integer) return Integer;
    pragma Import (C, Factorial_Recursive, "factorial_recursive");

    function GCD_Recursive (A, B : Integer) return Integer;
    pragma Import (C, GCD_Recursive, "gcd_recursive");  

    function Extended_GCD_Recursive(A, B : Integer) return ExtGCDResult;
    pragma Import (C, Extended_GCD_Recursive, "extended_gcd_recursive");

    function Solve_Diophantine_Recursive(A, B, C : Integer) return ExtGCDResult;
    pragma Import (C, Solve_Diophantine_Recursive, "solve_diophantine_recursive");
end Recursive;