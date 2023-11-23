father(sergey, elena).
father(ivan, milana).
father(dmitriy, vasiliy).
father(mark, vasilisa).
father(vladimir, nikita).
father(alexandr, egor).
father(alexandr, diana).
father(danil, eva).
father(maxim, robert).
father(vladimir, alexandr).

mother(marina, elena).
mother(marina, milana).
mother(olga, vasiliy).
mother(elena, vasilisa).
mother(faina, nikita).
mother(irina, egor).
mother(oksana, eva).
mother(violetta, robert).

woman(marina).
woman(marina).
woman(olga).
woman(elena).
woman(faina).
woman(irina).
woman(oksana).
woman(violetta).

man(sergey).
man(ivan).
man(dmitriy).
man(mark).
man(vladimir).
man(alexandr).
man(danil).
man(maxim).
man(vasiliy).
man(nikita).
man(egor).
man(robert).

parent(sergey, elena).
parent(ivan, milana).
parent(dmitriy, vasiliy).
parent(mark, vasilisa).
parent(vladimir, nikita).
parent(alexandr, egor).
parent(danil, eva).
parent(maxim, robert).
parent(marina, elena).
parent(marina, milana).
parent(olga, vasiliy).
parent(elena, vasilisa).
parent(faina, nikita).
parent(irina, egor).
parent(oksana, eva).
parent(vladimir, alexandr).
parent(alexandr, diana).
parent(violetta, robert).


son(X,Y):-
  parent(Y,X), man(X).


is_mother(X) :- mother(X, _).

is_father(X) :- father(X, _).

is_son(X) :- father(_, X), man(X).

is_sister(X, Y) :- 
  woman(X),
  parent(Z, X), 
  parent(Z, Y),
  X \= Y.

grandparent(X, Y) :-
  man(X),
  father(X, Z),
  parent(Z, Y).

common_parent(X, Y) :-
  parent(Z, X),
  parent(Z, Y).