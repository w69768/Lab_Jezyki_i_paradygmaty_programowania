%ZAD1
%Wieksza(x,Y) - wpisz która liczba jest wiêksza.
wieksza(X,Y):-
    X>Y,!,
    write(X),write(' > '), write(Y).
wieksza(X,Y):-
    X<Y,!,
    write(Y),write(' < '), write(X).
wieksza(_,_):-
    write('Liczby s¹ równe').


%maksimum
max(X,Y,X):- X>=Y,!.
max(_,Y,Y).


%parzysta
czy_parzysta(X):-
    (X mod 2) =:= 0.




%silnia
silnia(0,1).
silnia(N,W):-
    N>0,
    N1 is N-1,
    silnia(N1,W1),
    W is N * W1.



%suna liczba od 1 do N
suma(1,1).
suma(N,S):-
    N1 is N-1,
    suma(N1, S1),
    S is S1+N.



%ci¹g fibonacciego
%przypadki bazowe
fibonacci(1,1):- !.
fibonacci(2,1):- !.

%przypadek rekurencyjny
fibonacci(N,X) :-
    N>2,
    N1 is N-1,
    N2 is N-2,
    fibonacci(N1, X1),
    fibonacci(N2, X2),
    X is X1 + X2.



%NWD
nwd(X,X,X):- X>0.
nwd(X,Y,Z):- X>Y, Y>0, W is X-Y, nwd(Y,W,Z).
nwd(X,Y,Z):- X<Y, X>0, W is Y-X, nwd(X,W,Z).





%Zad4
produkt(jablko, 2.50, 10).
produkt(banan, 4.00, 25).
produkt(pomarancza, 3.80, 12).
produkt(winogrono, 6.50, 8).


wartosc_produktu(X,W):-
    produkt(X,Y,Z),
    W is Y*Z.


wartosc_magazynu(W) :-
    findall(WP, wartosc_produktu(_, WP), Lista),
    sum_list(Lista, W).


drogi_produkt(N):-
    produkt(N,Cena, _),
    Cena>4.



%Zad5
rachunek(styczen, prad, 180).
rachunek(styczen, gaz, 220).
rachunek(styczen, woda, 90).
rachunek(styczen, internet, 70).

rachunek(luty, prad, 160).
rachunek(luty, gaz, 240).
rachunek(luty, woda, 85).
rachunek(luty, internet, 70).

rachunek(marzec, prad, 190).
rachunek(marzec, gaz, 200).
rachunek(marzec, woda, 95).
rachunek(marzec, internet, 70).

%suma_miesiac
suma_miesiac(Miesiac, S) :-
    findall(Cena, rachunek(Miesiac, _, Cena), Lista),
    sum_list(Lista, S).

%srednia_miesiac
srednia_miesiac(Miesiac, Sr) :-
    findall(Cena, rachunek(Miesiac, _, Cena), Lista),
    sum_list(Lista, Suma),
    length(Lista, N),
    N > 0,
    Sr is Suma / N.

%porownaj miesiace
porownaj_miesiace(M1, M2, Wynik) :-
    suma_miesiac(M1, S1),
    suma_miesiac(M2, S2),
    (S1 > S2  -> Wynik = m1_drozszy;
     S2 > S1  -> Wynik = m2_drozszy;
     Wynik = rowne
    ).



%zad6
pracownik(jan,   4800, 500).
pracownik(anna,  5200, 300).
pracownik(piotr, 4500, 900).
pracownik(ola,   6000, 0).


brutto(X, B) :-
    pracownik(X, Podstawa, Premia),
    B is Podstawa + Premia.

podatek17(X, T) :-
    brutto(X, B),
    T is B * 0.17.

netto(X, N) :-
    brutto(X, B),
    podatek17(X, T),
    N is B - T.

czy_zarabia_wiecej(X, Y, Kto) :-
    netto(X, NX),
    netto(Y, NY),
    (   NX > NY -> Kto = x;
        NY > NX -> Kto = y;
        Kto = rowno
    ).
