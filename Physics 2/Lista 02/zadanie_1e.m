function zadanie_1e

% Tomasz Targiel
% Lista 2
% Zadanie 1
% Podpunkt e

clear; % Czyszcze workspace
clc; % Czyszcze command window

A = 4;
epsilon = 10;
k = 0.5;
N = 1000;
omega = 1;

x = linspace(0, 40, N);
y = linspace(0, 40, N);
p = plot(x, y);
title('zadanie 1e');
axis([0, 40, -8.5, 8.5]);

for i = 1:100
    t = i * 0.04;
    y = A * sin(k * x - omega * t) + A * sin(k * x + (omega + epsilon) * t);
    set(p, 'XData', x, 'YData', y);
    drawnow;
    pause(0.02); % Definiuje opoznienie
end
