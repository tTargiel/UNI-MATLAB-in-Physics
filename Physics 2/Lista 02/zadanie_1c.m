function zadanie_1c

% Tomasz Targiel
% Lista 2
% Zadanie 1
% Podpunkt c

clear; % Czyszcze workspace
clc; % Czyszcze command window

A1 = 4;
A2 = 2;
k = 0.5;
N = 1000;
omega = 4;

x = linspace(0, 40, N);
y = linspace(0, 40, N);
p = plot(x, y);
title('zadanie 1c');
axis([0, 40, -10.5, 10.5]);

for i = 1:100
    t = i * 0.04;
    y = A1 * sin(k * x - omega * t) + A2 * sin(k * x + omega * t);
    set(p, 'XData', x, 'YData', y);
    drawnow;
    pause(0.02); % Definiuje opoznienie
end
