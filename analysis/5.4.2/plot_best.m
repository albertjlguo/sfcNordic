% This is the first step after generating all the cur files.
% cur file should be in a form of, e.g., temp_display_0.00-0.00-0.01s.cur
%
% 1. Input: curFolder + cur files' name, e.g.:
%          D:/OneDrive - University of Leeds/Nordic/cur_g12/data/temp_display_0.00-0.00-0.01s.cur
% 
% 2. Function: (1) Generate a MATLAB figure of all the "stable" points;
%              (2) Generate an xlsx file of all the "stable" points.
%                                        
%                   stable means: (a) overshoot <= required limit;
%                                 (b) system sattled before endingTime.
% 
% 3. Output: (1) A MATLAB figure;
%            (2) An xlsx file, saving at xlsx_address:
%                C:/Users/el17jg/Desktop/GitHub/Nordic-test-system/analysis/g12/ori.xlsx
% 
% p.s. This program is expecially friendly in multiple delays situations.

% start : step point : end

startingTime = 150;
endingTime = 1000;
required_settlingTime = 900-startingTime;  % after the control
nordic_limit = 0.2;  % Nordic: 1±0.2%
gb_limit = 0.4;  % GB: 1±0.4%

% input folder (store cur files)
curFolder1 = '/Users/realgjl/OneDrive - University of Leeds/Nordic/5.1/';
curFolder2 = '/Users/realgjl/OneDrive - University of Leeds/Nordic/4.1.1/';
figure();

hold on
breaker = 'g9';
for delay = 0.01:0.01:0.21
    kp = 100.1;
    ki = 0.1;
    s = [curFolder1, ...
        'temp_display_', breaker, '_', num2str(kp,'%.2f'), '-', num2str(ki,'%.2f'), '-', num2str(delay,'%.2f'), 's', '.cur'];
    s
    a = importdata(s);
    t = a(:,1);
    f = a(:,4);
    % shift time-axis
    for index = 1:length(t)
        if t(index)>=startingTime
            break
        end
    end
    tchopped = t(index:end,1) - startingTime;
    fchopped = f(index:end,1);
    % set steady-state value (y_final) to nominal value & SettlingTimeThreshold to 2%:
    info = stepinfo(fchopped,tchopped,1.0,'SettlingTimeThreshold',0.02);
    settlingTime = info.SettlingTime;
    txt = ['kp = ', num2str(kp,'%.2f'), ', ki = ', num2str(ki,'%.2f'), ...
            ', Delay = ', num2str(delay,'%.2f'), ...
            ' sec, Settling Time = ', num2str(settlingTime+startingTime,'%.4f'), ' sec'];
    plot(t, f, 'DisplayName',txt)
end

hold on
breaker = 'g9';
delay = 0.01;
kp = 0.00;
ki = 0.00;
s = [curFolder2, ...
    'temp_display_', breaker, '_', num2str(kp,'%.2f'), '-', num2str(ki,'%.2f'), '-', num2str(delay,'%.2f'), 's', '.cur'];
s
a = importdata(s);
t = a(:,1);
f = a(:,4);
% shift time-axis
for index = 1:length(t)
    if t(index)>=startingTime
        break
    end
end
tchopped = t(index:end,1) - startingTime;
fchopped = f(index:end,1);
% set steady-state value (y_final) to nominal value & SettlingTimeThreshold to 2%:
info = stepinfo(fchopped,tchopped,1.0,'SettlingTimeThreshold',0.02);
settlingTime = info.SettlingTime;
txt = ['kp = ', num2str(kp,'%.2f'), ', ki = ', num2str(ki,'%.2f'), ...
        ', Delay = ', num2str(delay,'%.2f'), ...
        ' sec, Settling Time = ', num2str(settlingTime+startingTime,'%.4f'), ' sec'];
plot(t, f, 'DisplayName',txt)

hold off
legend show
theTitle = ['#5. Impact of Delay: The Best SFCs vs Without Control']
title(theTitle)
xlabel('t(s)')
ylabel('Omega(pµ)')
xlim([0 1350]);
ylim([0.989 1.0025]);
set(gca,'XTick',[0:50:1350])
grid on