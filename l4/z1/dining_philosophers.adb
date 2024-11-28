with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Dining_Philosophers is

    package Forks is
        type Fork_State is (Available, In_Use);
        
        protected type Fork_Protected is
            entry Pick_Up;
            entry Put_Down;
        private
            State : Fork_State := Available;
        end Fork_Protected;

        procedure Pick_Up (Left, Right : access Fork_Protected);
        procedure Put_Down (Left, Right : access Fork_Protected);
    end Forks;

    package body Forks is
        protected body Fork_Protected is
            entry Pick_Up when State = Available is
            begin
                State := In_Use;
            end Pick_Up;

            entry Put_Down when True is
            begin
                State := Available;
            end Put_Down;
        end Fork_Protected;

        procedure Pick_Up (Left, Right : access Fork_Protected) is
        begin
            Left.Pick_Up;
            Right.Pick_Up;
        end Pick_Up;

        procedure Put_Down (Left, Right : access Fork_Protected) is
        begin
            Left.Put_Down;
            Right.Put_Down;
        end Put_Down;
    end Forks;

    use Forks;

    subtype Philosopher_Id is Positive;

    protected type Completion_Counter is
        procedure Increment;
        procedure Set_Target(Target : Natural);
        function All_Done return Boolean;
    private
        Count : Natural := 0;
        Target : Natural := 0;
    end Completion_Counter;

    protected body Completion_Counter is
        procedure Increment is
        begin
            Count := Count + 1;
        end Increment;

        procedure Set_Target(Target : Natural) is
        begin
            Completion_Counter.Target := Target;
        end Set_Target;

        function All_Done return Boolean is
        begin
            return Count = Target;
        end All_Done;
    end Completion_Counter;

    Completion : Completion_Counter;

    task type Philosopher (Id : Philosopher_Id; Left_Fork, Right_Fork : access Fork_Protected; Meals : Positive) is
        entry Start;
    end Philosopher;

    task body Philosopher is
        Meal_Count : Integer := 0;
    begin
        accept Start;

        loop
            exit when Meal_Count = Meals;

            Put_Line("Philosopher" & Philosopher_Id'Image(Id) & " is thinking.");
            delay Duration(2); 

            Put_Line("Philosopher" & Philosopher_Id'Image(Id) & " is hungry.");
            Pick_Up(Left_Fork, Right_Fork); 

            Put_Line("Philosopher" & Philosopher_Id'Image(Id) & " is eating.");
            delay Duration(2);

            Put_Down(Left_Fork, Right_Fork); 

            Meal_Count := Meal_Count + 1;
            Put_Line("Philosopher" & Philosopher_Id'Image(Id) & " has finished meal " & Integer'Image(Meal_Count) & ".");
        end loop;

        Put_Line("Philosopher" & Philosopher_Id'Image(Id) & " has finished all meals and left the table.");
        Completion.Increment;
    end Philosopher;

    Num_Philosophers : Integer;
    Num_Meals : Integer := 3;
begin
    Put("Enter number of philosophers: ");
    Get(Num_Philosophers);
    
    Put("Enter number of meals (default is 3): ");
    declare
        Meals_Input : Integer;
    begin
        Get(Meals_Input);
        if Meals_Input > 0 then
            Num_Meals := Meals_Input;
        else
            Put_Line("Invalid input. Using default value of 3 meals.");
        end if;
    exception
        when End_Error =>
            Put_Line("Using default value of 3 meals.");
        when others =>
            Put_Line("Invalid input. Using default value of 3 meals.");
    end;

    Completion.Set_Target(Num_Philosophers);

    declare
        Forks_Array : array(1 .. Num_Philosophers) of aliased Fork_Protected;
        type Philosopher_Access is access Philosopher;
        Philosophers_Array : array(1 .. Num_Philosophers) of Philosopher_Access;
    begin
        for I in 1 .. Num_Philosophers loop
            declare
                Left_Fork  : access Fork_Protected := Forks_Array(I)'Access;
                Right_Fork : access Fork_Protected := Forks_Array((I mod Num_Philosophers) + 1)'Access;
            begin
                Philosophers_Array(I) := new Philosopher(Id => Philosopher_Id(I), Left_Fork => Left_Fork, Right_Fork => Right_Fork, Meals => Num_Meals);
            end;
        end loop;

        for I in 1 .. Num_Philosophers loop
            Philosophers_Array(I).all.Start;
        end loop;

        loop
            exit when Completion.All_Done;
            delay Duration(1.0); 
        end loop;

        Put_Line("All philosophers have finished their meals.");
    end;

end Dining_Philosophers;
