% start : step point : end

s1 = 'temp_display_';
s2 = 's';
s3 = '.cur';

figure();
hold on
for kp = 0.35
    for ki = 0.25
        for delay = 0.01:0.99:1.01
            if delay == 0.00
                delay = 0.01
            end
            
            s = [s1 num2str(kp,'%.2f') '-' num2str(ki,'%.2f') '-' num2str(delay,'%.2f') s2 s3]
            a = importdata(s)
            x0 = a(:,1)
            y0 = a(:,4)
            txt = ['kp = ', num2str(kp), ', ki = ', num2str(ki), ', delay = ',num2str(delay)];
            plot(x0, y0, 'DisplayName',txt)
            S = stepinfo(y0)
            settlingTime = S.SettlingTime
        end
    end
end
hold off

legend show

theTitle = ['Machine g2']
title(theTitle)

xlabel('t(s)')
ylabel('Omega(pµ)')
grid on

