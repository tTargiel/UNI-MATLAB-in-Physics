% Tomasz Targiel
% Lista 9
% Zadanie 1

% Funkcja obliczajaca bieg promienia padajacego na plaszczyzne pod
% nachyleniem u, na wysokosci y, biegnacego z osrodka o wsp. zalamania n

function result = ray(y, u, n, x)
t = asin(n * sin(atan(u)));
result = (x - 2) * tan(t) + y;
end
