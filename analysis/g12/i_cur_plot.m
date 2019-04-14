% start : step point : end

breaker = 'g12';
startingTime = 25;
endingTime = 240;
nordic_limit = 0.2;  % Nordic: 1±0.2%
gb_limit = 0.4;  % GB: 1±0.4%

figure();
hold on
KP = [];
KI = [];
DELAY = [];
SETTLINGTIME = [];

for delay = 0.01:0.01:0.21
    KP = [];
    KI = [];
    DELAY = [];
    SETTLINGTIME = [];
    for kp = 0.1:5.0:325.1
        for ki = 0.1:5.0:25.1
            s = ['/Users/realgjl/OneDrive - University of Leeds/Nordic/cur_', breaker, '/', ...
                'temp_display_', breaker, '_', num2str(kp,'%.2f'), '-', num2str(ki,'%.2f'), '-', num2str(delay,'%.2f'), 's', '.cur'];
            %s
            a = importdata(s);
            t = a(:,1);
            f = a(:,4);
            % set steady-state value (y_final) to nominal value & SettlingTimeThreshold to 2%:
            info = stepinfo(f,t,1.0,'SettlingTimeThreshold',0.02);
            % Nordic (1±0.2%):
            if info.Overshoot <= nordic_limit
                settlingTime = info.SettlingTime;
                txt = ['kp = ', num2str(kp,'%.2f'), ', ki = ', num2str(ki,'%.2f'), ...
                    ', Delay = ', num2str(delay,'%.2f'), ' sec, Settling Time = ', num2str(settlingTime,'%.4f'), ' sec'];
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


    T = table(KP, KI, DELAY, SETTLINGTIME);
    % save to a dictionary:
    % xlsx_address = ['/Users/realgjl/OneDrive - University of Leeds/Nordic/cur_', breaker, '/surf/ori.xlsx'];
    xlsx_address = ['/Users/realgjl/OneDrive - University of Leeds/Nordic/cur_', breaker, '/surf/td_', num2str(delay,'%.2f'), '.xlsx'];
    %xlsx_address
    writetable(T,xlsx_address)
end
hold off

legend show
theTitle = ['Machine g2 (Nordic: 0.998 ~ 1.002): AGC starting from ', num2str(startingTime), ' sec, system ending at ', num2str(endingTime), ' sec'];
title(theTitle)
xlabel('t(s)')
ylabel('Omega(pµ)')
xlim([0 369]);
ylim([0.995 1.005]);
grid on