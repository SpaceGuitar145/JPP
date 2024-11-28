with Interfaces.C;
use Interfaces.C;

package body Iterative is
    function Factorial_Iterative (N : Interfaces.C.int) return Interfaces.C.int is
        Result : Interfaces.C.int := 1;
    begin
        for I in 1 .. N loop
            Result := Result * I;
        end loop;
        return Result;
    end Factorial_Iterative;

    function GCD_Iterative (A, B : Interfaces.C.int) return Interfaces.C.int is
        Local_A : Interfaces.C.int := A;
        Local_B : Interfaces.C.int := B;
        Temp    : Interfaces.C.int;
    begin
        while Local_B /= 0 loop
            Temp    := Local_B;
            Local_B := Local_A mod Local_B;
            Local_A := Temp;
        end loop;
        return Local_A;
    end GCD_Iterative;

    function Extended_GCD_Iterative (A, B : in out Interfaces.C.int) return ExtGCDResult
    is
        X0, Y0, X1, Y1                                        : Interfaces.C.int := 0;
        Q, Temp_A, Temp_B, Temp_X0, Temp_X1, Temp_Y0, Temp_Y1 : Interfaces.C.int;
    begin
        X0 := 1;
        Y0 := 0;
        X1 := 0;
        Y1 := 1;
        while B /= 0 loop
            Q       := A / B;
            Temp_A  := A;
            Temp_B  := B;
            A       := Temp_B;
            B       := Temp_A mod Temp_B;
            Temp_X0 := X0;
            Temp_X1 := X1;
            X0      := Temp_X1;
            X1      := Temp_X0 - Q * Temp_X1;
            Temp_Y0 := Y0;
            Temp_Y1 := Y1;
            Y0      := Temp_Y1;
            Y1      := Temp_Y0 - Q * Temp_Y1;
        end loop;
        return (GCD => A, X => X0, Y => Y0);
    end Extended_GCD_Iterative;

    function Solve_Diophantine_Iterative
       (A, B, C : Interfaces.C.int) return ExtGCDResult
    is
        Local_A, Local_B : Interfaces.C.int;
        Result           : ExtGCDResult;
    begin
        Local_A := A;
        Local_B := B;
        Result  := Extended_GCD_Iterative (Local_A, Local_B);
        if C mod Result.GCD /= 0 then
            return (GCD => 0, X => 0, Y => 0);
        end if;
        Result.X := Result.X * (C / Result.GCD);
        Result.Y := Result.Y * (C / Result.GCD);
        return Result;
    end Solve_Diophantine_Iterative;
end Iterative;
