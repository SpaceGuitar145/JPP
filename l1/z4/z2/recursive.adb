with Interfaces.C;
use Interfaces.C;

package body Recursive is

    function Factorial_Recursive(N : Interfaces.C.int) return Interfaces.C.int is
    begin
        if N = 0 then
            return 1;
        else
            return N * Factorial_Recursive(N - 1);
        end if;
    end Factorial_Recursive;

    function GCD_Recursive(A, B : Interfaces.C.int) return Interfaces.C.int is
    begin
        if B = 0 then
            return A;
        else
            return GCD_Recursive(B, A mod B);
        end if;
    end GCD_Recursive;

    function Extended_GCD_Recursive(A, B : Interfaces.C.int) return ExtGCDResult is
        Temp : ExtGCDResult;
    begin
        if B = 0 then
            return (GCD => A, X => 1, Y => 0);
        else
            Temp := Extended_GCD_Recursive(B, A mod B);
            return (GCD => Temp.GCD, X => Temp.Y, Y => Temp.X - (A / B) * Temp.Y);
        end if;
    end Extended_GCD_Recursive;

    function Solve_Diophantine_Recursive(A, B, C : Interfaces.C.int) return ExtGCDResult is
        Result : ExtGCDResult;
    begin
        Result := Extended_GCD_Recursive(A, B);
        if C mod Result.GCD /= 0 then
            return (GCD => 0, X => 0, Y => 0);
        else
            Result.X := Result.X * (C / Result.GCD);
            Result.Y := Result.Y * (C / Result.GCD);
            return Result;
        end if;
    end Solve_Diophantine_Recursive;

end Recursive;