% This program will only plot the cur files without using filter.

% start : step point : end

startingTime = 25;
endingTime = 240;
nordic_limit = 0.2;  % Nordic: 1±0.2%
gb_limit = 0.4;  % GB: 1±0.4%

figure();
hold on
KP = [];
KI = [];
DELAY = [];
SETTLINGTIME = [];

% breaker = 'g12';
kp = 45.1;
ki = 0.1;
for breakerN = 8:4:12
    breaker = ['g', num2str(breakerN)];
    % breaker
    for delay = 0.01:0.01:0.21
        KP = [];
        KI = [];
        DELAY = [];
        SETTLINGTIME = [];

        s = ['temp_display_', breaker, '_', num2str(kp,'%.2f'), '-', num2str(ki,'%.2f'), '-', num2str(delay,'%.2f'), 's', '.cur'];
        %s
        a = importdata(s);
        t = a(:,1);
        f = a(:,4);
        % set steady-state value (y_final) to nominal value & SettlingTimeThreshold to 2%:
        info = stepinfo(f,t,1.0,'SettlingTimeThreshold',0.02);
        settlingTime = info.SettlingTime;
        txt = ['breaker = ', breaker, ', kp = ', num2str(kp,'%.2f'), ', ki = ', num2str(ki,'%.2f'), ...
            ', Delay = ', num2str(delay,'%.2f'), ' sec, Settling Time = ', num2str(settlingTime,'%.4f'), ' sec'];
        plot(t, f, 'DisplayName',txt)
    end
end
hold off

legend show
theTitle = ['g12 x g8'];
title(theTitle)
xlabel('t(s)')
ylabel('Omega(pµ)')
xlim([0 369]);
ylim([0.99 1.005]);
grid on