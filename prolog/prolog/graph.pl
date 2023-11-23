a(newcastle, carlile, 58).
a(carlile, penrith, 23).
a(darlington, newcastle, 40).
a(penrith, darlington, 52).
a(worthington, carlile, 33).
a(worthington, penrith, 39).

a(X, Y) :- a(X, Y, Z).

join([], L, L).
join([X|L1], L2, [X|L3]) :-
    join(L1, L2, L3).

conversion([], []).

conversion([H|T], L) :- 
    conversion(T, Z), 
    join(Z, [H], L).


transition(Start, Goal, Way) :-
    transition0(Start, Goal, [], R),
    conversion(R, Way).

transition0(X, X, T, [X|T]).
transition0(Place, Y, T, R) :-
    nexthost(Place, T, Neighbour),
    transition0(Neighbour, Y, [Place|T], R).
nexthost(X, Been, Y) :-
    (a(X, Y); a(Y, X)),
    not(member(Y, Been)).