% Tomasz Targiel
% Lista 7
% Zadanie 1

clear; % Czyszcze workspace
clc; % Czyszcze command window

Q = 1 * 10 ^ (-9); % Wartosc ladunkow (wszystkie maja taka sama)
a = 10 * 10 ^ (-3); % Dlugosc boku
H = (a * sqrt(6)) / 3; % Wysokosc czworoscianu
h = (a * sqrt(3)) / 2; % Wysokosc w trojkacie rownobocznym
R = (2 / 3) * h; % Promien wielki trojkata rownobocznego
r = (1 / 3) * h; % Promien maly trojkata rownobocznego

% Deklaruje zmienne odpowiedzialne za polozenia ladunkow
p1 = [-a / 2, -r, 0];
p2 = [a / 2, -r, 0];
p3 = [0, R, 0];
p4 = [0, 0, H];

% Deklaruje zmienne odpowiedzialne za pozyskiwanie wspolrzednych polozen
linia1 = [p1; p4];
linia2 = [p2; p4];
linia3 = [p3; p4];

% Wyliczam sily dzialajace na ladunki oraz sile wypadkowa, dodatkowo przeskalowuje je aby lepiej je widziec na wykresie (tak by wygladaly jak ilustracja na liscie zadan)
sila_p1p4 = Coulomb(Q, p1, Q, p4) * 10 ^ (1.7);
sila_p2p4 = Coulomb(Q, p2, Q, p4) * 10 ^ (1.7);
sila_p3p4 = Coulomb(Q, p3, Q, p4) * 10 ^ (1.7);
silaWypadkowa = [sila_p1p4(1) + sila_p2p4(1) + sila_p3p4(1), sila_p1p4(2) + sila_p2p4(2) + sila_p3p4(2), sila_p1p4(3) + sila_p2p4(3) + sila_p3p4(3)];

% Wypisuje do command window wartosci sil
[x, wartoscSily1] = Coulomb(Q, p1, Q, p4); wartoscSily1
[x, wartoscSily2] = Coulomb(Q, p2, Q, p4); wartoscSily2
[x, wartoscSily3] = Coulomb(Q, p3, Q, p4); wartoscSily3
wartoscWypadkowa = sqrt(silaWypadkowa(1)^2 + silaWypadkowa(2)^2 + silaWypadkowa(3)^2)

% Na wykresie trojwymiarowym plot3 zaznaczam polozenia ladunkow (zaznaczam znakiem O o rozmiarze 12 i kolorach takich jak na ilustracji na liscie
plot3(p1(1), p1(2), p1(3), 'ob', 'MarkerSize', 12, 'MarkerFaceColor', 'b')
hold all
plot3(p2(1), p2(2), p2(3), 'ob', 'MarkerSize', 12, 'MarkerFaceColor', 'b')
plot3(p3(1), p3(2), p3(3), 'ob', 'MarkerSize', 12, 'MarkerFaceColor', 'b')
plot3(p4(1), p4(2), p4(3), 'ob', 'MarkerSize', 12, 'MarkerFaceColor', 'r')

% Lacze punkty 1-4, 2-4, 3-4 niebieska, kropkowana linia o szerokosci 1.5
line(linia1(:, 1), linia1(:, 2), linia1(:, 3), 'LineStyle', ':', 'LineWidth', 1.5)
line(linia2(:, 1), linia2(:, 2), linia2(:, 3), 'LineStyle', ':', 'LineWidth', 1.5)
line(linia3(:, 1), linia3(:, 2), linia3(:, 3), 'LineStyle', ':', 'LineWidth', 1.5)

% Na wykresie trojwymiarowym quiver3 zaznaczam wspolrzedne sil dzialajacych na ladunek q4 (zaznaczam kolorem niebieskim, a sile wypadkowa czerwonym)
quiver3(p4(1), p4(2), p4(3), sila_p1p4(1), sila_p1p4(2), sila_p1p4(3), 'b', 'LineWidth', 2)
quiver3(p4(1), p4(2), p4(3), sila_p2p4(1), sila_p2p4(2), sila_p2p4(3), 'b', 'LineWidth', 2)
quiver3(p4(1), p4(2), p4(3), sila_p3p4(1), sila_p3p4(2), sila_p3p4(3), 'b', 'LineWidth', 2)
quiver3(p4(1), p4(2), p4(3), silaWypadkowa(1), silaWypadkowa(2), silaWypadkowa(3), 'r', 'LineWidth', 2)

% Ustawiam nazwy osi, wlaczam rysowanie siatki (kropkowanej) oraz podpisuje sile wypadkowa tak jak byla podpisana na liscie zadan
xlabel('x[m]')
ylabel('y[m]')
zlabel('z[m]')
grid on
set(gca, 'GridLineStyle', ':', 'LineWidth', 1.5)
text(silaWypadkowa(1), silaWypadkowa(2), 0.014, 'Total electric force', 'Color', 'r')

% Pozyskuje wymiary ekranu, aby pozniej na ich podstawie przeskalowac okno i obrocic wykres tak jak jest widoczny na liscie
scr_siz = get(0, 'ScreenSize');
set(gcf, 'Position', [scr_siz(4) / 2, scr_siz(4) / 2, scr_siz(3) * 0.25, scr_siz(4) * 0.6])
view([-36 5])
