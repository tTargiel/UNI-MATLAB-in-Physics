% Tomasz Targiel
% Lista 6
% Zadanie 2

% Ten program rysuje animacje (na wykresach 3D) dwoch fal skladowych A*sin(kx − ωt) + A*sin(kx + ωt) zmieniajacych sie w czasie w zaleznosci od polozenia

clear;
clc;

N = 250;
A = [3, 3, 3, 3, 3];
A2 = [0, 0, 4, 0, 0];
k = [1, 1, 1, 1, 1];
k2 = [0, 0, 0, 1, 0];
omega = [12, 12, 12, 12, 12];
omega2 = [0, 0, 0, 0, 4];

for j = 1:5
    subplot(5, 1, j)
    if j == 1
        [x, y] = meshgrid(0:0.5:20, 0:0.5:20);
        z = A(j) * sin(k(j) * x - omega(j) * y);
        s = surf(x, y, z);
    else
        [x, y] = meshgrid(0:0.5:20, 0:0.5:20);
        z = A(j) * sin(k(j) * x - omega(j) * y) + (A(j) + A2(j)) * sin((k(j) + k2(j)) * x + (omega(j) + omega2(j)) * y);
        s = surf(x, y, z);
    end
    s.EdgeColor = 'none';
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title(['A = ', num2str(A(j) + A2(j)), ', k = ', num2str(k(j) + k2(j)), ', w = ', num2str(omega(j) + omega2(j))])
    drawnow
end
