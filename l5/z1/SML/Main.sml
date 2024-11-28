val _ = use "Binomial/MainBinomial.sml";
val _ = use "Binomial2/MainBinomial2.sml";
val _ = use "Mergesort/MainMergesort.sml";
val _ = use "De/MainDe.sml";
val _ = use "PrimeFactors/MainPrimeFactors.sml";
val _ = use "Totient/MainTotient.sml";
val _ = use "Totient2/MainTotient2.sml";
val _ = use "Primes/MainPrimes.sml";

fun main () = (
    Binomial.main();
    Binomial2.main();
    Mergesort.main();
    De.main();
    PrimeFactors.main();
    Totient.main();
    Totient2.main();
    Primes.main()
);

val _ = main ();
