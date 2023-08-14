% Tomasz Targiel
% Lista 3
% Zadanie 1

% Skrypt rysuje wykres zaleznosci B(r) wewnatrz i na zewnatrz
% nieskonczonego, cylindrycznego przewodnika o promieniu a = 5 mm z pradem
% stalym o natezeniu I = 1 A

clear;
clc;

a = 0.005; % Promien przewodnika
I = 1; % Natezenie pradu
mi0 = 4 * pi * 10^(-7); % Przenikalnosc magnetyczna
B = []; % Deklaruje pusta tablice indukcji magnetycznych
for r = 0:0.001:0.05 %
    if r < a
        B(end + 1) = (mi0 * I * r) / (2 * pi * a ^ 2); % Wzor na indukcje magnetyczna dla r < a
    else
        B(end + 1) = (mi0 * I) / (2 * pi * r); % Wzor na indukcje magnetyczna dla r >= a
    end
end
r = linspace(0.001,0.05,51);
plot(r, B); % Rysuje wykres zaleznosci
title("Wykres zaleznosci B(r)"); % Nadaje tytul
xlabel("r [m]"); % Nadaje tytul osi x
ylabel("B [mT]"); % Nadaje tytul osi y

