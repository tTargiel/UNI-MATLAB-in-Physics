% Tomasz Targiel
% Lista 3
% Zadanie 2

% Skrypt rysuje wykres zaleznosci B(r) wewnatrz i na zewnatrz
% nieskonczonego, cylindrycznego przewodnika o promieniu a = 5 mm z pradem
% stalym o natezeniu I = 1 A

clear;
clc;

a = 0.001; % Promien przewodnika a
b = 0.002; % Promien przewodnika b
c = 0.0025; % Promien przewodnika c
d = 0.005; % Promien przewodnika d
e = 0.0055; % Promien przewodnika e
I1 = 2; % Natezenie pradu
I2 = -1; % Natezenie pradu
I3 = -1; % Natezenie pradu
mi0 = 4 * pi * 10^(-7); % Przenikalnosc magnetyczna
B = []; % Deklaruje pusta tablice indukcji magnetycznych
J1 = I1 / (pi * a ^ 2);
J2 = I2 / (pi * (c ^ 2 - b ^ 2));
J3 = I3 / (pi * (e ^ 2 - d ^ 2));
r = linspace(0,0.01,10000);
for i = 1 : size(r, 2) %
    mianownik = 2 * pi * r(i);
    if (0 <= r(i)) && (r(i) <= a)
        B(i) = (mi0 * (J1 * pi * r(i) ^ 2)) / mianownik;
    elseif (a < r(i)) && (r(i) < b)
        B(i) = (mi0 * I1) / mianownik;
    elseif (b <= r(i)) && (r(i) <= c)
        B(i) = (mi0 * (I1 + J2 * pi * (r(i) ^ 2 - b ^ 2))) / mianownik;
    elseif (c < r(i)) && (r(i) < d)
        B(i) = (mi0 * (I1 + I2)) / mianownik;
    elseif (d <= r(i)) && (r(i) <= e)
        B(i) = (mi0 * (I1 + I2 + J3 * pi * (r(i) ^ 2 - d ^ 2))) / mianownik;
    elseif (r(i) > e)
        B(i) = (mi0 * (I1 + I2 + I3)) / mianownik;
    end
end
plot(r, B, LineWidth = 2); % Rysuje wykres zaleznosci
title("Wykres zaleznosci B(r)"); % Nadaje tytul
xlabel("r [m]"); % Nadaje tytul osi x
ylabel("B [mT]"); % Nadaje tytul osi y

