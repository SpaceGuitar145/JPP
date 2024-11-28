structure Primes = struct
    fun primes n = 
        let
            fun sieve [] = []
              | sieve (p::xs) = p :: sieve (List.filter (fn x => x mod p <> 0) xs)
        in
            sieve (List.tabulate (n-1, fn i => i + 2))
        end

    fun main () = 
        let 
            val n = 30
            val primesList = primes n
        in
            print ("Primes between 2 and " ^ Int.toString n ^ ": " ^ String.concatWith ", " (List.map Int.toString primesList) ^ "\n")
        end
end
