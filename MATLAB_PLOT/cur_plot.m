% start : step point : end

endingTime = 240;
nordic_limit = 0.002;  % Nordic: 1±0.2%
gb_limit = 0.004;  % GB: 1±0.4%

s1 = 'temp_display_';
s2 = 's';
s3 = '.cur';
prefix_Mac = '/Users/realgjl/OneDrive - University of Leeds/';
prefix_Win = 'D:/OneDrive - University of Leeds/';
Nordic_Data = 'Nordic/Data/';
excel_name = 'rank.xlsx';

folder_name = '2.2';

figure();
hold on
KP = [];
KI = [];
DELAY = [];
SETTLINGTIME = [];

for kp = 250.1
    for ki = 0.1:10:250.1
        for delay = 0.01
            s = [s1 num2str(kp,'%.2f') '-' num2str(ki,'%.2f') '-' num2str(delay,'%.2f') s2 s3];
            a = importdata(s);
            t = a(:,1);
            f = a(:,4);
            info = stepinfo(f,t,1.0); % set steady-state value (y_final) to nominal value.
            % Nordic (1±0.2%):
            if info.SettlingMax < (1 + nordic_limit) && info.SettlingMin > (1 - nordic_limit) && max(f) < (1 + nordic_limit) && min(f) > (1 - nordic_limit)
                txt = ['kp = ', num2str(kp,'%.2f'), ', ki = ', num2str(ki,'%.2f'), ', delay = ', num2str(delay,'%.2f')];
                plot(t, f, 'DisplayName',txt)
                settlingTime = info.SettlingTime;
                if max(t) < endingTime
                    settlingTime = 999999999;
                end
                KP = [KP; kp];
                KI = [KI; ki];
                DELAY = [DELAY; delay];
                SETTLINGTIME = [SETTLINGTIME; settlingTime]; % if sys cannot go settling, it will be shown as blank
            end
        end
    end
end
T = table(KP, KI, DELAY, SETTLINGTIME);
xlsx_dic = [prefix_Win Nordic_Data folder_name '/' excel_name];  % save to a dictionary
writetable(T,xlsx_dic);
hold off

legend show
theTitle = 'Machine g2 (Nordic: 0.998 ~ 1.002)';
title(theTitle)
xlabel('t(s)')
ylabel('Omega(pµ)')
xlim([0 369]);
ylim([0.998 1.002]);
grid on