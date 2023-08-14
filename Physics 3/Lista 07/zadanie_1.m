% Tomasz Targiel
% Lista 7
% Zadanie 1

% Ten program rysuje wykres polozenia obrazu w funkcji polozenia przedmiotu dla wypuklej powierzchni zakrzywiajacej

clear;
clc;

% Dane ogolne
R = 10; % Promien krzywizny
n1 = 1; % Wspolczynnik zalamania 1
n2 = 1.5; % Wspolczynnik zalamania 2

% Obliczenia
% Dla calego
p1 = [15:0.01:25]; % Zakres polozenia przedmiotu
q1 = n2 ./ (((n2 - n1) ./ R) - (n1 ./ p1));
% f = ((n2 ./ n1) - 1) * ((1 ./ R))
% p1 = linspace(0.5 * f, 1.5 * f, 101)
% q1 = 1 ./ ((1 ./ f) - (1 ./ p1));

% Dla pozornego
p2 = [15:0.01:20];
q2 = n2 ./ (((n2 - n1) ./ R) - (n1 ./ p2));

% Dla rzeczywistego
p3 = [20:0.01:25];
q3 = n2 ./ (((n2 - n1) ./ R) - (n1 ./ p3));

figure(1)
subplot(3, 1, 1)
plot(p1, q1);
title('Caly zakres')
xlabel('Polozenie przedmiotu [m]')
ylabel('Polozenie obrazu [m]')

subplot(3, 1, 2)
plot(p2, q2)
title('Pozorny')
xlabel('Polozenie przedmiotu [m]')
ylabel('Polozenie obrazu [m]')

subplot(3, 1, 3)
plot(p3, q3)
title('Rzeczywisty')
xlabel('Polozenie przedmiotu [m]')
ylabel('Polozenie obrazu [m]')
