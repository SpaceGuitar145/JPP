with Iterative;           use Iterative;
with Recursive;           use Recursive;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is
   subtype Iterative_ExtGCDResult is Iterative.ExtGCDResult;
   subtype Recursive_ExtGCDResult is Recursive.ExtGCDResult;
   Factorial_Result_Iterative   : Natural;
   Factorial_Result_Recursive   : Natural;
   GCD_Result_Iterative         : Integer;
   GCD_Result_Recursive         : Integer;
   Diophantine_Result_Iterative : Iterative_ExtGCDResult;
   Diophantine_Result_Recursive : Recursive_ExtGCDResult;

   A, B, C, N : Integer;
begin
   Ada.Text_IO.Put_Line ("Iterative results:");

   N := 10;
   A := 1_180;
   B := 482;
   C := 2;

   Factorial_Result_Iterative   := Factorial_Iterative (N);
   GCD_Result_Iterative         := GCD_Iterative (A, B);
   Diophantine_Result_Iterative := Solve_Diophantine_Iterative (A, B, C);

   Ada.Text_IO.Put_Line
     ("Factorial of" & Natural'Image (N) & " (iterative):" &
      Natural'Image (Factorial_Result_Iterative));
   Ada.Text_IO.Put_Line
     ("GCD of" & Integer'Image (A) & " and" & Integer'Image (B) &
      " (iterative):" & Integer'Image (GCD_Result_Iterative));
   Ada.Text_IO.Put_Line
     ("Diophantine solution (iterative) for" & Integer'Image (A) & "x +" &
      Integer'Image (B) & "y =" &
      Integer'Image (Diophantine_Result_Iterative.GCD) & ", x = " &
      Integer'Image (Diophantine_Result_Iterative.X) & ", y =" &
      Integer'Image (Diophantine_Result_Iterative.Y));

   Ada.Text_IO.Put_Line ("Recursive results:");

   Factorial_Result_Recursive   := Factorial_Recursive (N);
   GCD_Result_Recursive         := GCD_Recursive (A, B);
   Diophantine_Result_Recursive := Solve_Diophantine_Recursive (A, B, C);

   Ada.Text_IO.Put_Line
     ("Factorial of" & Natural'Image (N) & " (recursive):" &
      Natural'Image (Factorial_Result_Recursive));
   Ada.Text_IO.Put_Line
     ("GCD of" & Integer'Image (A) & " and" & Integer'Image (B) &
      " (recursive):" & Integer'Image (GCD_Result_Recursive));
   Ada.Text_IO.Put_Line
     ("Diophantine solution (recursive) for" & Integer'Image (A) & "x +" &
      Integer'Image (B) & "y =" &
      Integer'Image (Diophantine_Result_Recursive.GCD) & ": x = " &
      Integer'Image (Diophantine_Result_Recursive.X) & ", y =" &
      Integer'Image (Diophantine_Result_Recursive.Y));
end Main;
