function [wektorSily] = Coulomb(q1, p1, q2, p2)
% COULOMB: ta funkcja oblicza sile dzialajaca miedzy dwoma ladunkami
% Skladnia funkcji wyglada nastepujaco: [wektorSily] = Coulomb(q1, p1, q2, p2)
% Gdzie: q1 - wartosc pierwszego ladunku, p1 - polozenie pierwszego ladunku, q2 - wartosc drugiego ladunku, p2 - polozenie drugiego ladunku

% Tomasz Targiel
% Lista 6
% Zadanie 1

rx = p2(1) - p1(1); % Wyliczam odleglosc (promien - we wzorze) dla wartosci x-owej obu polozen
ry = p2(2) - p1(2); % Wyliczam odleglosc (promien - we wzorze) dla wartosci y-owej obu polozen
rz = p2(3) - p1(3); % Wyliczam odleglosc (promien - we wzorze) dla wartosci z-owej obu polozen

k = 9 * 10 ^ 9; % Deklaruje wartosc stalej elektrostatycznej

dlugoscWektora = sqrt(rx^2 + ry^2 + rz^2); % Obliczam dlugosc wektora

wektorSily = k * q1 * q2 * ((p2 - p1) ./ dlugoscWektora^3); % Sila dzialajaca na ladunek - nie trzeba uzywac petli, dla x y z dzialanie wykona sie niezaleznie
end
