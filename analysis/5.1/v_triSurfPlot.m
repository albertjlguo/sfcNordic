% This program will generate a 3D plot 
%                          & best points under different delays
%                          & best point in average

% 3D Tri-Surface Plot
num = xlsread('/Users/realgjl/Desktop/GitHub/sfcNordic/analysis/5.3/ori.xlsx', 'A2:C1970');
x = num(:,1);
y = num(:,2);
z = num(:,3);
K = boundary(x, y, z, 1);
trisurf(K, x, y, z, 'FaceAlpha', 0.1, 'DisplayName', 'Machine g2: 3D TriSurface Plot (stable cases)')
colorbar
xlabel('kp')
ylabel('ki')
zlabel('delay (sec)')
xlim([0.1 140.1]);
ylim([0.1 10.1]);
zlim([0.01 0.21]);
set(gca,'XTick',[0.1:10:140.1])
set(gca,'YTick',[0.1:0.5:10.1])
set(gca,'ZTick',[0.01:0.01:0.21])


% Marker: best points under different delays
hold on
data = xlsread('best_points.xlsx', 'B2:E22');
kp = data(:,1);
ki = data(:,2);
delay = data(:,3);
settlingTime = data(:,4);
for j = 1:length(kp)
    p = kp(j);
    i = ki(j);
    d = delay(j);
    t = settlingTime(j);
    txt = ['Delay = ', num2str(d,'%.2f'), ' sec, kp = ', num2str(p,'%.2f'), ...
        ', ki = ', num2str(i,'%.2f'), ', Settling Time = ', num2str(t,'%.4f'), ' sec'];
    %colorValue = [0.0369*j 0.03*j 1-0.0369*j];
    plot3(p, i, d, 'marker', '.', 'color', [0, 0.4470, 0.7410], 'markersize', 20, 'DisplayName', txt);
    %colorbar
end

% Marker: best point in average
hold on
digit = xlsread('settlingTime_80.1_0.1.xlsx', 'B2:E22');
b_kp = digit(:,1);
b_ki = digit(:,2);
b_delay = digit(:,3);
b_settTime = digit(:,4);
for j = 1:length(b_kp)
    bp = b_kp(j);
    bi = b_ki(j);
    bd = b_delay(j);
    bt = b_settTime(j); 
    text = ['kp = ', num2str(bp,'%.2f'), ', ki = ', num2str(bi,'%.2f'), ...
        ', Delay = ', num2str(bd,'%.2f'), ' sec, Settling Time = ', num2str(bt,'%.4f'), ' sec'];
    plot3(bp, bi, bd, 'color', 'r', 'marker', '.', 'markersize', 27, 'DisplayName', text);
end

hold off
legend show
title('Machine g2: 3D TriSurface Plot (stable cases) & Best in a single delay & Best in all delays')




