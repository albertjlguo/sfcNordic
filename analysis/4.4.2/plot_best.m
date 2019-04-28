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
endingTime = 240;
required_settlingTime = 200;
nordic_limit = 0.2;  % Nordic: 1±0.2%
gb_limit = 0.4;  % GB: 1±0.4%

% input folder (store cur files)
curFolder = '/Users/realgjl/Desktop/GitHub/sfcNordic/analysis/4.4.2/';

figure();

hold on
breaker = 'g9';
delay = 0.01;
kp = 40.1;
ki = 0.1;
s = [curFolder, ...
    'temp_display_', breaker, '_', num2str(kp,'%.2f'), '-', num2str(ki,'%.2f'), '-', num2str(delay,'%.2f'), 's', '.cur'];
s
a = importdata(s);
t = a(:,1);
f = a(:,4);
% set steady-state value (y_final) to nominal value & SettlingTimeThreshold to 0.02% (0.9998~1.0002):
info = stepinfo(f,t,1.0,'SettlingTimeThreshold',0.02);
settlingTime = info.SettlingTime;
plot(t, f, 'DisplayName',txt)
            
hold on
breaker = 'g9';
delay = 0.01;
kp = 0.00;
ki = 0.00;
s = [curFolder, ...
    'temp_display_', breaker, '_', num2str(kp,'%.2f'), '-', num2str(ki,'%.2f'), '-', num2str(delay,'%.2f'), 's', '.cur'];
s
a = importdata(s);
t = a(:,1);
f = a(:,4);
% set steady-state value (y_final) to nominal value & SettlingTimeThreshold to 0.02% (0.9998~1.0002):
info = stepinfo(f,t,1.0,'SettlingTimeThreshold',0.02);
settlingTime = info.SettlingTime;
plot(t, f, 'DisplayName',txt)

hold off
legend show
theTitle = ['#4. Low Time Delay: The Best SFC vs Without Control']
title(theTitle)
xlabel('t(s)')
ylabel('Omega(pµ)')
xlim([0 240]);
ylim([0.989 1.0025]);
set(gca,'XTick',[0:10:240])
grid on