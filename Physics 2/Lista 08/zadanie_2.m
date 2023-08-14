% Tomasz Targiel
% Lista 8
% Zadanie 2

clear; % Czyszcze workspace
clc; % Czyszcze command window

[X, Y] = meshgrid(-2:0.2:2); % Do zmiennych X oraz Y zapisuje wspolrzedne wygenerowane z siatki (zakres -2:2 co 0.2)

k = 8.9875e9; % Deklaruje wartosc stalej elektrostatycznej "na sztywno"
p = [-1, 0; 1, 0; -1, 0; 1, 0]; % Deklaruje tablice polozen ladunkow np. p1(-1, 0), p2(1, 0)
Q = [10, 10, 10, -10]; % Deklaruje tablice z wartosciami ladunkow

% Ustalam wymiary okna z wykresami
box = figure;
box.Units = 'centimeters';
box.Position(3:4) = [32 12];

for i = 1:2 % Wykonuje dwa razy petle zeby pojawily sie dwa podwykresy na obrazku
    V = 0; % Deklaruje oraz zeruje zmienna przechowujaca potencjal
    subplot(1, 2, i); % Dziele okno w poziomie na dwie czesci i w i-tej bede rysowal ladunki
    if i == 1
        for j = 1:2 % Obliczam potencjal elektryczny dla ladunkow jednoimiennych
            V = V + k .* Q(j) ./ hypot(p(j, 1) - X, p(j, 2) - Y); % We wzorze na potencjal uzywam funkcji hypot, ktora przyspiesza obliczanie pierwiastka sum kwadratow zmiennych
        end
        tytul = 'Ladunki jednoimienne (+/+)';
    else
        for j = 3:4 % Obliczam potencjal elektryczny dla ladunkow roznoimiennych
            V = V + k .* Q(j) ./ hypot(p(j, 1) - X, p(j, 2) - Y);
        end
        tytul = 'Ladunki roznoimienne (+/-)';
    end
    contourf(X, Y, V);
    legenda = colorbar;
    ylabel(legenda, 'Potencjal elektryczny (V)')
    title(tytul);
end
