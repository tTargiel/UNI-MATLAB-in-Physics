% Tomasz Targiel
% Lista 1
% Zadanie 1

clear; % Czyszcze workspace
clc; % Czyszcze command window

i = input('Wpisz liczbe wyrazow wektora x(i), i='); % Oczekuje na i, czyli na liczbe wyrazow wektora x(i)

if i < 1 || mod(i, 1) ~= 0 % Jezeli uzytkownik poda liczbe wyrazow mniejsza od 1 lub liczbe ktora nie jest calkowita, to wektor nie bedzie istniec, przerywam program
    disp('Podales liczbe mniejsza od 1 lub liczbe ktora nie jest calkowita, przerywam program!');
    return;
end

for a = 1:i % Tworze petle for, ktora wykona sie tyle razy ile jest rowne i podane poczatkowo przez uzytkownika
    x(a) = input('Podaj liczbe: '); % Prosze uzytkownika o podanie coraz to kolejnego wyrazu wektora x(i)
    if x(a) < 0 || mod(x(a), 1) ~= 0
        disp('Podales liczbe ktora nie jest calkowita lub liczbe ujemna, przerywam program!');
        return;
    end
end

disp('Silnia dla wektora x to: ');
silnia(x)
