function [x] = silnia(x)
% SILNIA: ta funkcja oblicza silnie dla dostarczonych argumentow
% Skladnia funkcji wyglada nastepujaco: [x] = silnia(x)

% Tomasz Targiel
% Lista 1
% Zadanie 1

for i = 1:length(x) % Tworze petle for, ktora wykona sie tyle razy ile jest wyrazow wektora x(i)
    b = 1; % Definiuje pierwszy wyraz dla silni, tak by byl rowny 1
    for j = 1:x(i) % Tworze petle for, ktora wykona sie tyle razy jaka jest wartosc danego wyrazu i wektora x(i)
        b = b * j; % Licze silnie kazdego wyrazu wektora x(i)
    end
    x(i) = b; % Podmieniam wyrazy w wektorze x(i) na silnie poszczegolnych wyrazow
end
end
