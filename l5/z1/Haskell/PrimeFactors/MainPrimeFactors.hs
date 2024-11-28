{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Eta reduce" #-}
module PrimeFactors.MainPrimeFactors (prime_factors, unique, mainPrimeFactors) where

import Data.List (nub)

prime_factors :: Integer -> [Integer]
prime_factors n = factorize n 2
  where
    factorize 1 _ = []
    factorize n f
      | n `mod` f == 0 = f : factorize (n `div` f) f
      | otherwise      = factorize n (f + 1)

unique :: (Eq a) => [a] -> [a]
unique = nub

mainPrimeFactors :: IO ()
mainPrimeFactors = do
  let n = 60
  putStrLn $ "Prime Factors of " ++ show n ++ ": " ++ show (unique (prime_factors n))
