% Tomasz Targiel
% Lista 10
% Zadanie 1

% Program tworzy wykres zmiany dlugosci preta wykonanego z jednego z 5
% materialow w temperaturach od 0 do 100 st. Celsjusza

clear;
clc;

% Wspolczynniki rozszerzalnosci liniowej
a_a = 1.9 * 10 ^ (-4); % Asfalt
a_d = 0.012 * 10 ^ (-4); % Diament
a_m = 0.162 * 10 ^ (-4); % Miedz
a_s = 0.12 * 10 ^ (-4); % Stal
a_sz = 0.5 * 10 ^ (-4); % Szklo

l0 = 1; % Poczatkowa dlugosc [m]
T = [0:1:100]; % Zakres temperatury 0-100 st. C

% Tablice dlugosci w zaleznosci od zmian temperatury
l_a = l0 .* (1 + a_a .* T); % Asfalt
l_d = l0 .* (1 + a_d .* T); % Diament
l_m = l0 .* (1 + a_m .* T); % Miedz
l_s = l0 .* (1 + a_s .* T); % Stal
l_sz = l0 .* (1 + a_sz .* T); % Szklo

plot(T, l_a, T, l_d, T, l_m, T, l_s, T, l_sz);
xlabel('ΔT [*C]');
ylabel('l [m]')
title('Dlugosc preta w zaleznosci od temperatury')
legend('Asfalt', 'Diament', 'Miedz', 'Stal', 'Szklo')
