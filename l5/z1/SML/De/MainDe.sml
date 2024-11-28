structure De = struct
    fun extended_gcd (a, 0) = (a, 1, 0)
      | extended_gcd (a, b) =
          let
              val (g, x, y) = extended_gcd (b, a mod b)
          in
              (g, y, x - (a div b) * y)
          end

    fun de (a, b) = extended_gcd (a, b)

    fun solve_diophantine (a, b, c) =
        let
            val (g, x, y) = de (a, b)
        in
            if c mod g <> 0 then
                NONE
            else
                let
                    val k = c div g
                in
                    SOME (x * k, y * k)
                end
        end

    fun format_int n =
        if n < 0 then "-" ^ Int.toString (~n)
        else Int.toString n

    fun main () = 
        let 
            val a = 4
            val b = 6
            val c = 14
        in
            case solve_diophantine (a, b, c) of
                NONE => print "No solution\n"
              | SOME (x, y) =>
                print ("Diophantine solution (" ^ Int.toString a ^ "x + " ^ Int.toString b ^ "y = " ^ Int.toString c ^ "): (" ^ format_int x ^ " " ^ format_int y ^ ")\n")
        end
end
