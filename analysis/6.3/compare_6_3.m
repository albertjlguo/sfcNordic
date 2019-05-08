

hold on
% data from SFC
curFolder = '/Users/realgjl/OneDrive - University of Leeds/Nordic/5.1/';
breaker = 'g9';
%delay=0.01
for delay = 0.21
    for kp = 0.1:10.0:140.1
        for ki = 0.1:1.0:10.1
            s = [curFolder, ...
                'temp_display_', breaker, '_', num2str(kp,'%.2f'), '-', num2str(ki,'%.2f'), '-', num2str(delay,'%.2f'), 's', '.cur'];
            s
            a = importdata(s);
            t = a(:,1);
            f = a(:,4);
            % shift time-axis
            for index = 1:length(t)
                if t(index)>=150
                    break
                end
            end
            tchopped = t(index:end,1) - 150;
            fchopped = f(index:end,1);
            % set steady-state value (y_final) to nominal value & SettlingTimeThreshold to 2%:
            info = stepinfo(fchopped,tchopped,1.0,'SettlingTimeThreshold',0.02);
            settlingTime = info.SettlingTime;
            
            if info.Overshoot <= nordic_limit && settlingTime < 900-150
            
                txt = ['kp = ', num2str(kp,'%.2f'), ', ki = ', num2str(ki,'%.2f'), ...
                    ', Delay = ', num2str(delay,'%.2f'), ' sec, Settling Time = ', num2str(settlingTime+startingTime,'%.4f'), ' sec'];
                plot(t, f, 'DisplayName',txt)
            end
        end
    end
end


hold on
% data from EC
curFolder = '/Users/realgjl/OneDrive - University of Leeds/Nordic/6.3/';
breaker = 'g9';
%delay=0.01
for delay = 0.21
    for kp = 0.1:10.0:140.1
        for ki = 0.1:1.0:10.1
            s = [curFolder, ...
                'temp_display_', breaker, '_', num2str(kp,'%.2f'), '-', num2str(ki,'%.2f'), '-', num2str(delay,'%.2f'), 's', '.cur'];
            s
            a = importdata(s);
            t = a(:,1);
            f = a(:,4);
            % shift time-axis
            for index = 1:length(t)
                if t(index)>=9.76
                    break
                end
            end
            tchopped = t(index:end,1) - 9.76;
            fchopped = f(index:end,1);
            % set steady-state value (y_final) to nominal value & SettlingTimeThreshold to 2%:
            info = stepinfo(fchopped,tchopped,1.0,'SettlingTimeThreshold',0.02);
            settlingTime = info.SettlingTime;
            
            if info.Overshoot <= nordic_limit && settlingTime < 900-9.76
            
                txt = ['kp = ', num2str(kp,'%.2f'), ', ki = ', num2str(ki,'%.2f'), ...
                    ', Delay = ', num2str(delay,'%.2f'), ' sec, Settling Time = ', num2str(settlingTime+startingTime,'%.4f'), ' sec'];
                plot(t, f, 'DisplayName',txt)
            end
        end
    end
end
hold off

legend show
theTitle = ['Delay = 0.21 sec: Comparison of SFC and Emergency Control'];
title(theTitle)
xlabel('t(s)')
ylabel('Omega(pµ)')
xlim([0 1350]);
ylim([0.989 1.0025]);
grid on



