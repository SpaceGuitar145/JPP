structure Totient = struct
    fun gcd (a, 0) = a
      | gcd (a, b) = gcd (b, a mod b)

    fun totient n = 
        let
            fun count_coprimes 0 acc = acc
              | count_coprimes m acc =
                if gcd (n, m) = 1 then count_coprimes (m - 1) (acc + 1)
                else count_coprimes (m - 1) acc
        in
            count_coprimes n 0
        end

    fun main () = 
        let 
            val n = 9
        in
            print ("Totient of " ^ Int.toString n ^ ": " ^ Int.toString (totient n) ^ "\n")
        end
end
