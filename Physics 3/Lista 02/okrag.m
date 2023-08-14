% Tomasz Targiel
% Lista 2
% Zadanie 1

function [rys] = okrag(x0, y0, z0, r, kolor)
% okrag(x0, y0, z0, r, kolor) Jako argumenty przyjmuje wspolrzedne srodka
% okregu, jego promien oraz kolor
% Generuje rysunek okregu o zadanym promieniu i kolorze w 3D
fi = 0:pi/50:2*pi; % Zakres od zera do 2 pi, co 1/50 pi
for a = 1:length(fi) % Petla wykonujaca sie tyle razy jaka dlugosc wektora fi
    z(a) = z0; % Do zmiennej z przypisuje z0 w kazdej iteracji petli (stworzy to wektor wypelniony z0 na kazdej jego pozycji)
end
x = x0 + r * cos(fi);
y = y0 + r * sin(fi);
plot3(x, y, z, kolor) % Generuje wykres 3D z widocznym okregiem
end

