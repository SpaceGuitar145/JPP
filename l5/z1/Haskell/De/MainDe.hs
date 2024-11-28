module De.MainDe (mainDe) where

de :: Integer -> Integer -> (Integer, Integer, Integer)
de a b = extendedGCD a b
  where
    extendedGCD 0 b = (b, 0, 1)
    extendedGCD a b = let (g, s, t) = extendedGCD (b `mod` a) a
                      in (g, t - (b `div` a) * s, s)

mainDe :: IO ()
mainDe = do
  let a = 4
  let b = 6
  let c = 14
  let (g, x, y) = de a b
  if c `mod` g /= 0 then
    putStrLn $ "No solution"
  else
    let k = c `div` g
    in putStrLn $ "Diophantine solution (" ++ show a ++ "x + " ++ show b ++ "y = " ++ show c ++ "): (" ++ show (x * k) ++ " " ++ show (y * k) ++ ")"
