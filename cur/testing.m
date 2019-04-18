% testing.m
%
% This ia MATLAB program use for plotting only.
% Put a value or a range of kp, ki, delay into the following program.
% p.s.: file name, e.g.: temp_display_0.00-0.00-0.01s.cur
%       the file should be in the same direction with this testing program.

% start : step point : end
startingTime = 25;
endingTime = 240;
nordic_limit = 0.2;  % Nordic: 1±0.2%
gb_limit = 0.4;  % GB: 1±0.4%

% input folder (store cur files)
curFolder = 'D:/OneDrive - University of Leeds/GB/cur';

figure();
hold on

breaker = 'g4';
for delay = 0.01  % delay: 0.01s
    for kp = 10.1  % kp: 10.1
        for ki = 0.1  % ki: 0.1
            s = ['temp_display_', breaker, '_', num2str(kp,'%.2f'), '-', num2str(ki,'%.2f'), '-', num2str(delay,'%.2f'), 's.cur'];
            s
            a = importdata(s);
            t = a(:,1);
            f = a(:,4);
            % set steady-state value (y_final) to nominal value & SettlingTimeThreshold to 4%:
            info = stepinfo(f,t,1.0,'SettlingTimeThreshold',0.04);
            settlingTime = info.SettlingTime;
            txt = ['kp = ', num2str(kp,'%.2f'), ', ki = ', num2str(ki,'%.2f'), ...
                ', Delay = ', num2str(delay,'%.2f'), ' sec, Settling Time = ', num2str(settlingTime,'%.4f'), ' sec'];
            plot(t, f, 'DisplayName',txt)
            
        end
    end
end
hold off

legend show
theTitle = ['Machine g4 (Nordic: 0.998 ~ 1.002): AGC starting from ', num2str(startingTime), ' sec, system ending at ', num2str(endingTime), ' sec'];
title(theTitle)
xlabel('t(s)')
ylabel('Omega(pµ)')
xlim([0 999]);
ylim([0.99 1.01]);
grid on