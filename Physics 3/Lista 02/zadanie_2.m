% Tomasz Targiel
% Lista 2
% Zadanie 2

% Skrypt tworzy wizualizacje 3D linii pola magnetycznego wokol
% nieskonczonego, prostego przewodnika z pradem stalym.

% Deklaruje wsp. poczatkowe i koncowe
x0 = 1;
y0 = 1;
z0 = 1;
zk = 5;
r = 1; % Promien okregu
I = 1; % Natezenie pradu
mi0 = 4 * pi * 10^(-7); % Przenikalnosc magnetyczna
for n = 1:15 % Dla 15 roznych promieni wykonuje petle
    B = (mi0 * I) / (2 * pi * (r - n)); % Wzor na indukcje magnetyczna w punkcie odleglym o r - n
    % Rysuje trzy okregi (rozniace sie od siebie wspolrzednymi z
    okrag(x0, y0, z0, B, "red")
    okrag(x0, y0, z0+2, B, "red")
    okrag(x0, y0, z0+4, B, "red")
    hold on % Pozwalam na rysowanie okregow w kolejnej iteracji petli
end
plot3([x0, x0], [y0, y0], [z0, zk], "blue") % Rysuje przewodnik z pradem
title('Pole magnetyczne od nieskonczonego przewodnika') % Dopisuje tytul
% Wylaczam siatke oraz osie
grid off;
axis off;

