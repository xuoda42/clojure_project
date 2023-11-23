edge(a, b, 14).
edge(b, a, 14).
edge(a, c, 15).
edge(c, a, 15).
edge(c, d, 2).
edge(d, c, 2).
edge(d, e, 9).
edge(e, d, 9).
edge(c, e, 30).
edge(e, c, 30).

path(From, To, Dist) :- edge(To, From, Dist).
path(From, To, Dist) :- edge(From, To, Dist).

shorterPath([H|Path], Dist) :-
    (rpath([H|_], D) -> Dist < D -> retract(rpath([H|_], _)); true),
    assertz(rpath([H|Path], Dist)).

traverse(From, Path, Dist) :-
    path(From, T, D),
    \+ memberchk(T, Path),
    shorterPath([T,From|Path], Dist+D),
    traverse(T, [From|Path], Dist+D).

traverse(From) :-
    retractall(rpath(_, _)),
    traverse(From, [], 0).

traverse(_).

calc(From, To) :-
    traverse(From),
    rpath([To|RPath], Dist) ->
        reverse([To|RPath], Path),
        Distance is Dist,
        format('The shortest path is ~w with distance ~w\n', [Path, Distance]);
    format('There is no route from ~w to ~w\n', [From, To]).