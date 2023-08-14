% Tomasz Targiel
% Lista 8
% Zadanie 1

% Program tworzy wykres kata odchylenia δ od kata padania swiatla θ dla pryzmatu o zadanym kacie i wspolczynniku zalamania

clear;
clc;

% Szklo kron
n1k = 1.53; % Wspolczynnik zalamania 1 (lambda = 400 nm, swiatlo niebieskie)
n2k = 1.52; % Wspolczynnik zalamania 2 (lambda = 500 nm, swiatlo zielone)
n3k = 1.514; % Wspolczynnik zalamania 3 (lambda = 600 nm, swiatlo pomaranczowe)

% Akryl
n1a = 1.506; % Wspolczynnik zalamania 1 (lambda = 400 nm, swiatlo niebieskie)
n2a = 1.497; % Wspolczynnik zalamania 2 (lambda = 500 nm, swiatlo zielone)
n3a = 1.49; % Wspolczynnik zalamania 3 (lambda = 600 nm, swiatlo pomaranczowe)

% Szklo kwarcowe
n1kw = 1.47; % Wspolczynnik zalamania 1 (lambda = 400 nm, swiatlo niebieskie)
n2kw = 1.462; % Wspolczynnik zalamania 2 (lambda = 500 nm, swiatlo zielone)
n3kw = 1.459; % Wspolczynnik zalamania 3 (lambda = 600 nm, swiatlo pomaranczowe)

phi1 = 45;
phi2 = 40;
phi3 = 35;
alpha = linspace(0, pi/2);

epsilon1k = alpha + asin(sin(phi1) * sqrt(n1k.^2 - sin(alpha).^2) - sin(alpha) * cos(phi1)) - phi1;
epsilon2k = alpha + asin(sin(phi1) * sqrt(n2k.^2 - sin(alpha).^2) - sin(alpha) * cos(phi1)) - phi1;
epsilon3k = alpha + asin(sin(phi1) * sqrt(n3k.^2 - sin(alpha).^2) - sin(alpha) * cos(phi1)) - phi1;
epsilon1a = alpha + asin(sin(phi1) * sqrt(n1a.^2 - sin(alpha).^2) - sin(alpha) * cos(phi1)) - phi1;
epsilon1kw = alpha + asin(sin(phi1) * sqrt(n1kw.^2 - sin(alpha).^2) - sin(alpha) * cos(phi1)) - phi1;
epsilon1k2 = alpha + asin(sin(phi2) * sqrt(n1k.^2 - sin(alpha).^2) - sin(alpha) * cos(phi1)) - phi1;
epsilon1k3 = alpha + asin(sin(phi3) * sqrt(n1k.^2 - sin(alpha).^2) - sin(alpha) * cos(phi1)) - phi1;

figure(1)
subplot(3, 1, 1)
plot(alpha, epsilon1k, "b", alpha, epsilon1a, "g", alpha, epsilon1kw, 'MarkerFaceColor', "#EDB120")
title('Wykres δ(θ) dla kilku barw swiatla dla pryzmatu ze szkla kron')
xlabel('Kat odchylenia δ')
ylabel('Kat padania θ')

subplot(3, 1, 2)
plot(alpha, epsilon1k, "b", alpha, epsilon2k, "g", alpha, epsilon3k, 'MarkerFaceColor', "#EDB120")
title('Wykres δ(θ) dla 3 roznych materialow pryzmatu')
xlabel('Kat odchylenia δ')
ylabel('Kat padania θ')

subplot(3, 1, 3)
plot(alpha, epsilon1k, "b", alpha, epsilon1k2, "g", alpha, epsilon1k3, 'MarkerFaceColor', "#EDB120")
title('Wykres δ(θ) dla 3 roznych katow lamania pryzmatu')
xlabel('Kat odchylenia δ')
ylabel('Kat padania θ')
