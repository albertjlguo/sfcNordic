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
endingTime = 240;
nordic_limit = 0.002;  % Nordic: 1±0.2%
gb_limit = 0.004;  % GB: 1±0.4%

for kp = 0.1:10:540.1
    %{
    if kp>=0.1 && kp<=49.6  % kp: 0.1-49.6
        coef = 0.6341;
    end

    if kp>=50.1 && kp<=99.6  % kp: 50.1-99.6
        coef = 0.5709;
    end

    if kp>=100.1 && kp<=149.6  % kp: 100.1-149.6
        coef = 0.5355;
    end

    if kp>=150.1 && kp<=199.6  % kp: 150.1-199.6
        coef = 0.4837;
    end

    if kp>=200.1 && kp<=249.6  % kp: 200.1-249.6
        coef = 0.4153;
    end

    if kp>=250.1 && kp<=299.6  % kp: 250.1-299.6
        coef = 0.3583;
    end

    if kp>=300.1 && kp<=349.6  % kp: 300.1-349.6
        coef = 0.2919;
    end

    if kp>=350.1 && kp<=399.6  % kp: 350.1-399.6
        coef = 0.2288;
    end

    if kp>=400.1 && kp<=449.6  % kp: 400.1-449.6
        coef = 0.1602;
    end

    if kp>=450.1 && kp<=499.6  % kp: 450.1-499.6
        coef = 0.1602;
    end

    if kp>=500.1 && kp<=539.6  % kp: 500.1-539.6
        coef = 0.0432;
    end
    %}
    for ki = 0.1:10:(coef*kp)
        for delay = 0.01:0.10:0.22
            s = [s1 num2str(kp,'%.2f') '-' num2str(ki,'%.2f') '-' num2str(delay,'%.2f') s2 s3];
            a = importdata(s);
            t = a(:,1);
            f = a(:,4);
            info = stepinfo(f,t,1.0); % set steady-state value (y_final) to nominal value.
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
% Mac: /Users/realgjl/OneDrive - University of Leeds/Nordic/td_' num2str(delay,'%.2f') 's/rank.xlsx
% PC: D:/OneDrive - University of Leeds/Nordic/td_' num2str(delay,'%.2f') 's/rank.xlsx
xlsx_dic = ['D:/OneDrive - University of Leeds/Nordic/td_' num2str(delay,'%.2f') 's/rank.xlsx']; % save to a dictionary
writetable(T,xlsx_dic);
hold off

legend show
theTitle = 'Machine g2';
title(theTitle)
xlabel('t(s)')
ylabel('Omega(pµ)')
xlim([0 369]);
ylim([0.99 1.01]);
grid on