structure Totient2 = struct
    open PrimeFactors

    fun totient2 n = 
        let
            val factors = unique (prime_factors n)
            fun product (x, []) = x
              | product (x, p::ps) = product (x * (p - 1) div p, ps)
        in
            product (n, factors)
        end

    fun main () = 
        let
            val n = 9
        in
            print ("Totient2 of " ^ Int.toString n ^ ": " ^ Int.toString (totient2 n) ^ "\n")
        end
end
