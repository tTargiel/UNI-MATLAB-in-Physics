% Tomasz Targiel
% Lista 8
% Zadanie 1

clear; % Czyszcze workspace
clc; % Czyszcze command window

[X, Y] = meshgrid(-2:0.2:2); % Do zmiennych X oraz Y zapisuje wspolrzedne wygenerowane z siatki (zakres -2:2 co 0.2)

% Deklaruje polozenie dla ladunku pierwszego oraz jego wartosc
X1 = -1;
Y1 = 0;
Q1 = 10;

% Deklaruje polozenie dla ladunku drugiego
X2 = 1;
Y2 = 0;

a = 0.5; % Ustalam srednice ladunkow, ktore bede rysowal na wykresie
r = a / 2; % Ustalam promien rysowanych ladunku

% epsilon0 = 8.854187e-12; % Deklaruje przenikalnosc elektryczna prozni
% k = 1 / (4 * pi * epsilon0); % Wyliczam wartosc stalej elektrostatycznej
k = 8.9875e9; % Deklaruje wartosc stalej elektrostatycznej "na sztywno"

% Ustalam wymiary okna z wykresami
box = figure;
box.Units = 'centimeters';
box.Position(3:4) = [24 12];

for i = 1:2 % Wykonuje dwa razy petle zeby pojawily sie dwa podwykresy na obrazku
    % Wprowadzam sprawdzenie iteracji, by dopasowac wartosc drugiego ladunku, jego znak, kolor i przesuniecie tekstu na nim narysowanego
    if i == 1
        Q2 = 10;
        znak = '+';
        kol = [1 0 0]; % Ustawiam kolor na czerwony dla ladunku ujemnego
        przesTekstu = r / 1.5;
        tytul = 'Ladunki jednoimienne (+/+)';
    else
        Q2 = -10;
        znak = '-';
        kol = [0 0 1]; % Ustawiam kolor na niebieski dla ladunku ujemnego
        przesTekstu = r / 4;
        tytul = 'Ladunki roznoimienne (+/-)';
    end
    
    % Ladunek pierwszy (zawsze dodatni w moim programie)
    % Definiuje odleglosci X-owe oraz Y-owe dla ladunku pierwszego, a nastepnie na ich podstawie wyliczam promien, ktorego bede uzywal we wzorze
    RX = X - X1;
    RY = Y - Y1;
    % R = sqrt(RX .^ 2 + RY .^ 2);
    R = hypot(RX, RY); % Przegenialna funkcja - zastepuje ta co zakomentowalem powyzej
    
    % Ponizej stosuje wzory na natezenie pola elektrycznego dla pierwszego ladunku
    EX = k .* Q1 .* RX ./ R .^ 3;
    EY = k .* Q1 .* RY ./ R .^ 3;
    
    % Drugi ladunek (zaleznie od iteracji, ladunek bedzie dodatni lub ujemny)
    % Definiuje odleglosci X-owe oraz Y-owe dla ladunku drugiego, a nastepnie na ich podstawie wyliczam promien, ktorego bede uzywal we wzorze
    RX = X - X2;
    RY = Y - Y2;
    R = hypot(RX, RY);
    
    % Ponizej stosuje wzory na natezenie pola elektrycznego dla drugiego ladunku (dodaje do nich EX/EY, by zachowac wyliczone natezenie ladunku pierwszego)
    EX = EX + k .* Q2 .* RX ./ R .^ 3;
    EY = EY + k .* Q2 .* RY ./ R .^ 3;
    
    % Obliczam linie sil pola elektrycznego z uzyciem wczesniej obliczonych natezen (bede ich uzywal w funkcji quiver)
    E = sqrt(EX .^ 2 + EY .^ 2);
    U = EX ./ E;
    V = EY ./ E;
 
    subplot(1, 2, i); % Dziele okno w poziomie na dwie czesci i w i-tej bede rysowal ladunki
    wykres = quiver(X, Y, U, V, 'autoscalefactor', 0.5); % Rysuje wykres funkcja quiver (strzalki w plaszczyznie X wydluzone o dlugosc U, w plaszczyznie Y wydluzone o V)
    axis([-2, 2, -2, 2]); % Definiuje zakres osi
    title(tytul);
 
    % Rysuje dwia prostokaty w pozycjach X oraz Y przesunietych o promien, o wymiarach a*a, ktore pozniej scinam poleceniem 'curvature' dzieki czemu kazdy rog jest zaokraglony
    % Zaleznie od iteracji beda to albo dwie kule czerwone (ladunki jednoimienne dodatnie) lub jedna kula czerwona druga niebieska (ladunek ujemny)
    wykres = rectangle('Position', [X1 - r, Y1 - r, a, a], 'curvature', [1 1]);
    set(wykres, 'Facecolor', [1 0 0], 'Edgecolor', [1 0 0]);
    text(X1 - r / 1.5, Y1, '+', 'Color', 'white', 'FontSize', 24);
    wykres = rectangle('Position', [X2 - r, Y2 - r, a, a], 'curvature', [1 1]);
    set(wykres, 'Facecolor', kol, 'Edgecolor', kol);
    text(X2 - przesTekstu, Y2, znak, 'Color', 'white', 'FontSize', 24);
end
