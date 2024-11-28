sieve([], []).
sieve([X|Xs], [X|Primes]) :-
    exclude_multiples(X, Xs, Filtered),
    sieve(Filtered, Primes).

exclude_multiples(_, [], []).
exclude_multiples(N, [X|Xs], [X|Ys]) :-
    X mod N =\= 0,
    exclude_multiples(N, Xs, Ys).
exclude_multiples(N, [X|Xs], Ys) :-
    X mod N =:= 0,
    exclude_multiples(N, Xs, Ys).

range(Low, High, []) :- Low > High.
range(Low, High, [Low|Rest]) :-
    Low =< High,
    Next is Low + 1,
    range(Next, High, Rest).

main_primes :-
    N = 30,
    range(2, N, Range),
    sieve(Range, Primes),
    format('Primes between 2 and ~d: ~w~n', [N, Primes]).
