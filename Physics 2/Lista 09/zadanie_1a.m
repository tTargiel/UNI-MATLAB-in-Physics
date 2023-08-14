% Tomasz Targiel
% Lista 9
% Zadanie 1a

% Skrypt rysujacy rozklad natezenia pola elektrycznego wokol naladowanego odcinka

function [Etotx, Etoty] = zadanie_1a(xline, yline) % Tworze funkcje przyjmujaca xline oraz yline jako argumenty (wykorzystam ja w ten sposob w podpunkcie b)

Q = 1; % Definiuje wartosc ladunku
a = 1; % Definiuje wartosc nieskonczenie malego elementu liniowego (bede go uzywac do dalszych obliczen)
EPS0 = 8.8541 * 10 ^ (-12); % Definiuje wartosc przenikalnosci elektrycznej

rho = Q / a; % Obliczam gestosc ladunku
dl = 0.001 * a; % Obliczam dlugosc odcinka
% xline = -a / 2 : dl : a / 2; % Ustalam zakres osi x i zmieniam co jaka wartosc beda zaznaczone tickery osi
% yline = zeros (1, length (xline)); % Macierz zerowa z iloscia elementow adekwatna do xline

v = -0.825 * a: 0.15 * a : 0.975 * a; % Obliczam poczatki wektorow natezenia na osi x
u = -0.525 * a: 0.15 * a : 0.675 * a; % Obliczam poczatki wektorow natezenia na osi y
[x, y] = meshgrid(v, u); % Tworze siatke ze wspolrzednymi poczatkow wektorow
[M, N] = size(x); % Pobieram wymiary do zmiennych M i N

for i = 1 : M
    for j = 1 : N
        for t = 1 : length(xline)
            r(i, j, t, :) = [x(i, j) - xline(t), y(i, j) - yline(t)]; % Obliczam skladowe wektorow natezenia
            rabs(i, j, t) = wektorDlug(r(i, j, t, :)); % Definiuje dlugosc wektora z uzyciem funkcji wektorDlug
            runit(i, j, t, :) = r(i, j, t, :) / rabs(i, j, t); % Obliczam natezenia
            E(i, j, t, :) = rho * dl * runit(i, j, t, :) / (4 * pi * EPS0 * rabs(i, j, t) ^ 2); % Obliczam linie sil pola elektrycznego z uzyciem wczesniej obliczonych natezen
        end;
        Etotx(i, j) = sum(E(i, j, :, 1)); % Wyznaczam wspolrzedne konca wektorow natezenia na osi x
        Etoty(i, j) = sum(E(i, j, :, 2)); % Wyznaczam wspolrzedne konca wektorow natezenia na osi y
    end;
end;
% line([-a / 2, a / 2], [0, 0], 'Color', 'r'); % Rysuje odcinek na czerwono
hold on;
quiver(v, u, Etotx, Etoty); % Rysuje wykres z uzyciem funkcji quiver
hold off;

% Nazywam wykres oraz osie
% title('Natezenie pola elektrycznego');
xlabel('x[m]');
ylabel('y[m]');
end
