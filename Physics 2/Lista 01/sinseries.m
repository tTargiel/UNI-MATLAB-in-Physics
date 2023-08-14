% SINSERIES: oblicza wartosc sin(x) z rozwiniecia w szereg Taylora

% Tomasz Targiel
% Lista 1
% Zadanie 2

clear; % Czyszcze workspace
clc; % Czyszcze command window

format long; % Niech program wyswietla wiecej cyfr po przecinku

x = input('Wpisz argument sin(x), x='); % Oczekuje na x, czyli na argument sinusa
n = input('Wpisz liczbe elementow, n='); % Oczekuje na n, czyli na liczbe elementow rozwiniecia funkcji sinus w szereg Taylora

if n < 1 || mod(n, 1) ~= 0 % Jezeli uzytkownik poda liczbe wyrazow mniejsza od 1, lub liczbe ktora nie jest calkowita, to rozwiniecie nie bedzie istniec, poniewaz pierwszy wyraz rozwiniecia, czyli k jest rowny 1, a wyrazow musi byc calkowita i skonczona ilosc
    disp('Podales liczbe mniejsza od 1 lub liczbe ktora nie jest calkowita, przerywam program!');
    return;
end

k = 1; % Pierwszy element zgodnie ze wzorem jest rowny 1
w = 0; % Zeruje zmienna przechowujaca wynik
a = k:n; % Program bedzie isc od k = 1 do n wskazanego przez uzytkownika
w = ((- 1) .^ (a - 1) .* ((x) .^ (2 .* a - 1) ./ silnia(2 .* a - 1))); % Wzor na szereg Taylora z podanymi zmiennymi oraz uzywajacy funkcji silnia napisanej przeze mnie w osobnym pliku funkcji
przyblizenie = sum(w) % Definiuje zmienna przyblizenie, ktora jest suma wszystkich wyrazow szeregu, a wiec przyblizeniem Taylora dla sin(x)
rzeczywista = sin(x) % Definiuje zmienna rzeczywista, by porownac wartosc realna sin(x)
