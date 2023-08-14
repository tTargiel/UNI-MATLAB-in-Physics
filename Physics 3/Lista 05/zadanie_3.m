% Tomasz Targiel
% Lista 5
% Zadanie 3

% Ten program czyta dane z podanego mu pliku dzwiekowego a nastepnie
% wylicza Transformate Fouriera i rysuje na jej podstawie wykres

clear;
clc;

N = 2 ^ 14; % Ilosc probek
nstart = 1; % Numer pierwszego elementu
nend = N; % Numer ostatniego elementu
Fs = 44100; % Probkowanie czestotliwosci
delta_t = 1 / Fs; % Czas pomiedzy kazdym probkowaniem
t = (0:N - 1) * delta_t; % Rownanie opisujace czas
freqv = (Fs / 2) * linspace(0, 1, N / 2); % Zakres czestotliwosci
s = ["flute.wav", "piano.wav", "piccolo.wav"]; % Nazwa pliku (musi sie on znajdowac w aktywnym folderze roboczym)

for k = 1 : 3
    subplot(2, 3, k);
    [f] = audioread(s(k), [nstart nend]);
    g = f(:, 1); % Z dzwieku stereo wybierz tylko jeden kanal by uzyskac mono

    plot(Fs * t, g) % Narysuj wykres przedstawiony w zaleznosci od zmiennej czasu
    title(compose("Sygnal w zaleznosci od czasu - %s", s(k)))
    xlabel("czas (ms)")

    X = (1.0 / N) * fft(g); % Szybka Transformata Fouriera sygnalu dzwiekowego
    
    % Narysuj wykres wartosci bezwglednej skladowych czestotliwosci w
    % zaleznosci od zmiennej czestotliwosci. Nakresl tylko czestotliwosci do
    % polowy czestotliwosci probkowania (porzuc czesc zlozenia).
    subplot(2, 3, k+3);
    plot(freqv, 2 * abs(X(1:N / 2))) % Rysuje tylko polowe spektrum
    title(compose("Wartosc bezwzgledna czestotliwosci - %s", s(k)))
    xlabel("Czestotliwosc (Hz)")
    ylabel("|X(czestotliwosc)|")
end

% Pozyskuje wymiary ekranu, aby pozniej na ich podstawie przeskalowac okno (do trybu fullscreen)
scr_siz = get(0, 'ScreenSize');
set(gcf, 'Position', [0, 0, scr_siz(3), scr_siz(4)])

