function fftdemo

% Prosty przykladowy program, ktorego celem jest pokazanie jak transformata 
% Fouriera moze zostac zaimplementowana w praktyce w matlabie. Ten przyklad 
% jest modyfikacja przykladowego programu zamieszczonego na 
% stronie-samouczku matlaba.

% Tomasz Targiel
% Lista 5
% Zadanie 1 i 2

Fs = 1000;            % Probkowanie czestotliwosci
delta_t = 1/Fs;       % Czas pomiedzy kazdym probkowaniem
N = 1024;             % Ilosc probek
t = (0:N-1)*delta_t;  % Rownanie opisujace czas

% Stworz sztuczny sygnal jako sume sinusa 50 Hz, cosinusa 120 Hz oraz
% sygnalu o losowej czestotliwosci:
x1 = 0.7*sin(2*pi*50*t) + cos(2*pi*120*t);
x2 = 0.5*sin(2*pi*60*t) + cos(2*pi*60*t);
x3 = 0.3*sin(2*pi*70*t) + cos(2*pi*30*t);
x4 = 0.1*sin(2*pi*80*t) + cos(2*pi*10*t);
x5 = 0.9*sin(2*pi*10*t) + cos(2*pi*20*t);
x6 = 0.2137*sin(2*pi*20*t) + cos(2*pi*90*t);
x = x1 + x2 + x3 + x4 + x5 + x6 + 1.2*randn(size(t));

plot(Fs*t,x)         % Narysuj wykres przedstawiony w zaleznosci od zmiennej czasu
title('Sygnal w zaleznosci od czasu')
xlabel('czas (ms)')

X = fft(x,N)/N;      % Szybka Transformata Fouriera

freqv = (Fs/2)*linspace(0,1,N/2);  % Zakres czestotliwosci   

% Narysuj wykres wartosci bezwglednej skladowych czestotliwosci w
% zaleznosci od zmiennej czestotliwosci. Nakresl tylko czestotliwosci do
% polowy czestotliwosci probkowania (porzuc czesc zlozenia).
figure;              % Unika nadpisywania poprzedniego wykresu
plot(freqv,2*abs(X(1:N/2))) % Rysuje tylko polowe spektrum
title('Wartosc bezwzgledna skladowych czestotliwosci w zaleznosci od czestotliwosci')
xlabel('Czestotliwosc (Hz)')
ylabel('|X(czestotliwosc)|')

