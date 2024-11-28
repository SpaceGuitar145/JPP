module Binomial.MainBinomial (mainBinomial) where

binomial :: Integer -> Integer -> Integer
binomial n k
  | k == 0 || k == n = 1
  | otherwise = binomial (n - 1) (k - 1) + binomial (n - 1) k

mainBinomial :: IO ()
mainBinomial = do
  let n = 5
  let k = 2
  putStrLn $ "Binomial Coefficient (" ++ show n ++ ", " ++ show k ++ "): " ++ show (binomial n k)
