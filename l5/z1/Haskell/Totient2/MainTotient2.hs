module Totient2.MainTotient2 (mainTotient2) where

import PrimeFactors.MainPrimeFactors (prime_factors, unique)

totient2 :: Integer -> Integer
totient2 n = round (fromIntegral n * product (map (\p -> 1 - 1 / fromIntegral p) uniqueFactors))
  where
    factors = prime_factors n
    uniqueFactors = unique factors

mainTotient2 :: IO ()
mainTotient2 = do
  let n = 9
  putStrLn $ "Totient2 of " ++ show n ++ ": " ++ show (totient2 n)
