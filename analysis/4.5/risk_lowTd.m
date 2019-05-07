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
curFolder = '/Users/realgjl/OneDrive - University of Leeds/Nordic/4.3/';

% output folder (generate xlsx files)
xlsxFolder = '/Users/realgjl/Desktop/GitHub/sfcNordic/analysis/4.5/';

figure();
hold on
Pnom6 = 360.0;
Pnom7 = 180.0;
Pnom14 = 630.0;
Pnom15 = 1080.0;
Pnom16 = 630.0;
KP = [];
KI = [];
DELAY = [];
SETTLINGTIME = [];
TRUEMWPMIN6 = [];
TRUEMWPMIN7 = [];
TRUEMWPMIN14 = [];
TRUEMWPMIN15 = [];
TRUEMWPMIN16 = [];
breaker = 'g9';
for delay = 0.01
    for kp = 0.1:10.0:140.1
        kp
        for ki = 0.1:1.0:10.1
            ki
            s = [curFolder, ...
                'temp_display_', breaker, '_', num2str(kp,'%.2f'), '-', num2str(ki,'%.2f'), '-', num2str(delay,'%.2f'), 's', '.cur'];
            %s
            a = importdata(s);
            t = a(:,1);
            f = a(:,4);
            g6 = a(:,5);
            g7 = a(:,6);
            g14 = a(:,7);
            g15 = a(:,8);
            g16 = a(:,9);
            % shift time-axis
            for index = 1:length(t)
                if t(index)>=startingTime
                    break
                end
            end
            tchopped = t(index:end,1) -150;
            fchopped = f(index:end,1);
            g6chopped = g6(index:end,1);
            g7chopped = g7(index:end,1);
            g14chopped = g14(index:end,1);
            g15chopped = g15(index:end,1);
            g16chopped = g16(index:end,1);
            
            
            % stepinfo of f-t
            info = stepinfo(fchopped,tchopped,1.0,'SettlingTimeThreshold',0.02);
            settlingTime = info.SettlingTime;
            
            
            %step info of P-t
            info6 = stepinfo(g6chopped,tchopped);
            info7 = stepinfo(g7chopped,tchopped);
            info14 = stepinfo(g14chopped,tchopped);
            info15 = stepinfo(g15chopped,tchopped);
            info16 = stepinfo(g16chopped,tchopped);
            
            
            % delta time of peak
            peakTime6 = info6.PeakTime;
            peakTime7 = info7.PeakTime;
            peakTime14 = info14.PeakTime;
            peakTime15 = info15.PeakTime;
            peakTime16 = info16.PeakTime;
            
            peak6 = info6.Peak;
            peak7 = info7.Peak;
            peak14 = info14.Peak;
            peak15 = info15.Peak;
            peak16 = info16.Peak;
 
            
            % delta P during peaking time
            g6DeltaP = peak6 - g6chopped(1);
            g7DeltaP = peak7 - g7chopped(1);
            g14DeltaP = peak14 - g14chopped(1);
            g15DeltaP = peak15 - g15chopped(1);
            g16DeltaP = peak16 - g16chopped(1);

            
            % gens: MW/min during peaking time
            trueMWPMin6 = g6DeltaP/peakTime6 * 60;
            trueMWPMin7 = g7DeltaP/peakTime7 * 60;
            trueMWPMin14 = g14DeltaP/peakTime14 * 60;
            trueMWPMin15 = g15DeltaP/peakTime15 * 60;
            trueMWPMin16 = g16DeltaP/peakTime16 * 60;
            
         
            KP = [KP; kp];
            KI = [KI; ki];
            DELAY = [DELAY; delay];
            SETTLINGTIME = [SETTLINGTIME; settlingTime+startingTime];
            TRUEMWPMIN6 = [TRUEMWPMIN6; trueMWPMin6];
            TRUEMWPMIN7 = [TRUEMWPMIN7; trueMWPMin7];
            TRUEMWPMIN14 = [TRUEMWPMIN14; trueMWPMin14];
            TRUEMWPMIN15 = [TRUEMWPMIN15; trueMWPMin15];
            TRUEMWPMIN16 = [TRUEMWPMIN16; trueMWPMin16];
            
            
            if info.Overshoot <= nordic_limit && settlingTime < required_settlingTime
                if trueMWPMin6 < 0.01 * Pnom6 &&...
                    trueMWPMin7 < 0.01 * Pnom7 &&...
                    trueMWPMin14 < 0.01 * Pnom14 &&...
                    trueMWPMin15 < 0.01 * Pnom15 &&...
                    trueMWPMin16 < 0.01 * Pnom16
                    
                    txt = ['kp = ', num2str(kp,'%.2f'), ', ki = ', num2str(ki,'%.2f'), ...
                        ', Delay = ', num2str(delay,'%.2f'), ...
                        ' sec, Settling Time = ', num2str(settlingTime+startingTime,'%.4f'), ' sec'];
                    plot(t, f, 'DisplayName',txt)
                end
            end
        end
    end
end
hold off
T = table(KP, KI, DELAY, SETTLINGTIME, TRUEMWPMIN6, TRUEMWPMIN7, TRUEMWPMIN14, TRUEMWPMIN15, TRUEMWPMIN16);
xlsx_address = [xlsxFolder,...
                'risk_lowTd.xlsx'];
%xlsx_address
writetable(T,xlsx_address)

legend show
%theTitle = '#4. Low Time Delay';
theTitle = ['#4. Low Time Delay Risk Testing (Delay = 0.01s, kp = 0.1~140.1, ki = 0.1~10.1, Start time: 150s, End Time: 1000s, Settling Time: 900s)'];
title(theTitle)
xlabel('t(s)')
ylabel('Omega(pµ)')
xlim([0 1350]);
ylim([0.989 1.0025]);
grid on