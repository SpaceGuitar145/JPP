split_list(List, Left, Right) :-
    length(List, Len),
    HalfLen is Len // 2,
    length(Left, HalfLen),
    append(Left, Right, List).

merge([], Ys, Ys).
merge(Xs, [], Xs).
merge([X|Xs], [Y|Ys], [X|Zs]) :- 
    X =< Y,
    merge(Xs, [Y|Ys], Zs).
merge([X|Xs], [Y|Ys], [Y|Zs]) :- 
    X > Y,
    merge([X|Xs], Ys, Zs).

mergesort([], []).
mergesort([X], [X]).
mergesort(List, Sorted) :-
    List = [_,_|_],
    split_list(List, Left, Right),
    mergesort(Left, SortedLeft),
    mergesort(Right, SortedRight),
    merge(SortedLeft, SortedRight, Sorted).

main_mergesort :-
    List = [4, 3, 1, 5, 2],
    mergesort(List, Sorted),
    format('Merge Sort: ~w~n', [Sorted]).
