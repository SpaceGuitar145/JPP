structure Binomial = struct
    fun binomial 0 0 = 1
      | binomial n 0 = 1
      | binomial 0 k = 0
      | binomial n k = binomial (n-1) (k-1) + binomial (n-1) k

    fun main () = 
        let
            val n = 5
            val k = 2
        in
            print ("Binomial Coefficient (" ^ Int.toString n ^ ", " ^ Int.toString k ^ "): " ^ Int.toString (binomial n k) ^ "\n")
        end
end