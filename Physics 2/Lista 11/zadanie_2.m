% Tomasz Targiel
% Lista 11
% Zadanie 2

% Ladunek poruszajacy sie w trojwymiarowym polu magnetycznym

clear all;
close all;

Qe = -1.602176487; % Definiuje wartosc ladunku elektronu
me = 9.103; % Definiuje mase elektronu
V = [3 4 1]; % Definiuje poczatkowa predkosc elektronu
B = [0 0 -12]; % Definiuje wartosc indukcji pola magnetycznego
r0 = [5 0 0]; % Definiuje poczatkowe polozenie ladunku

% Obliczam rownolegla do indukcji B szybkosc elektronu oraz szybkosc prostopadla do B
V_rown = (dot(V, B) / norm(B)) * (B / norm(B));
v_prost = V - V_rown;

 % Definiuje odleglosc ladunku na podstawie jego parametrow
r = me * (norm(v_prost)) / (Qe * norm(B));

theta = atan(v_prost(2) / v_prost(1)) + pi / 2;
xc = r0(1) + r * cos(theta);
yc = r0(2) + r * sin(theta);
w = norm(v_prost) / r;

figure
drawTrzy(2, 2); % Rysuje pole magnetyczne oraz jego srodek
axis off; % Wylaczam wyswietlanie osi

% Definiuje zakresy osi x, y oraz z
plot3(2 : 0.1 : 10, 0, 0);
hold on
plot3(0, -4 : 0.1 : 2, 0);
plot3(1, 0, 0 : 0.1 : 10);
zlim([1 10]);

t = 0; % Ustawiam zmienna czasu na zero
dt = 0.05; % Ustawiam krok czasu
for n = 1 : 200
    % Deklaruje zmienne odpowiedzialne za wspolrzedne punktu w ktorym znajduje sie elektron
    x = xc + r * cos(w .* t + pi + theta);
    y = yc + r * sin(w .* t + pi + theta);
    z = V_rown * t;
    
    plot3(x, y, z, 'ro', 'MarkerFaceColor', 'r'); % Rysuje trojwymiarowy wykres, a na nim coraz to kolejne punkty polozenia elektronu
    hold on
    t = t + dt;
    pause(0.01)
end
