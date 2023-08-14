% Tomasz Targiel
% Lista 5
% Zadanie 1

clear; % Czyszcze workspace
clc; % Czyszcze command window

% Deklaruje zmienne
e = [-0.5, 0, 0.5, 1, 1.5]; % Deklaruje 5 roznych mimosrodow tak by petla mogla z nich skorzystac
x0 = 1; % Zmienna x-owa wierzcholka
y0 = 1; % Zmienna y-owa wierzcholka
x = linspace(-16, 16, 1000); % Ustalam zakres dla x
kol = ['b', 'k', 'r', 'g', 'm']; % Tworze tablice kolorow (uzyje jej w petli)

for n = 1:5
    hold on; % Komenda ta powoduje, ze zmiany naniesione przez kolejne iteracje petli pozostaja na wykresie
    y = (((x - x0) .^ 2) / 4 * e(n)) + y0; % y jest juz przeksztalconym wzorem z zadania
    plot(x, y, kol(n)); % Rysuje parabole (w kolorze odpowiednim danej iteracji)
    s = scatter(x0, y0 + e(n), 'filled', kol(n)); % Zaznaczam ognisko dla kazdej paraboli (w kolorze odpowiednim danej iteracji)
    grid; % Rysuje siatke
    set(get(get(s, 'Annotation'), 'LegendInformation'), 'IconDisplayStyle', 'off'); % Wylaczam legende dla ognisk
end
legend('mimosrod -0.5', 'mimosrod 0', 'mimosrod 0.5', 'mimosrod 1', 'mimosrod 1.5'); % Wyswietlam legende dla wszystkich paraboli
