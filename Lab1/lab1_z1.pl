% ===== FAKTY =====
% rodzic(Rodzic,Dziecko)
%
rodzic(zofia, marcin).
rodzic(andrzej, marcin).
rodzic(andrzej, kasia).
rodzic(marcin, ania).
rodzic(marcin, krzys).
rodzic(krzys, miko³aj).

% p³eæ
kobieta(zofia).
kobieta(ania).
kobieta(kasia).

mezczyzna(andrzej).
mezczyzna(marcin).
mezczyzna(krzys).
mezczyzna(mikolaj).

% regu³y
% potomek(potomek, poprzednik)
potomek(Y,X):-rodzic(X,Y).

% matka(matka,dziecko)
matka(X,Y):- kobieta(X), rodzic(X,Y).

%dziadkowie
dziadkowie(X,Z):-
    rodzic(X,Y),
    rodzic(Y,Z).

siostra(X,Y):-
    kobieta(X),
    rodzic(Z,X),
    rodzic(Z,Y),
    X\=Y.


brat(X,Y):-
    rodzic(Z,X),
    rodzic(Z,Y),
    mezczyzna(X),
    X\=Y.
