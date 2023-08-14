% Tomasz Targiel
% Lista 6
% Zadanie 1

% Ten program rysuje animacje dwoch fal skladowych A*sin(kx − ωt) + A*sin(kx + ωt) zmieniajacych sie w czasie w zaleznosci od polozenia

clear;
clc;

N = 250;
A = [3, 3, 3, 3, 3];
A2 = [0, 0, 4, 0, 0];
k = [1, 1, 1, 1, 1];
k2 = [0, 0, 0, 1, 0];
omega = [12, 12, 12, 12, 12];
omega2 = [0, 0, 0, 0, 4];

x = linspace(0, 20, N);
y = linspace(0, 20, N);

for i = 1:200
    t = i * 0.01;
    for j=1:5
        subplot(5, 1, j)
        if j == 1
            p = plot(x, y, '-');
            axis([0 20 -3 3])
            y = A(j) * sin(k(j) * x - omega(j) * t);
        else
            p = plot(x, y, '-');
            axis([0 20 -10 10])
            y = A(j) * sin(k(j) * x - omega(j) * t) + (A(j) + A2(j)) * sin((k(j) + k2(j)) * x + (omega(j) + omega2(j)) * t);
        end
        set(p, 'XData', x, 'YData', y)
        drawnow
        pause(0.02);
    end
end
