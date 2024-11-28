structure Binomial2 = struct
    fun nextRow row =
        let
            val extendedRow = 0 :: row @ [0]
        in
            ListPair.map op+ (extendedRow, tl extendedRow)
        end

    fun generatePascal n =
        let
            fun genPascalHelper (rows, 0) = List.rev rows
              | genPascalHelper (rows, count) = genPascalHelper (nextRow (hd rows) :: rows, count - 1)
        in
            genPascalHelper ([[1]], n)
        end

    fun binomial2 (n, k) =
        let
            val pascal = generatePascal n
        in
            List.nth (List.nth (pascal, n), k)
        end

    fun main () =
        let
            val n = 5
            val k = 2
        in
            print ("Binomial2 Coefficient (" ^ Int.toString n ^ ", " ^ Int.toString k ^ "): " ^ Int.toString (binomial2 (n, k)) ^ "\n")
        end
end
