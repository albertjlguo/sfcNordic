% start : step point : end

s1 = 'temp_display_';
s2 = 's';
s3 = '.cur';

figure();
hold on
<<<<<<< HEAD
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
=======
%T = [];
KP = [];
KI = [];
DELAY = [];
SETTLINGTIME = [];

for kp = 0.10
    for ki = 0.10
        for delay = 0.01:0.01:0.10        
            s = [s1 num2str(kp,'%.2f') '-' num2str(ki,'%.2f') '-' num2str(delay,'%.2f') s2 s3];
            a = importdata(s);
            t = a(:,1);
            f = a(:,4);
            txt = ['kp = ', num2str(kp,'%.2f'), ', ki = ', num2str(ki,'%.2f'), ', delay = ',num2str(delay,'%.3f')];
            plot(t, f, 'DisplayName',txt)
            info = stepinfo(f);
            settlingTime = info.SettlingTime;
            KP = [KP; kp];
            KI = [KI; ki];
            DELAY = [DELAY; delay];
            SETTLINGTIME = [SETTLINGTIME; settlingTime];
>>>>>>> 87292286ea956879287ec52b4c249649cef50fa4
        end
    end
end

T = table(KP, KI, DELAY, SETTLINGTIME);
writetable(T,'somefile.xlsx');
hold off

legend show

theTitle = 'Machine g2';
title(theTitle)

xlabel('t(s)')
ylabel('Omega(pµ)')
grid on

