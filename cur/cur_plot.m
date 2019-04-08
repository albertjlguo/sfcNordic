% start : step point : end

startingTime = 25;
endingTime = 240;
nordic_limit = 0.2;  % Nordic: 1±0.2%
gb_limit = 0.4;  % GB: 1±0.4%

s1 = 'temp_display_';
s2 = 's';
s3 = '.cur';
prefix_Mac = '/Users/realgjl/OneDrive - University of Leeds/';
% prefix_Win = 'D:/OneDrive - University of Leeds/';
prefix_Win = 'C:/Users/el17jg/Desktop/GitHub/Nordic-test-system/cur';
Nordic_Data = 'Nordic/Data/';
excel_name = 'rank.xlsx';

figure();
hold on
KP = [];
KI = [];
DELAY = [];
SETTLINGTIME = [];

for delay = 0.01:0.01:0.21
    for kp = 55.1
        for ki = 0.1
            s = [s1 num2str(kp,'%.2f') '-' num2str(ki,'%.2f') '-' num2str(delay,'%.2f') s2 s3];
            a = importdata(s);
            t = a(:,1);
            f = a(:,4);
            info = stepinfo(f,t,1.0,'SettlingTimeThreshold',0.02); % set steady-state value (y_final) to nominal value & SettlingTimeThreshold to 2%.
            % Nordic (1±0.2%):
            if info.Overshoot <= nordic_limit
                settlingTime = info.SettlingTime;
                txt = ['kp = ', num2str(kp,'%.2f'), ', ki = ', num2str(ki,'%.2f'), ', delay = ', num2str(delay,'%.2f'), 'settling time = ', num2str(settlingTime,'%.4f')];
                plot(t, f, 'DisplayName',txt)
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
folder_name = ['td_' num2str(delay,'%.2f') 's'];
xlsx_dic = [prefix_Win Nordic_Data folder_name '/' excel_name];  % save to a dictionary
%writetable(T,xlsx_dic);
hold off

legend show
theTitle = ['Machine g2 (Nordic: 0.998 ~ 1.002): AGC starting from ' num2str(startingTime) ' sec, system ending at ' num2str(endingTime) ' sec'];
title(theTitle)
xlabel('t(s)')
ylabel('Omega(pµ)')
xlim([0 369]);
ylim([0.995 1.005]);
grid on