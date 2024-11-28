gcd(A, 0, A).
gcd(A, B, G) :-
    B \= 0,
    R is A mod B,
    gcd(B, R, G).

totient(N, Phi) :-
    findall(X, (between(1, N, X), gcd(N, X, 1)), Coprimes),
    length(Coprimes, Phi).

main_totient :-
    N = 9,
    totient(N, Phi),
    format('Totient of ~d: ~d~n', [N, Phi]).
