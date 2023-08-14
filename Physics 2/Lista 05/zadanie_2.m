% Tomasz Targiel
% Lista 5
% Zadanie 2

clear; % Czyszcze workspace
clc; % Czyszcze command window

% Deklaruje zmienne
theta = linspace(0, 2 * pi, 1000); % Jest to zakres dlugosci o jakie punkty elipsy beda odlegle od osi x
a = [1.00000261, 5.20336301, 17.8341]; % Deklaruje zbior trzech polosi wielkich (dla obiektow z zadania)
e = [0.01671123, 0.04839266, 0.967143]; % Deklaruje zbior trzech mimosrodow (dla obiektow z zadania)
kol = ['k', 'g', 'b']; % Tworze tablice kolorow (uzyje jej w petli)
xlabel('odleglosc (j.a.)'); % Nadaje osi x nazwe
ylabel('odleglosc (j.a.)'); % Nadaje osi y nazwe
axis([-35, 10, -20, 20]); % Ustalam zakres dla obu osi
axis equal; % Mam do czynienia z jednakowymi jednostkami obu osi, dlatego osie powinny miec jednakowa podzialke

for n = 1:3
    hold on; % Komenda ta powoduje, ze zmiany naniesione przez kolejne iteracje petli pozostaja na wykresie
    r = (a(n) * (1 - e(n) ^ 2)) ./ (1 + e(n) * cos(theta)); % r jest wzorem z zadania
    polar(theta, r, kol(n)); % Rysuje elipse (w kolorze odpowiednim danej iteracji)
end
plot(0, 0, 'xr', 'MarkerSize', 6); % Rysuje punkt x w kolorze czerwonym i o rozmiarze 6 - jest on oznaczeniem Ziemi
legend('Ziemia', 'Jowisz', 'Kometa Halleya', 'Slonce'); % Wyswietlam legende dla wszystkich orbit
