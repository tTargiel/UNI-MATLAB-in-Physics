% Tomasz Targiel
% Lista 6
% Zadanie 2

clear; % Czyszcze workspace
clc; % Czyszcze command window

% Deklaruje zmienne odpowiedzialne za wartosci ladunkow
q1 = 1;
q2 = -2;
q3 = 3.2;

% Deklaruje zmienne odpowiedzialne za polozenia ladunkow
p1 = [1, 0, 0];
p2 = [0, 1, 0];
p3 = [0, 0, 1];

% Podaje ladunki i polozenia funkcji napisanej w zadaniu 1, dodatkowo dziele te wartosci przez 10^10, by widziec na wykresie 3D ich odleglosci i punkty zaczepienia
sila_p1p2 = Coulomb(q1, p1, q2, p2) / 10^10;
% sila_p2p1 = Coulomb(q2, p2, q1, p1) / 10^10;
sila_p1p3 = Coulomb(q1, p1, q3, p3) / 10^10;
% sila_p3p1 = Coulomb(q3, p3, q1, p1) / 10^10;

% Obliczam wspolrzedne sily wypadkowej a nastepnie obliczam jej wartosc
silaWypadkowa = [sila_p1p2(1) + sila_p1p3(1), sila_p1p2(2) + sila_p1p3(2), sila_p1p2(3) + sila_p1p3(3)];
wartoscWypadkowa = sqrt(silaWypadkowa(1)^2 + silaWypadkowa(2)^2 + silaWypadkowa(3)^2);

% Na wykresie trojwymiarowym plot3 zaznaczam polozenia ladunkow (zaznaczam znakiem O o rozmiarze 10 i kolorach rgb
plot3(p1(1), p1(2), p1(3), 'or', 'MarkerSize', 10, 'MarkerFaceColor', 'r')
hold on
plot3(p2(1), p2(2), p2(3), 'og', 'MarkerSize', 10, 'MarkerFaceColor', 'g')
plot3(p3(1), p3(2), p3(3), 'ob', 'MarkerSize', 10, 'MarkerFaceColor', 'b')

% Na wykresie trojwymiarowym quiver3 zaznaczam wspolrzedne sil dzialajacych na ladunek q1 (zaznaczam kolorami korespondujacymi z kolorami zaznaczonych ladunkow, szerokosc linii 2)
quiver3(p1(1), p1(2), p1(3), sila_p1p2(1), sila_p1p2(2), sila_p1p2(3), 'g', 'LineWidth', 2)
hold on
% quiver3(p2(1), p2(2), p2(3), sila_p2p1(1), sila_p2p1(2), sila_p2p1(3), 'g', 'LineWidth', 2)
quiver3(p1(1), p1(2), p1(3), sila_p1p3(1), sila_p1p3(2), sila_p1p3(3), 'b', 'LineWidth', 2)
% quiver3(p3(1), p3(2), p3(3), sila_p3p1(1), sila_p3p1(2), sila_p3p1(3), 'b', 'LineWidth', 2)
quiver3(p1(1), p1(2), p1(3), silaWypadkowa(1), silaWypadkowa(2), silaWypadkowa(3), 'k', 'LineWidth', 2)

% Ustawiam nazwy osi, legende oraz podpisuje sily
xlabel('X', 'Rotation', 16)
ylabel('Y', 'Rotation', -32)
zlabel('Z')
legend('q1 = 1 μC','q2 = -2 μC','q3 = 3.2 μC')
text(0.05, 0, 0.95, 'F(q2->q1)')
text(1.5, -0.55, 0.05, 'F(q3->q1)')
text(0.65, -0.6, 0.95, strcat('Fw = ', num2str(wartoscWypadkowa), ' * 10^1^0 N'))
