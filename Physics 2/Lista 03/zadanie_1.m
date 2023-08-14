% Tomasz Targiel
% Lista 3
% Zadanie 1

clear; % Czyszcze workspace
clc; % Czyszcze command window

% Deklaruje zmienne
Ax = [4, 4, 4, 4, 4, 4, 2, 4, 2];
Ay = [4, 2, 4, 2, 2, 2, 4, 1, 4];
omega_x = [1, 1, 1, 1, 1, 2, 1, pi, 20];
omega_y = [1, 1, 1, 1, 1, 1, 2, 10, 10];
delta = [pi, pi, pi + pi / 2, pi + pi / 2, pi - pi / 4, 0.5 - pi / 4, pi / 4, pi, pi - pi / 4];
alfa = [pi, pi, pi, pi, pi, 0.5, 0.5, 5, pi];
t = linspace(-5, 5, 1000);

for n = 1:9
    x = Ax(n) * cos(omega_x(n) * t + delta(n));
    y = Ay(n) * cos(omega_y(n) * t + alfa(n));
    subplot(3, 3, n); % Generuje podzial na siatke 3x3 i aktywuje n-ty kwadrat
    plot(x, y); % Rysuje wykres
    axis([-5, 5, -5, 5]); % Ustalam zakres osi
    grid; % Rysuje siatke
end
