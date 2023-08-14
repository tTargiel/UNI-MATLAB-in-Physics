% Tomasz Targiel
% Lista 4
% Zadanie 1

clear; % Czyszcze workspace
clc; % Czyszcze command window

% Deklaruje zmienne do wzorow
A = 1;
omega_1 = 64;
omega_2 = [63, 61, 58, 63, 61, 58];

for n = 1:3
    t = linspace(0, 0.5, 10000);
    y_1 = A * sin(omega_1 * t);
    y_2 = A * sin(omega_2(n) * t);
    subplot(2, 3, n); % Generuje podzial na siatke 3x2 i aktywuje n-ty kwadrat
    plot(t, y_1, t, y_2); % Rysuje wykres zlozony z fal y_1 oraz y_2
    legend('fala1', 'fala2'); % Tworze legende wykresu
    xlabel('t');
    ylabel('y');
end

for n = 4:6
    if n == 4
        t = linspace(0, 5, 10000);
    else
        t = linspace(0, 2, 10000);
    end
    y_1 = A * sin(omega_1 * t);
    y_2 = A * sin(omega_2(n) * t);
    B = 2 * A * cos((omega_1 * t - omega_2(n) * t) / 2);
    subplot(2, 3, n); % Generuje podzial na siatke 3x2 i aktywuje n-ty kwadrat
    plot(t, y_1 + y_2, t, B, '-.'); % Rysuje wykres zlozony z sumy fal oraz ze zmiany amplitudy B(t)
    legend('suma fal', 'amplituda'); % Tworze legende wykresu
    xlabel('t');
    ylabel('y');
end
