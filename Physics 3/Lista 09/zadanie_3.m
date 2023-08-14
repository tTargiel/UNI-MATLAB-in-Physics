% Tomasz Targiel
% Lista 9
% Zadanie 3

% Program tworzy wykres biegu wielu rownoleglych promieni padajacych na
% soczewke o promieniu 20, grubosci 2 i wsp. zalamania 1.51

clear;
clc;

% Dane
k = 0.01;
o = 5; % Szczelina
promien = 11; % Ilosc promieni

n = 1.51; % Wspolczynnik zalamania
r = 20; % Promien soczewki
d = 2; % Grubosc soczewki

% Obliczenia
dy = (2 * o + 1) / promien;
y = - o : dy : o;
moc = (n - 1) / r; % Moc soczewki
f = 1 / moc;
zmax = floor(f + .1 * f); % Maks osi z
z_przod = 0 : k : d - k; % Os tylna plaszczyzny powierzchni
z_tyl = d : k: zmax - k; % Os przodu plaszczyzny powierzchni
z_optyka = [z_przod, z_tyl];
wynik = zeros(length(y), length(z_optyka));
przod_soczewki = sqrt(r ^ 2 - (z_przod - r) .^ 2);

for i = 1:length(y)
    % Zalamanie na powierzchni sferycznej
    [promien_soczewki, x_soczewki, nachylenie] = sphere(y(i), r, d, n, k);
    % Zalamanie na plaskiej powierzchni
    promien_powietrze = ray(promien_soczewki(end), nachylenie, n, z_tyl);
    % Promien przychodzacy
    x_przod_powietrze = 0 : k : x_soczewki(1) - k;
    promien_przod_powietrze = y(i) * ones(1, length(x_przod_powietrze));
    % Utworz macierz promieni (w razie potrzeby dostosuj dlugosc)
    if length(promien_soczewki) + length(promien_powietrze) + length(x_przod_powietrze) <= length(z_optyka)
        wynik(i, :) = [promien_przod_powietrze, promien_soczewki, promien_powietrze];
    else
        wynik(i, :) = [promien_przod_powietrze, promien_soczewki(1 : length(promien_soczewki) - 1), promien_powietrze];
    end
end

% Wykres
plot(z_optyka, wynik', 'r'); % Promienie
hold on;
line([d d], [max(przod_soczewki) - max(przod_soczewki)], 'color', 'b'); % Tylna powierzchnia obiektywu
plot(z_przod, przod_soczewki, 'b', z_przod, - przod_soczewki, 'b'); % Przednia powierzchnia obiektywu
plot(z_optyka, zeros(1, length(z_optyka)), 'k--'); % Os optyczna
grid on;
xlim([0 43])
ylim([- 9 9])
title('Wykres biegu rownoleglych promieni padajacych na soczewke');
hold off;
