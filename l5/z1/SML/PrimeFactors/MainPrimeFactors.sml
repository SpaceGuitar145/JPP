structure PrimeFactors = struct
    fun prime_factors n = 
        let
            fun factorize (1, _) = []
              | factorize (n, d) =
                if d * d > n then
                    if n > 1 then [n] else []
                else if n mod d = 0 then
                    d :: factorize (n div d, d)
                else
                    factorize (n, d + 1)
        in
            factorize (n, 2)
        end

    fun unique lst =
        let
            fun removeDuplicates [] acc = List.rev acc
              | removeDuplicates (x::xs) acc =
                  if List.exists (fn y => x = y) acc then
                      removeDuplicates xs acc
                  else
                      removeDuplicates xs (x::acc)
        in
            removeDuplicates lst []
        end

    fun main () = 
        let 
            val n = 60
            val factors = unique (prime_factors n)
        in
            print ("Prime Factors of " ^ Int.toString n ^ ": " ^ String.concatWith ", " (List.map Int.toString factors) ^ "\n")
        end
end
