module Binomial2.MainBinomial2 (mainBinomial2) where

binomial2 :: Integer -> Integer -> Integer
binomial2 n k = pascal !! fromIntegral n !! fromIntegral k
  where
    pascal = iterate (\row -> zipWith (+) ([0] ++ row) (row ++ [0])) [1]

mainBinomial2 :: IO ()
mainBinomial2 = do
  let n = 5
  let k = 2
  putStrLn $ "Binomial2 Coefficient (" ++ show n ++ ", " ++ show k ++ "): " ++ show (binomial2 n k)
