% start : step point : end

s1 = 'temp_display_';
s2 = 's';
s3 = '.cur';

figure();

for delay = 0.10:0.10:1.00
    for kp = 0.70           %kp
        for ki = 0.70       %ki
            s = [s1 num2str(kp,'%.2f') '-' num2str(ki,'%.2f') '-' num2str(delay,'%.2f') s2 s3]
            a = importdata(s)
            x0 = a(:,1)
            y0 = a(:,4)
            plot(x0, y0)
            hold on
        end
    end
end
hold off

legend('delay = 0.1s',...
       'delay = 0.2s',...
       'delay = 0.3s',...
       'delay = 0.4s',...
       'delay = 0.5s',...
       'delay = 0.6s',...
       'delay = 0.7s',...
       'delay = 0.8s',...
       'delay = 0.9s',...
       'delay = 1.0s')

theTitle = ['Machine g2, when kp = ' num2str(kp,'%.2f') ', ki = ' num2str(kp,'%.2f')]
title(theTitle)

xlabel('t(s)')
ylabel('Omega(pµ)')
grid on