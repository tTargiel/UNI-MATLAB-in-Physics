% Tomasz Targiel
% Lista 4
% Zadanie 1

% Skrypt rysuje przekroj cylindrycznego przewodnika z wykorzystaniem funkcji quiver

clear;
clc;

a = 0.005; % Promien przewodnika
I = 1; % Natezenie pradu
mi0 = 4 * pi * 10^(-7); % Przenikalnosc magnetyczna
r = linspace(0, 0.007, 50); % Limit wektorow
phi = linspace(0, 2 * pi, 50); % Definiuje kat
[X, Y] = meshgrid(r, phi) % Tworze siatke
[x, y, z] = cyl2Car(X, Y,0)

for i = 1:50 % Od 1 do wszystkich wartosci tablicy X
    for j = 1:50
    if r(j) < a
        Bx(i, j) = (mi0 * I / 2 * pi) * (-y(i, j) / a .^ 2); % Wzor na indukcje magnetyczna dla r < a
        By(i, j) = (mi0 * I / 2 * pi) * (x(i, j) / a .^ 2); % Wzor na indukcje magnetyczna dla r < a
    else
        Bx(i, j) = (mi0 * I / 2 * pi) * (-y(i, j) / r(j) .^ 2); % Wzor na indukcje magnetyczna dla r >= a
        By(i, j) = (mi0 * I / 2 * pi) * (x(i, j) / r(j) .^ 2); % Wzor na indukcje magnetyczna dla r >= a
    end
    end
end
hold on;
axis equal;
quiver(x, y, Bx, By, 'b'); % Rysowanie wektora
x = a * cos(phi);
y = a * sin(phi);
plot(x, y, 'red', 'LineWidth', 2);
hold off;
title("Pole magnetyczne cylindrycznego przewodnika (przekroj)"); % Nadaje tytul
xlabel("x [mm]"); % Nadaje tytul osi x
ylabel("y [mm]"); % Nadaje tytul osi y

