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
for kp = 0.10
    for ki = 0.10:0.50:20.10
        for delay = 0.03
            s = [s1 num2str(kp,'%.2f') '-' num2str(ki,'%.2f') '-' num2str(delay,'%.2f') s2 s3];
            a = importdata(s);
            t = a(:,1);
            f = a(:,4);
            info = stepinfo(f);
            if info.SettlingMax < 1.01 && info.SettlingMin > 0.99
                txt = ['kp = ', num2str(kp,'%.2f'), ', ki = ', num2str(ki,'%.2f'), ', delay = ',num2str(delay,'%.3f')];
                plot(t, f, 'DisplayName',txt)
                settlingTime = info.SettlingTime;
                KP = [KP; kp];
                KI = [KI; ki];
                DELAY = [DELAY; delay];
                SETTLINGTIME = [SETTLINGTIME; settlingTime];
            end
        end
    end
end
T = table(KP, KI, DELAY, SETTLINGTIME);
xlsx_dic = '\Users\el17jg\Desktop\GitHub\Nordic-test-system\curfiles\rank.xlsx'; % save to a dictionary
writetable(T,'rank.xlsx');
hold off

legend show
theTitle = 'Machine g2';
title(theTitle)
xlabel('t(s)')
ylabel('Omega(pµ)')
xlim([0 500]);
ylim([0.99 1.01]);
grid on