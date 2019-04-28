% testing.m
%
% This ia MATLAB program use for plotting only.
% Put a value or a range of kp, ki, delay into the following program.
% p.s.: file name, e.g.: temp_display_0.00-0.00-0.01s.cur
%       the file should be in the same direction with this testing program.

% start : step point : end
startingTime = 150;
endingTime = 900;
required_settlingTime = 800;
nordic_limit = 0.2;  % Nordic: 1±0.2%

figure();
hold on
KP = [];
KI = [];
DELAY = [];
SETTLINGTIME = [];
breaker_list = {'g1', 'g3', 'g4', 'g5', 'g9', 'g10', 'g11', 'g12', 'g19'};

hold on
for i = 1:length(breaker_list)
    breaker = breaker_list{i};

    kp = 90.1;
    ki = 0.1;
    delay = 0.01;
    s = ['/Users/realgjl/OneDrive - University of Leeds/Nordic/6.1/',...
        'temp_display_', breaker, '_', num2str(kp,'%.2f'), '-', num2str(ki,'%.2f'), '-', num2str(delay,'%.2f'), 's', '.cur'];
    s
    a = importdata(s);
    t = a(:,1);
    f = a(:,4);
    % set steady-state value (y_final) to nominal value & SettlingTimeThreshold to 2%:
    info = stepinfo(f,t,1.0,'SettlingTimeThreshold',0.02);
    settlingTime = info.SettlingTime;
    txt = [breaker, ': ', ...
        'Settling Time = ', num2str(settlingTime,'%.4f'), ' sec'];
    plot(t, f, 'DisplayName',txt,'LineWidth',1)
end
hold off

legend show
theTitle = ['Nordic: 0.998~1.002, ',...
            'Impact of generator size, kp = 90.1, ki = 0.1, delay = 0.01 sec',...
            'SFC starts from ', num2str(startingTime), ' sec, '...
            'system ends at ', num2str(endingTime), ' sec, ', ...
            'system need to settle before ', num2str(required_settlingTime), ' sec.'];
title(theTitle)
xlabel('t(s)')
ylabel('Omega(pµ)')
xlim([0 1100]);
ylim([0.989 1.003]);
grid on