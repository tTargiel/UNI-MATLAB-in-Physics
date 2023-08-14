% Tomasz Targiel
% Lista 10
% Zadanie 1 (Polecenie 2)

% Skrypt rysujacy rozklad potencjalu dla dowolnego ukladu 3 ladunkow

% Wzory:
% V = Ep/q = kQ/r
% r = sqrt(x^2+y^2)

clear all;
close all;

% Definiuje ladunek 1
Q1 = 20;
x1 = 0;
y1 = 0;

% Definiuje ladunek 2
Q2 = 20;
x2 = 4;
y2 = 0;

% Definiuje ladunek 3
Q3 = -20;
x3 = 2;
y3 = 4;

[x, y] = meshgrid(-10:1:10, -10:1:10);

% Wedlug wzorow na gorze:
% Wyliczam r1 i V1:
r1 = sqrt((x1 - x) .^ 2 + (y1 - y) .^ 2);
V1 = 9 .* 10 .^ 9 .* Q1 ./ r1;

% Wyliczam r2 i V2:
r2 = sqrt((x2 - x) .^ 2 + (y2 - y) .^ 2);
V2 = 9 .* 10 .^ 9 .* Q2 ./ r2;

% Wyliczam r3 i V3:
r3 = sqrt((x3 - x) .^ 2 + (y3 - y) .^ 2);
V3 = 9 .* 10 .^ 9 .* Q3 ./ r3;

% Potencjal V = V1 + V2 + V3
V = V1 + V2 + V3;

figure (1);
pcolor(x, y, V);
xlabel('x (m)');
ylabel('y (m)');
title('Potencjal elektrostatyczny ukladu 3 ladunkow');
shading interp;
colorbar;

figure(2);
contour(x, y, V, 'linewidth', 3);
xlabel('x (m)');
ylabel('y (m)');
title('Linie ekwipotencjalne');
