% Tomasz Targiel
% Lista 8
% Zadanie 2

% Program tworzy wykres zaleznosci calkowitego czasu biegu promienia t od polozenia punktu przekraczania granicy osrodkow x

clear;
clc;

% Predkosci
v1 = [7 7 1];
v2 = [1 7 7];
x = linspace(0, 10, 200); % Zakres
h1 = 15;
h2 = - h1;

s1 = sqrt((x(1) - x) .^ 2 + h1 ^ 2); % Odleglosc 1 punktu
s2 = sqrt((x - x(end)) .^ 2 + h2 ^ 2); % Odleglosc 2 punktu

% Czasy promieni
t1 = s1 ./ v1(1) + s2 ./ v2(1);
t2 = s1 ./ v1(2) + s2 ./ v2(2);
t3 = s1 ./ v1(3) + s2 ./ v2(3);

plot(x, t1, "r", x, t2, "b", x, t3, "y"); % Rysuje wykres

title("Zaleznosc t dla v1>v2, v1=v2, v1<v2")
xlabel("Polozenie punktu przekraczania granicy")
ylabel("Czas biegu promienia")
legend("v1>v2", "v1=v2", "v1<v2")
