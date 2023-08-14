% Tomasz Targiel
% Lista 7
% Zadanie 2

% Ten program rysuje wykres polozenia obrazu y w funkcji polozenia przedmiotu x0 dla cienkiej soczewki o ogniskowej f = −10

clear;
clc;

% Dane ogolne
f = -10; % Ogniskowa soczewki
x = [0:0.01:100]; % Zakres polozenia przedmiotu
y = 1 ./ ((1 ./ f) - (1 ./ x)); % Rownanie soczewki

plot(x, y)
title('Wykres polozenia y(x0)')
xlabel('Polozenie przedmiotu [m]')
ylabel('Polozenie obrazu [m]')
