%Zad1

first([H|_],H).

last([X],X).
last([_|T],X):-
    last(T,X).

sum_list([],0).
sum_list([H|T],Sum):-
    sum_list(T,SumT),
    Sum is SumT + H.


%Zad 2
count_greater([], _, 0).
count_greater([H|T], N, Count) :-
    H > N,
    count_greater(T, N, Count1),
    Count is Count1 + 1.

count_greater([H|T], N, Count) :-
    H =< N,
    count_greater(T, N, Count).


%Zad3
prefix([],_).
prefix([H|TP], [H|TL]):-
    prefix(TP,TL).

suffix(L,L).
suffix(S,[_|T]):-
    suffix(S,T).


sublist(S, L) :-
    prefix(S, L).
sublist(S, L) :-
    append(_, R, L),
    prefix(S, R).


%Zad4
max_list([H|T], M) :-
    max_list_acc(T, H, M).
max_list_acc([], Max, Max).
max_list_acc([H|T], Acc, Max) :-
    NewAcc is max(H, Acc),
    max_list_acc(T, NewAcc, Max).



sum_list4(List, Sum) :-
    sum_list_acc(List, 0, Sum).
sum_list_acc([], Acc, Acc).
sum_list_acc([H|T], Acc, Sum) :-
    NewAcc is Acc + H,
    sum_list_acc(T, NewAcc, Sum).



product_list(List, Product) :-
    product_list_acc(List, 1, Product).
product_list_acc([], Acc, Acc).
product_list_acc([H|T], Acc, Product) :-
    NewAcc is Acc * H,
    product_list_acc(T, NewAcc, Product).



%Zad5
replace([], _, _, []).

replace([X|T], X, Y, [Y|NT]) :-
    replace(T, X, Y, NT).

replace([H|T], X, Y, [H|NT]) :-
    H \= X,
    replace(T, X, Y, NT).



%Zad6
prefix6([], _).
prefix6([H|TP], [H|TL]) :-
    prefix6(TP, TL).

suffix6(L, L).
suffix6(S, [_|T]) :-
    suffix6(S, T).

sublist6(Sub, List) :-
    suffix6(S, List),
    prefix6(Sub, S).

all_sublists(List, Sub) :-
    sublist6(Sub, List).




%Zad7
increasing_sublist7(L, R) :-
    findall(Sub7, sublist7(Sub7, L), Sublists7),
    filter_increasing7(Sublists7, IncSublists7),
    longest7(IncSublists7, R).

sublist7([], _).
sublist7([H|T], [H|T2]) :-
    sublist7(T, T2).
sublist7(Sub7, [_|T]) :-
    sublist7(Sub7, T).

filter_increasing7([], []).
filter_increasing7([H|T], [H|T2]) :-
    is_increasing7(H),
    filter_increasing7(T, T2).
filter_increasing7([_|T], T2) :-
    filter_increasing7(T, T2).

is_increasing7([_]).
is_increasing7([H1, H2|T]) :-
    H1 < H2,
    is_increasing7([H2|T]).

longest7([H], H).
longest7([H1,H2|T], Longest7) :-
    length(H1, Len1),
    length(H2, Len2),
    (Len1 >= Len2 -> longest7([H1|T], Longest7); longest7([H2|T], Longest7)).



%Zad3.1
usun_ostatnie_3(L, L1) :-
    append(L1, [_, _, _], L).


%Zad3.2
usun_pierwsze_3(L, L1) :-
    append([_, _, _], L1, L).


%Zad3.3
usun_pierwsze_ostatnie_3(L, L2) :-
    append([_, _, _], LTemp, L),
    append(L2, [_, _, _], LTemp).



%Zad3.4
parzysta([]).
parzysta([_, _|T]) :-
    parzysta(T).


nieparzysta([_]).
nieparzysta([_, _|T]) :-
    nieparzysta(T).
