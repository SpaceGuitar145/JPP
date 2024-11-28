extended_gcd(0, B, B, 0, 1).
extended_gcd(A, B, G, X, Y) :-
    A > 0,
    A1 is B mod A,
    extended_gcd(A1, A, G, X1, Y1),
    X is Y1 - (B div A) * X1,
    Y is X1.

solve_diophantine(A, B, C, X, Y) :-
    extended_gcd(A, B, G, X1, Y1),
    (C mod G =\= 0 ->
        write('No solution'), fail
    ;
        K is C div G,
        X is X1 * K,
        Y is Y1 * K,
        format('Diophantine solution (~d*x + ~d*y = ~d): (~d, ~d)~n', [A, B, C, X, Y])
    ).

main_de :-
    A = 4,
    B = 6,
    C = 14,
    solve_diophantine(A, B, C, _, _).