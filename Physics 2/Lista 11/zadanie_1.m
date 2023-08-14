% Tomasz Targiel
% Lista 11
% Zadanie 1

% Ladunek poruszajacy sie w polu magnetycznym

clear all;
close all;

Qe = -1.602176487 * 10 ^ (-19); % Definiuje wartosc ladunku elektronu
me = 9.103 * 10 ^ (-28); % Definiuje mase elektronu
B = 0.01; % Definiuje wartosc indukcji pola magnetycznego
V = 10 ^ 5; % Definiuje predkosc ladunku
R = abs(me * V / (Qe * B)); % Definiuje odleglosc ladunku na podstawie jego parametrow
dtheta = 0.01 * pi; % Definiuje kat o jaki bedzie sie przesuwal ladunek
dl = R * dtheta; % Obliczam dlugosc katowa dla ladunku
l = -1.5 * R : dl : 0; % Ustalam dlugosc toru poziomego dla ladunku

title('Elektron w jednorodnym polu magnetycznym'); % Nadaje tytul animacji
text(100, 100, 'B', 'FontSize', 12); % W punkcie o wsp. 100 100 ustawiam litere B jako informacja o indukcji pola magnetycznego

for k = 1 : length(l) % Dla polozenia ladunku przed wejsciem w pole magnetyczne
    draw(dl, R);
    plot(l(k), -R, 'ro', 'MarkerFaceColor', 'r'); % W punkcie o skladowych x i y rysuje czerwony punkt wskazujacy na polozenie ladunku
    scale = 0.25 * R / V; % Przeskalowuje wykres
    quiver(l(k), -R, real(V), imag(V), scale, 'Color', 'm'); % Kresle strzalke wektora
    axis equal; % Dopasowuje do siebie osi, by podzialka na nich byla sobie rowna
    ylim([-1.5 * R 1.5 * R]); xlim([-1.5 * R 1.5 * R]); % Deklaruje granice
    axis off; % Wylaczam wyswietlanie osi
    pause(0.05);
    M(k) = getframe;
end;

theta = -pi / 2 : dtheta : pi / 2;
for k = 1 : length(theta) % Dla polozenia ladunku w polu magnetycznym
    draw(dl, R);
    pos = R * exp(1i * theta(k)); % Do zmiennej pos pozyskuje aktualne wspolrzedne polozenia
    Vv = V * exp(1i * (pi / 2 + theta(k))); % Zmienna Vv jest odpowiedzialna za zwrot wektora ladunku w polu magnetycznym
    % Deklaruje skladowe polozenia
    x = real(pos);
    y = imag(pos);
    plot(x, y, 'ro', 'MarkerFaceColor', 'r'); % W punkcie o skladowych x i y rysuje czerwony punkt wskazujacy na polozenie ladunku
    scale = 0.25 * R / V; % Przeskalowuje wykres
    quiver(x, y, real(Vv), imag(Vv), scale, 'Color', 'm'); % Kresle pierwsza skladowa wektora (strzalke)
    quiver(x, y, -0.2 * x, -0.2 * y, 0, 'Color', 'k'); % Kresle druga skladowa wektora (strzalke)
    axis equal; % Dopasowuje do siebie osi, by podzialka na nich byla sobie rowna
    ylim([-1.5 * R 1.5 * R]); xlim([-1.5 * R 1.5 * R]); % Deklaruje granice
    axis off; % Wylaczam wyswietlanie osi
    pause(0.05);
    M(k + length(l)) = getframe;
end;

for k = 1 : length(l) % Dla polozenia ladunku po wyjsciu z pola magnetycznego
    draw(dl, R);
    plot(l(length(l) + 1 - k), R, 'ro', 'MarkerFaceColor', 'r'); % W punkcie o skladowych l(length(l) + 1 - k) oraz R rysuje czerwony punkt wskazujacy na polozenie ladunku
    scale = 0.25 * R / V; % Przeskalowuje wykres
    quiver(l(length(l) + 1 - k), R, -real(V), imag(V), scale, 'Color', 'm'); % Kresle strzalke wektora
    axis equal; % Dopasowuje do siebie osi, by podzialka na nich byla sobie rowna
    ylim([-1.5 * R 1.5 * R]); xlim([-1.5 * R 1.5 * R]); % Deklaruje granice
    axis off; % Wylaczam wyswietlanie osi
    pause(0.05);
    M(k + length(l) + length(theta)) = getframe;
end;
