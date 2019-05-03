% testing.m
%
% This ia MATLAB program use for plotting only.
% Put a value or a range of kp, ki, delay into the following program.
% p.s.: file name, e.g.: temp_display_0.00-0.00-0.01s.cur
%       the file should be in the same direction with this testing program.

% start : step point : end
%startingTime = ;
%endingTime = 900;

figure();
hold on
KP = [];
KI = [];
DELAY = [];
SETTLINGTIME = [];
breaker_list = {'g1', 'g3', 'g4', 'g5', 'g8', 'g9', 'g10', 'g11', 'g12', 'g13', 'g17', 'g18', 'g19', 'g20'};

hold on
for i = 1:length(breaker_list)
    breaker = breaker_list{i};

    kp = 0;
    ki = 0;
    delay = 0.01;
    s = ['/Users/realgjl/OneDrive - University of Leeds/Nordic/4.1.1/',...
        'temp_display_', breaker, '_', num2str(kp,'%.2f'), '-', num2str(ki,'%.2f'), '-', num2str(delay,'%.2f'), 's', '.cur'];
    a = importdata(s);
    t = a(:,1);
    f = a(:,4);
    txt = breaker;
    plot(t, f, 'DisplayName',txt,'LineWidth',1)
end

hold off
legend show
theTitle = ['without Secondary Frequency Control'];
title(theTitle)
xlabel('t(s)')
ylabel('Omega(pµ)')
xlim([0 950]);
ylim([0.97 1.01]);
grid on
