nordic_limit = 0.2;  % Nordic: 1±0.2%

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
% input folder (store cur files)
curFolder = '/Users/realgjl/OneDrive - University of Leeds/Nordic/test/';
% output folder (generate xlsx files)
xlsxFolder = '/Users/realgjl/Desktop/';

for delay = 0.01
    for kp = 0.01
        for ki = 0.01
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
            
            %  shift time-axis
            for index = 1:length(t)
                if t(index)>=150.0
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

            % stepinfo
            info = stepinfo(fchopped,tchopped,1.0,'SettlingTimeThreshold',0.02);
            settlingTime = info.SettlingTime;
            riseTime = info.RiseTime;
            
            % rising start time (10% of rising)
            for rt = 1:length(fchopped)
                if fchopped(rt) >= 0.1 * 1
                    break
                end
            end
            startTime = tchopped(rt)
            
            
            % rising end time (90% of rising)
            for re = 1:length(fchopped)
                if fchopped(re) >= 0.9 * 1
                    break
                end
            end
            endTime = tchopped(re)
            
            
            % delta P during rising
            g6DeltaP = g6chopped(endTime) - g6chopped(startTime);
            g7DeltaP = g7chopped(endTime) - g7chopped(startTime);
            g14DeltaP = g14chopped(endTime) - g14chopped(startTime);
            g15DeltaP = g15chopped(endTime) - g15chopped(startTime);
            g16DeltaP = g16chopped(endTime) - g16chopped(startTime);
            
            
            
            % gens: MW/min during rising time
            trueMWPMin6 = g6DeltaP/riseTime * 60;
            trueMWPMin7 = g7DeltaP/riseTime * 60;
            trueMWPMin14 = g14DeltaP/riseTime * 60;
            trueMWPMin15 = g15DeltaP/riseTime * 60;
            trueMWPMin16 = g16DeltaP/riseTime * 60;
            
            if info.Overshoot <= nordic_limit && settlingTime < 900
                if trueMWPMin6 < 0.01 * Pnom6 && ...
                   trueMWPMin7 < 0.01 * Pnom7 && ...
                   trueMWPMin14 < 0.01 * Pnom14 && ...
                   trueMWPMin15 < 0.01 * Pnom15 && ...
                   trueMWPMin16 < 0.01 * Pnom16
                    
                    % plot accecptable data
                    txt = ['kp = ', num2str(kp,'%.2f'), ', ki = ', num2str(ki,'%.2f'), ...
                        ', Delay = ', num2str(delay,'%.2f'), ' sec, Settling Time = ', num2str(settlingTime,'%.4f'), ' sec'];
                    plot(tchopped, fchopped, 'DisplayName',txt)

                    KP = [KP; kp];
                    KI = [KI; ki];
                    DELAY = [DELAY; delay];
                    SETTLINGTIME = [SETTLINGTIME; settlingTime]; % if sys cannot go settling, it will be shown as blank
                    TRUEMWPMIN6 = [TRUEMWPMIN6; trueMWPMin6];
                    TRUEMWPMIN7 = [TRUEMWPMIN7; trueMWPMin7];
                    TRUEMWPMIN14 = [TRUEMWPMIN14; trueMWPMin14];
                    TRUEMWPMIN15 = [TRUEMWPMIN15; trueMWPMin15];
                    TRUEMWPMIN16 = [TRUEMWPMIN16; trueMWPMin16];
                end
            end
        end
    end
end

%hold on
h
%plot(tchopped, g6chopped, 'DisplayName',txt)
plot(tchopped, fchopped, 'DisplayName',txt)
hold off
T = table(KP, KI, DELAY, SETTLINGTIME, TRUEMWPMIN6, TRUEMWPMIN7, TRUEMWPMIN14, TRUEMWPMIN15, TRUEMWPMIN16);
xlsx_address = [xlsxFolder,...
                'test.xlsx'];
%xlsx_address
writetable(T,xlsx_address)

legend show
theTitle = ['4.1.2 (a)'];
title(theTitle)
xlabel('t(s)')
ylabel('Omega(pµ)')
%xlim([0 950]);
%ylim([0.99 1.01]);
grid on