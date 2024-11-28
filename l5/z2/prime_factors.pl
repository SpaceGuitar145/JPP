factorize(1, _, []).
factorize(N, F, [F|Factors]) :-
    N > 1,
    0 is N mod F,
    N1 is N // F,
    factorize(N1, F, Factors).
factorize(N, F, Factors) :-
    N > 1,
    0 =\= N mod F,
    F1 is F + 1,
    factorize(N, F1, Factors).

prime_factors(N, Factors) :-
    factorize(N, 2, Factors).

unique([], []).
unique([H|T], [H|R]) :-
    \+ member(H, T),
    unique(T, R).
unique([H|T], R) :-
    member(H, T),
    unique(T, R).

main_prime_factors :-
    N = 60,
    prime_factors(N, Factors),
    unique(Factors, UniqueFactors),
    format('Prime Factors of ~d: ~w~n', [N, UniqueFactors]).