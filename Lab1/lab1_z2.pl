%1
% Fakty o osobach i ich preferencjach
lubi(ania, biegac).
lubi(ania, czytac).
lubi(ania, kregle).
lubi(bartek, grac_w_pilke).
lubi(bartek, plywac).
lubi(rafal, jezdzic_na_rowerze).
lubi(bartek, kregle).

% Fakty o intensywnoœci aktywnoœci
intensywnosc(biegac, wysoki).
intensywnosc(czytac, niski).
intensywnosc(grac_w_pilke, sredni).
intensywnosc(plywac, sredni).
intensywnosc(jezdzic_na_rowerze, sredni).

% Fakty o wieku osób
wiek(ania, 25).
wiek(bartek, 30).
wiek(krzysiek, 35).

% Fakty o wymaganym sprzêcie
sprzet(biegac, brak).
sprzet(czytac, brak).
sprzet(grac_w_pilke, pilka).
sprzet(p³ywac, basen).
sprzet(jezdzic_na_rowerze, rower).

% Fakty o miejscu aktywnoœci
miejsce(biegac, outdoor).
miejsce(czytac, outdoor).
miejsce(graæ_w_pilke, outdoor).
miejsce(p³ywaæ, indoor).
miejsce(jeŸdziæ_na_rowerze, outdoor).
miejsce(kregle, indor).

% Fakty o kosztach aktywnoœci
koszt(biegac, 0).
koszt(czytac, 0).
koszt(graæ_w_pilke, 10).
koszt(p³ywaæ, 20).
koszt(jeŸdziæ_na_rowerze, 10).
koszt(kregle, 12).

% Fakty o porze dnia dla aktywnoœci
pora(biegac, rano).
pora(czytac, popo³udnie).
pora(graæ_w_pilke, popo³udnie).
pora(p³ywaæ, wieczor).
pora(jeŸdziæ_na_rowerze, popo³udnie).
pora(kregle, wieczor).

% Fakty o aktywnoœciach relaksuj¹cych
relaks(czytac).
relaks(plywac).
relaks(kregle).

%2
%regula aktywnosci
aktywnosc_wysokiej_intensywnosci(Aktywnosc) :-
    intensywnosc(Aktywnosc, wysoki).

aktywnosc_sredniej_intensywnosci(Aktywnosc) :-
    intensywnosc(Aktywnosc, sredni).

aktywnosc_niskiej_intensywnosci(Aktywnosc) :-
    intensywnosc(Aktywnosc, niski).

%regula dopasowanie aktywnosci
dopasowane_aktywnosci(Osoba, Aktywnosc) :-
    lubi(Osoba, Aktywnosc),
    wiek(Osoba, Wiek),
    (Wiek > 30 -> intensywnosc(Aktywnosc, wysoki) ; intensywnosc(Aktywnosc, sredni)).

%regula wymagany sprzet
aktywnosc_z_sprzetem(Aktywnosc) :-
    sprzet(Aktywnosc, Sprzet),
    Sprzet \= brak.

%regula aktywnosc na swiezym powietrzu
na_swiezym_powietrzu(Aktywnosc) :-
    miejsce(Aktywnosc, outdoor).

%regula najdrozsza aktywnosc
najdro¿sza_aktywnosc(Aktywnosc) :-
    koszt(Aktywnosc, Koszt),
    not((koszt(_, InnyKoszt), InnyKoszt > Koszt)).

%3
na_zewnatrz(Aktywnosc) :-
    miejsce(Aktywnosc, outdoor).


tania(Aktywnosc) :-
    koszt(Aktywnosc, Koszt),
    Koszt =< 10.

pasuje_dla(Osoba, Aktywnosc) :-
    lubi(Osoba, Aktywnosc),
    pora(Aktywnosc, wieczor),
    koszt(Aktywnosc, Koszt),
    Koszt =< 25.

wspolne(Osoba1, Osoba2, Aktywnosc) :-
    lubi(Osoba1, Aktywnosc),
    lubi(Osoba2, Aktywnosc).

relaks_w_naturze(Aktywnosc) :-
    relaks(Aktywnosc),
    miejsce(Aktywnosc, outdoor).

















