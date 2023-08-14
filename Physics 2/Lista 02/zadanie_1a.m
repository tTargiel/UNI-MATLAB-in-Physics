function zadanie_1a

% Tomasz Targiel
% Lista 2
% Zadanie 1
% Podpunkt a

clear; % Czyszcze workspace
clc; % Czyszcze command window

A = 4;
k = 0.5;
N = 1000;
omega = 4;

x = linspace(0, 40, N);
y = linspace(0, 40, N);
p = plot(x, y);
title('zadanie 1a');
axis([0, 40, -4.5, 4.5]);

for i = 1:100
    t = i * 0.04;
    y = A * sin(k * x - omega * t);
    set(p, 'XData', x, 'YData', y);
    drawnow;
    pause(0.02); % Definiuje opoznienie
end
