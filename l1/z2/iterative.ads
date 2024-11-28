package Iterative is
    type ExtGCDResult is record
        GCD : Integer;
        X   : Integer;
        Y   : Integer;
    end record;

    function Factorial_Iterative (N : Natural) return Natural;
    function GCD_Iterative (A, B : Integer) return Integer;
    function Extended_GCD_Iterative
       (A, B : in out Integer) return ExtGCDResult;
    function Solve_Diophantine_Iterative
       (A, B, C : Integer) return ExtGCDResult;
end Iterative;
