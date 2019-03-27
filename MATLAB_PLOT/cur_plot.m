% start : step point : end

startingTime = 25;
endingTime = 240;
nordic_limit = 0.2;  % Nordic: 1±0.2%
gb_limit = 0.4;  % GB: 1±0.4%

s1 = 'temp_display_';
s2 = 's';
s3 = '.cur';
prefix_Mac = '/Users/realgjl/OneDrive - University of Leeds/';
prefix_Win = 'D:/OneDrive - University of Leeds/';
Nordic_Data = 'Nordic/Data/';
excel_name = 'rank.xlsx';

figure();
hold on
KP = [];
KI = [];
DELAY = [];
SETTLINGTIME = [];

for kp = 0.1:5.0:345.1
    
    if kp == 0.1  % kp: 0.1
        coef = 3.0;
    end
    
    if kp>0.1 && kp<50.1  % kp: 5.1~45.1
        coef = 0.3;
    end

    if kp>=50.1 && kp<100.1  % kp: 50.1~95.1
        coef = 0.2415;
    end

    if kp>=100.1 && kp<150.1  % kp: 100.1~145.1
        coef = 0.1908;
    end

    if kp>=150.1 && kp<200.1  % kp: 150.1~195.1
        coef = 0.1339;
    end

    if kp>=200.1 && kp<250.1  % kp: 200.1~245.1
        coef = 0.0655;
    end

    if kp>=250.1 && kp<300.1  % kp: 250.1~295.1
        coef = 0.0444;
    end

    if kp>=300.1 && kp<=349.6  % kp: 300.1~345.1
        coef = 0.0337;
    end
    
    for ki = 0.1:1.0:coef*kp  % ki: 0.1-coef*kp, step: 1.0
        for delay = 0.01
            s = [s1 num2str(kp,'%.2f') '-' num2str(ki,'%.2f') '-' num2str(delay,'%.2f') s2 s3];
            a = importdata(s);
            t = a(:,1);
            f = a(:,4);
            info = stepinfo(f,t,1.0,'SettlingTimeThreshold',0.02); % set steady-state value (y_final) to nominal value & SettlingTimeThreshold to 2%.
            % Nordic (1±0.2%):
            if info.Overshoot <= nordic_limit
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
folder_name = ['td_' num2str(delay,'%.2f') 's'];
xlsx_dic = [prefix_Win Nordic_Data folder_name '/' excel_name];  % save to a dictionary
writetable(T,xlsx_dic);
hold off

legend show
theTitle = ['Machine g2 (Nordic: 0.998 ~ 1.002): AGC starting from ' num2str(startingTime) ' sec, system ending at ' num2str(endingTime) ' sec'];
title(theTitle)
xlabel('t(s)')
ylabel('Omega(pµ)')
xlim([0 369]);
ylim([0.995 1.005]);
grid on