package Recursive is
    type ExtGCDResult is record
        GCD : Integer;
        X   : Integer;
        Y   : Integer;
    end record;

    function Factorial_Recursive(N : Natural) return Natural;
    function GCD_Recursive(A, B : Integer) return Integer;
    function Extended_GCD_Recursive(A, B : Integer) return ExtGCDResult;
    function Solve_Diophantine_Recursive(A, B, C : Integer) return ExtGCDResult;
end Recursive;
