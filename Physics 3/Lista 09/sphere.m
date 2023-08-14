% Tomasz Targiel
% Lista 9
% Zadanie 2

% Funkcja wyliczajaca bieg promienia po zalamaniu na sferycznej powierzchni

function [u, y_, j] = sphere(y, r, d, n, k)
t = r - sqrt(r ^ 2 - y ^ 2); % Soczewka na y
y_ = t : k : d;
s = y / r;
j = tan(asin(s / n) - asin(s));
u = j * (y_ - t) + y;
end
