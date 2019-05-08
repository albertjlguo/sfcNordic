s = '/Users/realgjl/OneDrive - University of Leeds/Nordic/4.3/temp_display_g9_0.10-3.10-0.01s.cur';
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
info6 = stepinfo(g6chopped,tchopped,360,'RiseTimeLimits',[0.4 0.6])
settlingTime6 = info6.SettlingTime;
peak = info6.Peak
peakTimr = info6.PeakTime
for index6 = 1:length(t)
    if t(index6)>= settlingTime
        break
    end
end
settlingValue6 = g6chopped(index6)
deltaP6 = settlingValue6 - g6chopped(1);
mwpmin6 = deltaP6/settlingTime6


%hold on
%plot(t,f,'DisplayName','f-t')
%hold on
plot(t,g6,'DisplayName','P6-t: 0.10-3.10-0.01s')

%hold off
xlabel('t(s)')
ylabel('P(MW)')
legend show
grid on
