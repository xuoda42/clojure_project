less(X, Y) :-
    name(X, L),
    name(Y, M),
    less_1(L, M).

less_1([], [_|_]).

less_1([X|_], [Y|_]) :- X < Y.

less_1([X|Xs], [X|Ys]) :- less_1(Xs, Ys).

less_1([X|_], [X|_]) :- !.