% Tomasz Targiel
% Lista 7
% Zadanie 2

clear; % Czyszcze workspace
clc; % Czyszcze command window

% Tworze sfere w punkcie (0, 0, 0) oraz proste do niej styczne, ktore podam dalej do wykresu quiver3
[X, Y, Z] = sphere(10);
[U, V, W] = surfnorm(X, Y, Z);

% Wczesniej utworzona sfere zmniejszam dwukrotnie dla lepszej wizualizacji jej w przestrzeni 3D oraz deklaruje zmienne na podstawie ktorych wyswietle sfere pozniej
r = 0.5;
X2 = X * r;
Y2 = Y * r;
Z2 = Z * r;

% Ladunek dodatni
subplot(1, 2, 1); % Dziele okno w poziomie na dwie czesci i w pierwszej bede wykreslal ladunek dodatni
quiver3(X, Y, Z, U, V, W, 0) % Od zmiennych w punktach (X, Y, Z) poprowadze proste styczne do sfery o dlugosciach (U, V, W) - wyliczone wczesniej
hold on
surf(X2, Y2, Z2, 'FaceColor', [1 0 0], 'EdgeColor', [1 0 0]) % Koloruje sfere na kolor czerwony symbolizujacy ladunek dodatni
axis equal
title('Ladunek dodatni (+)') % Nazywam podwykres dla lepszej czytelnosci

% Ladunek ujemny
subplot(1, 2, 2); % W drugiej czesci okna bede wykreslal ladunek ujemny
quiver3(X + U, Y + V, Z + W, -U, -V, -W, 0) % Do zmiennych w punktach (X, Y, Z) dodaje dlugosci prostych stycznych do sfery, a nastepnie prowadze od tak wyznaczonych wspolrzednych proste o dlugosciach (U, V, W) - wyliczone wczesniej, dzieki temu ich groty beda wskazywac na ladunek ujemny
hold on
surf(X2, Y2, Z2, 'FaceColor', [0 0 1], 'EdgeColor', [0 0 1]) % Koloruje sfere na kolor niebieski symbolizujacy ladunek ujemny
axis equal
title('Ladunek ujemny (-)') % Nazywam podwykres dla lepszej czytelnosci
