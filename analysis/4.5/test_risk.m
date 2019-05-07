s = '/Users/realgjl/OneDrive - University of Leeds/Nordic/4.3/temp_display_g9_0.10-0.10-0.01s.cur';
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

%step info of P6-t
info6 = stepinfo(g6chopped,tchopped)
peakTime6 = info6.PeakTime;
peak6 = info6.Peak;

delta = g6chopped(end) - g6chopped(1)


%hold on
%plot(t,f,'DisplayName','f-t')
%hold on
plot(t,g6,'DisplayName','P6-t')

%hold off
legend show
theTitle = ['kp=0.1, ki=0.1, td=0.1sec'];
title(theTitle)
grid on
