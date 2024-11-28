with Interfaces.C;
use Interfaces.C;

package Iterative is
    type ExtGCDResult is record
        GCD : int;  -- Using Interfaces.C.int for C compatibility
        X   : int;
        Y   : int;
    end record;

    function Factorial_Iterative (N : int) return int;
    pragma Export (C, Factorial_Iterative, "factorial_iterative");

    function GCD_Iterative (A, B : int) return int;
    pragma Export (C, GCD_Iterative, "gcd_iterative");

    function Extended_GCD_Iterative (A, B : in out int) return ExtGCDResult;
    pragma Export (C, Extended_GCD_Iterative, "extended_gcd_iterative");

    function Solve_Diophantine_Iterative (A, B, C : int) return ExtGCDResult;
    pragma Export (C, Solve_Diophantine_Iterative, "solve_diophantine_iterative");
end Iterative;