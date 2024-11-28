with Interfaces.C; use Interfaces.C;

package Iterative is
    type ExtGCDResult is record
        GCD : Integer;  -- Using Interfaces.C.int for C compatibility
        X   : Integer;
        Y   : Integer;
    end record;

    function Factorial_Iterative (N : Integer) return Integer;
    pragma Import (C, Factorial_Iterative, "factorial_iterative");

    function GCD_Iterative (A, B : Integer) return Integer;
    pragma Import (C, GCD_Iterative, "gcd_iterative");

    function Extended_GCD_Iterative
       (A, B : in out Integer) return ExtGCDResult;
    pragma Import (C, Extended_GCD_Iterative, "extended_gcd_iterative");

    function Solve_Diophantine_Iterative
       (A, B, C : Integer) return ExtGCDResult;
    pragma Import
       (C, Solve_Diophantine_Iterative, "solve_diophantine_iterative");
end Iterative;
