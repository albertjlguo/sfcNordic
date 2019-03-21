% start : step point : end

s1 = 'temp_display_';
s2 = 's';
s3 = '.cur';
figure();
hold on
KP = [];
KI = [];
DELAY = [];
SETTLINGTIME = [];
for kp = 540.6
    for ki = 4.6
        for delay = 0.01
            s = [s1 num2str(kp,'%.2f') '-' num2str(ki,'%.2f') '-' num2str(delay,'%.2f') s2 s3];
            a = importdata(s);
            t = a(:,1);
            f = a(:,4);
            txt = ['kp = ', num2str(kp,'%.2f'), ', ki = ', num2str(ki,'%.2f'), ', delay = ',num2str(delay,'%.3f')];
            plot(t, f, 'DisplayName',txt,'LineWidth',1)
        end
    end
end

hold off

legend show
theTitle = 'Machine g2';
title(theTitle)
xlabel('t(s)')
ylabel('Omega(pµ)')
xlim([0 639]);
ylim([0.99 1.01]);
grid on