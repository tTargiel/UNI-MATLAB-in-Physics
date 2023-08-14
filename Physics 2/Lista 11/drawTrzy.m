function drawTrzy(dl, R)
hold off;
[x, y, z] = meshgrid(R : dl : 5 * R, -2 * R : dl : R, 0 : dl : 5 * R);
[M, N] = size(x);
for k = 1 : M
    for t = 1 : N
        plot3(x(k, t), y(k, t), z(k, t), 'bx');
        hold on;
    end;
end;
title('Elektron w polu magnetycznym - animacja 3D');
text(6, -2, 5, 'B', 'FontSize', 12);
