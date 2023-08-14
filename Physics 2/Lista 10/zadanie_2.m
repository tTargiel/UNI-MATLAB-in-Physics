% Tomasz Targiel
% Lista 10
% Zadanie 2 (Polecenie 3)

% Skrypt rysujacy rozklad potencjalu i natezenia pola elektrycznego dla ukladu 4 dowolnych ladunkow lezacych w rogach kwadratu

% W moim przypadku zdecydowalem sie na rysowanie kwadrupola elektrycznego
% Kwadrupol elektryczny to uklad czterech ladunkow o tej samej bezwglednej
% wartosci (para dodatnich i para ujemnych), tworzacych kwadrat o bokach
% laczacych ladunki przeciwnego znaku - mysle, ze to ciekawszy wybor niz
% cztery dodatnie ladunki

clear all; clf; clc

pi = 3.14159; % Deklaruje wartosc pi
eps0 = 8.854187817 .* 10 .^ (-12); % Deklaruje wartosc przenikalnosci elektrycznej prozni
Q = 1; % Definiuje wartosc kazdego z ladunkow (takie same, poniewaz bede rysowal kwadrupol elektryczny)

r = -1:0.1:1; % Definiuje zakres (od -1 do 1) z krokiem 0.1
[x, y] = meshgrid(r); % Na podstawie zakresu 

% Definiuje odleglosci w taki sposob, by kazdy z ladunkow znajdowal sie w rogach kwadratu
R1 = ((x - 0.25) .^ 2 + (y + 0.25) .^ 2) .^ 0.5; % Lewy gorny
R2 = ((x + 0.25) .^ 2 + (y + 0.25) .^ 2) .^ 0.5; % Prawy gorny
R3 = ((x - 0.25) .^ 2 + (y - 0.25) .^ 2) .^ 0.5; % Lewy dolny
R4 = ((x + 0.25) .^ 2 + (y - 0.25) .^ 2) .^ 0.5; % Prawy dolny

% Zakladamy, ze q/(4 pi eo) = 1
% V = (1 ./ R1) + (1 ./ R2) + (1 ./ R3) + (1 ./ R4);

% Nic nie zakladamy, liczymy to jak ludzie
V = ((1 ./ 4 .* pi .* eps0) .* (Q ./ R1 - Q ./ R2 - Q ./ R3 + Q ./ R4)); % Obliczam wartosc potencjalu dla kwadrupola elektrycznego

figure(1) % W tym oknie bede pokazywal potencjal V i natezenie pola E kwadrupola
[px, py] = gradient(-V, 0.1, 0.1); % Obliczam wektory natezenia pola elektrycznego
contour(r, r, V, 20); % Rysuje izolinie na podstawie wczesniej zdefiniowanego zakresu (r), ktore beda wskazywac okreslony (w zaleznosci od izolinii) potencjal
hold on;
quiver(r, r, px, py); % Rysuje wektory natezenia pola na podstawie wczesniejszych obliczen (px, py)
hold off;
colorbar; % Po prawej stronie okna umieszczam wskaznik kolorystyczny dzieki ktoremu bedzie mozna odczytac wartosc potencjalu na podstawie koloru
title('Izolinie potencjalu V i wektory natezenia pola E kwadrupola');

figure(2) % W tym oknie bede pokazywal wykres 3D potencjalu
surf(x, y, V); % Rysuje trojwymiarowy wykres (na osi Z wskazywana bedzie wartosc potencjalu)
axis off; % Wylaczam osie
view(-11.25, 20); % Ustawiam wykres w pozadanej perspektywie
colorbar; % Po prawej stronie okna umieszczam wskaznik kolorystyczny dzieki ktoremu bedzie mozna odczytac wartosc potencjalu na podstawie koloru
title('Wykres 3D potencjalu V kwadrupola');
