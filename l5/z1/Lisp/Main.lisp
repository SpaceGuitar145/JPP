(load "Binomial/MainBinomial.lisp")
(load "Binomial2/MainBinomial2.lisp")
(load "Mergesort/MainMergesort.lisp")
(load "De/MainDe.lisp")
(load "PrimeFactors/MainPrimeFactors.lisp")
(load "Totient/MainTotient.lisp")
(load "Totient2/MainTotient2.lisp")
(load "Primes/MainPrimes.lisp")

(defun main ()
  (main-binomial)
  (main-binomial2)
  (main-mergesort)
  (main-de)
  (main-prime-factors)
  (main-totient)
  (main-totient2)
  (main-primes))

;; Execute main function
(main)
