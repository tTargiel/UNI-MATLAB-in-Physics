% Tomasz Targiel
% Lista 9
% Zadanie 1b

% Skrypt rysujacy rozklad natezenia pola elektrycznego na trzech podwykresach - dla odcinka poziomego, pionowego i umieszczonego pod katem
% Skrypt z racji ilosci danych potrzebuje troche czasu do pelnego wykonania sie

clear; % Czyszcze workspace
clc; % Czyszcze command window

a = 1; % Definiuje wartosc nieskonczenie malego elementu liniowego (bede go uzywac do dalszych obliczen)
dl = 0.001 * a; % Obliczam dlugosc odcinka

v = -0.825 * a: 0.15 * a : 0.975 * a; % Obliczam poczatki wektorow natezenia na osi x
u = -0.525 * a: 0.15 * a : 0.675 * a; % Obliczam poczatki wektorow natezenia na osi y

% Ustalam wymiary okna z wykresami
box = figure;
box.Position(3:4) = [768, 256];

for i = 1:3
    subplot(1, 3, i)
    if i == 1
        line([-a / 2, a / 2], [0, 0], 'Color', 'r'); % Rysuje odcinek na czerwono
        xline = -a / 2 : dl : a / 2; % Ustalam zakres osi x i zmieniam co jaka wartosc beda zaznaczone tickery osi
        yline = zeros (1, length (xline)); % Macierz zerowa z iloscia elementow adekwatna do xline
        title('Natezenie odcinka poziomego'); % Nazywam podwykres
    elseif i == 2
        line([0, 0], [-a / 2, a / 2], 'Color', 'r'); % Rysuje odcinek na czerwono
        xline = zeros (1, length (xline)); % Macierz zerowa z iloscia elementow adekwatna do xline
        yline = -a / 2 : dl : a / 2; % Ustalam zakres osi x i zmieniam co jaka wartosc beda zaznaczone tickery osi
        title('Natezenie odcinka pionowego'); % Nazywam podwykres
    elseif i == 3
        alpha = -25;
        line([-a / 2, a / 2] .* cosd(alpha), [-a / 2, a / 2] .* sind(alpha), 'Color', 'r'); % Rysuje odcinek na czerwono
        xline = cosd(alpha) .* (-a / 2 : dl : a / 2); % Dziele os x na odcinki sobie rowne (zachowujac przy tym zdefiniowany zakres)
        yline = sind(alpha) .* (-a / 2 : dl : a / 2); % Dziele os y na odcinki sobie rowne (zachowujac przy tym zdefiniowany zakres)
        title('Natezenie odcinka pod katem -25*'); % Nazywam podwykres
    end
    hold on;
    zadanie_1a(xline, yline); % Uzywam funkcji zdefiniowanej w podpunkcie a do rysowania danego podwykresu
    axis equal
    hold off;
end

% Pozyskuje wymiary ekranu, aby pozniej na ich podstawie przeskalowac i wycentrowac okno
scr_siz = get(0, 'ScreenSize');
set(gcf, 'Position', [(scr_siz(3) - scr_siz(3) * 0.75) / 2, (scr_siz(4) - scr_siz(4) * 0.5) / 2, scr_siz(3) * 0.75, scr_siz(4) * 0.5])
