%Найти НОД максимального нечетного 
%непростого делителя числа и произведения 
%цифр данного числа

nod(A,A,A).
nod(A,B,D) :- A>B, C is A-B, nod(C,B,D).
nod(A,B,D) :- A<B, C is B-A, nod(A,C,D).

max(A,A,A).
max(A,B,C) :- A>B, max(A,A,C).
max(A,B,C) :- A<B, max(B,B,C).

prod(0, 1).
prod(N, P) :-
    N>0,
    Last_digit is N mod 10,
    Rest is N // 10,
    prod(Rest, RestProd),
    P is Last_digit * RestProd.

primeNumber(A) :-
    A > 1,            
    prime_prime(A, 2).

prime_prime(A, B) :- 
    B >= A ->  true;   
    0 is A mod B ->  false;
    C is B + 1,
    prime_prime(A, C).

first_con(N, D) :-
    between(3, N, D),
    N mod D =:= 0,
    not(primeNumber(D)),
    D mod 2 =:= 1.

findNOD(N, B) :-
    prod(N, P),
    first_con(N, D),
    nod(D, P, B).