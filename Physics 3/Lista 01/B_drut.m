% Tomasz Targiel
% Lista 1
% Zadanie 1

function [B] = B_drut(d, I, theta2, theta1)
% B_drut(d,I,theta2,theta1) Jako argumenty przyjmuje prosta normalna, natezenie pradu, kat theta2 oraz kat theta1
% Oblicza indukcje magnetyczna pochodzaca od skonczonego, prostego przewodnika
% o zadanej dlugosci, przez ktory plynie staly prad o stalym natezeniu.
mi0 = 4 * pi * 10^(-7); % Przenikalnosc magnetyczna
B = ((mi0 * I) / (4 * pi * d)) * (sind(theta2) - sind(theta1)); % Wzor na indukcje magnetyczna
end

