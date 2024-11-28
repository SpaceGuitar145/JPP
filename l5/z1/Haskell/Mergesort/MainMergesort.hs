module Mergesort.MainMergesort (mainMergesort) where

mergesort :: Ord a => [a] -> [a]
mergesort [] = []
mergesort [x] = [x]
mergesort xs = merge (mergesort left) (mergesort right)
  where
    (left, right) = splitAt (length xs `div` 2) xs
    merge [] ys = ys
    merge xs [] = xs
    merge (x:xs) (y:ys)
      | x <= y    = x : merge xs (y:ys)
      | otherwise = y : merge (x:xs) ys

mainMergesort :: IO ()
mainMergesort = do
  let list = [4, 3, 1, 5, 2]
  putStrLn $ "Merge Sort: " ++ show (mergesort list)
