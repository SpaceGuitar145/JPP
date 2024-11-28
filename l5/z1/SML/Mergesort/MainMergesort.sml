structure Mergesort = struct
    fun merge ([], ys) = ys
      | merge (xs, []) = xs
      | merge (x::xs, y::ys) = 
            if x <= y then x::merge(xs, y::ys)
            else y::merge(x::xs, ys)

    fun split [] = ([], [])
      | split [x] = ([x], [])
      | split (x::y::zs) = 
            let
                val (xs, ys) = split zs
            in
                (x::xs, y::ys)
            end

    fun merge_sort [] = []
      | merge_sort [x] = [x]
      | merge_sort xs = 
            let
                val (left, right) = split xs
            in
                merge (merge_sort left, merge_sort right)
            end

    fun main () = 
        let 
            val input_list = [4, 3, 1, 5, 2]
            val sorted = merge_sort input_list
        in
            print ("Merge Sort: " ^ String.concatWith ", " (List.map Int.toString sorted) ^ "\n")
        end
end
