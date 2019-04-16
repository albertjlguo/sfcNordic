% testing.m
%
% This ia MATLAB program use for plotting only.
% Put a value or a range of kp, ki, delay into the following program.
% p.s.: file name, e.g.: temp_display_0.00-0.00-0.01s.cur
%       the file should be in the same direction with this testing program.

% start : step point : end
startingTime = 25;
endingTime = 800;

figure();
hold on
KP = [];
KI = [];
DELAY = [];
SETTLINGTIME = [];
curFolder = '/Users/realgjl/OneDrive - University of Leeds/Nordic/g8/data';
for kp = 31.1
    for ki = 0.1
        for delay = 0.20
            s = [curFolder, '/temp_display_g8_', num2str(kp,'%.2f'), '-', num2str(ki,'%.2f'), '-', num2str(delay,'%.1f'), 's', '.cur'];
            s
            a = importdata(s);
            t = a(:,1);
            f = a(:,4);
            info = stepinfo(f,t,1.0,'SettlingTimeThreshold',0.02);
            settlingTime = info.SettlingTime;
            txt = ['kp = ', num2str(kp,'%.2f'), ', ki = ', num2str(ki,'%.2f'), ...
                    ', Delay = ', num2str(delay,'%.2f'), ' sec, Settling Time = ', num2str(settlingTime,'%.4f'), ' sec'];
            plot(t, f, 'DisplayName',txt,'LineWidth',1)
        end
    end
end
hold off

legend show
theTitle = ['Machine g2 (Nordic: 0.998 ~ 1.002): AGC starting from ' num2str(startingTime) ' sec, system ending at ' num2str(endingTime) ' sec'];
title(theTitle)
xlabel('t(s)')
ylabel('Omega(pµ)')
xlim([0 868]);
ylim([0.99 1.01]);
grid on


