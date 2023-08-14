% Tomasz Targiel
% Lista 10
% Zadanie 2

% Program wylicza zmiane dlugosci mostow przy zadanej temperaturze
% Zakladamy, ze mosty wykonane sa calkowicie ze stali

clear;
clc;

a_s = 0.12 * 10 ^ (-4); % Stal

% Dlugosci mostow [m] w temp 20 st. C
l_ms = 375; % Most Solidarnosci w Plocku
l_mk = 16900; % Most Krymski
l_md = 164800; % Wielki Most Danyang-Kunshan

t_0 = 20;

% Skrajne wartosci temperatury
t_max = 60;
t_min = -40;

run = true;
while run
    t = input('\nWprowadz temperature z zakresu -40 do 60 st. Celsjusza: '); % Pobieram wartosc temperatury
 
    if isnumeric(t) || isfloat(t) % Sprawdzenie czy podana wartosc jest wartoscia liczbowa
        if t <= t_max && t >= t_min % Sprawdza czy wartosc jest w zdefiniowanym zakresie
            fprintf('\nObliczone zmiany dlugosci mostow w temp. %f st. Celsjusza:\n', t)
         
            l_ms_n = l_ms .* (1 + a_s * (t - t_0)); % Most Solidarnosci w Plocku
            fprintf('\nMost Solidarnosci: %f m', l_ms_n - l_ms);
         
            l_mk_n = l_mk .* (1 + a_s * (t - t_0)); % Most Krymski
            fprintf("\nMost Krymski: %f m", l_mk_n - l_mk);
         
            l_md_n = l_md .* (1 + a_s * (t - t_0)); % Wielki Most Danyang-Kunshan
            fprintf("\nWielki Most Danyang-Kunshan: %f m\n", l_md_n - l_md);
         
            repeat = true; % Dzieki tej zmiennej wyswietlam komunikat o ponownym uruchomieniu programu
        else
            disp("Wartosc poza zakresem")
            repeat = false;
        end
    else
        disp("Wartosc nie jest liczba")
        repeat = false;
    end
 
    if repeat
        repeat_input = input('\nJeszcze raz? [T/n] ', 's');
        if repeat_input == "n" || repeat_input == "N"
            run = false; % Zmienia zmienna run co konczy petle while i konczy dzialanie programu
        end
    end
end
