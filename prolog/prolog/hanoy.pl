hanoy(N) :- move(N, left, middle, right).

move(0, _, _, _) :- !.
move(N, A, B, C) :-
    M is N-1,
    move(M, A, C, B),
    tell(A, B),
    move(M, C, B, A).

tell(X, Y) :-
    write([move, disk, from, pin, X, on, pin, Y]), nl.