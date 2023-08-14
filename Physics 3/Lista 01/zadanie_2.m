% Tomasz Targiel
% Lista 1
% Zadanie 2

% Skrypt oblicza (korzystajac trzykrotnie z funkcji B_drut()) indukcje
% magnetyczna w punkcie P lezacym w czwartym wierzcholku kwadratu.

a = 0.05; % Dlugosc przewodnika
I = 0.01; % Natezenie pradu
B_drut(a, I, 0, 45) + B_drut(a, I, -45, 0) - B_drut(a * sqrt(2) / 2, I, -45, 45) % Uzywam trzykrotnie funkcji B_drut

