function [y] = sin_series(x, n)
% SIN_SERIES: oblicza wartosc sin(x) z rozwiniecia w szereg Taylora
% Uzywa do tego petli for
% Przyjmuje argumenty x oraz n, a jego zmienna wynikowa to y
% Skladnia polecenia wyglada nastepujaco: [y] = sin_series(x, n)

% Tomasz Targiel
% Lista 1
% Zadanie 3

k = 1; % Pierwszy element zgodnie ze wzorem jest rowny 1
y = 0; % Zeruje zmienna wynikowa

if nargin < 2 && ~ isempty(x) % Jezeli do polecenia zostanie dostarczony tylko argument x, to n zostanie domyslnie ustawione na 10
    n = 10;
end

if n > 0 && mod(n, 1) == 0 % Sprawdzam czy n jest wieksze od zera i czy jest liczba calkowita (z uzyciem modulo)
    for a = k:n % Program bedzie isc od k = 1 do n wskazanego w argumencie
        y = y + ((- 1) ^ (a - 1) * ((x) ^ (2 * a - 1) / silnia(2 * a - 1))); % Wzor na szereg Taylora z zassanymi argumentami jako zmiennymi oraz uzywajacy funkcji silnia napisanej przeze mnie w osobnym pliku funkcji
    end
else
    disp('Jako n podales liczbe mniejsza od 1 lub liczbe ktora nie jest calkowita, przerywam program!');
    return;
end

w = (1 - y / sin(x)) * 100; % Licze blad y wyrazony w procentach w porownaniu z wartoscia sin(x)
format short; % Niech program wyswietla mniej cyfr po przecinku

if abs(w) > 0.000001 % Jezeli wartosc bezwzgledna bledu jest wieksza od 1 milionowej procenta to zakladam ze przyblizenie a wartosc realna sa sobie rowne
    err = w + ' %'
end

format long; % Niech program wyswietla wiecej cyfr po przecinku
end
