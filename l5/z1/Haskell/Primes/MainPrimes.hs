module Primes.MainPrimes (mainPrimes) where

primes :: Integer -> [Integer]
primes n = sieve [2..n]
  where
    sieve [] = []
    sieve (x:xs) = x : sieve [y | y <- xs, y `mod` x /= 0]

mainPrimes :: IO ()
mainPrimes = do
  let n = 30
  putStrLn $ "Primes between 2 and " ++ show n ++ ": " ++ show (primes n)
