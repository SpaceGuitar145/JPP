module Totient.MainTotient (mainTotient) where

totient :: Integer -> Integer
totient n = fromIntegral (length [x | x <- [1..n], gcd x n == 1])

mainTotient :: IO ()
mainTotient = do
  let n = 9
  putStrLn $ "Totient of " ++ show n ++ ": " ++ show (totient n)
