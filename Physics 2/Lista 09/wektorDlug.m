% Dlugosc wektora
% Funkcja, ktora oblicza dlugosc zadanego wektora
% (wektor kolumnowy lub rzedowy)

% Tomasz Targiel
% Lista 9

function mag = wektorDlug(wektor)
[m, n] = size(wektor)
if (m ~= 1) && (n ~= 1)
    mag = 0;
    disp('Blad - niewlasciwy rozmiar wektora');
else
    mag = sqrt(sum(wektor .^ 2));
end;
