import Binomial.MainBinomial (mainBinomial)
import Binomial2.MainBinomial2 (mainBinomial2)
import Mergesort.MainMergesort (mainMergesort)
import De.MainDe (mainDe)
import PrimeFactors.MainPrimeFactors (mainPrimeFactors)
import Totient.MainTotient (mainTotient)
import Totient2.MainTotient2 (mainTotient2)
import Primes.MainPrimes (mainPrimes)

main :: IO ()
main = do
  mainBinomial
  mainBinomial2
  mainMergesort
  mainDe
  mainPrimeFactors
  mainTotient
  mainTotient2
  mainPrimes
