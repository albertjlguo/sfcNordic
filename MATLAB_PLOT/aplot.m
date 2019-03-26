% start : step point : end
startingTime = 25;
endingTime = 240;

s1 = 'temp_display_';
s2 = 's';
s3 = '.cur';

figure();
hold on
KP = [];
KI = [];
DELAY = [];
SETTLINGTIME = [];

for kp = 500.1
    %{
    if kp>=0.1 && kp<=49.6  % kp: 0.1-49.6
        coef = 0.6341;
    end

    if kp>=50.1 && kp<=99.6  % kp: 50.1-99.6
        coef = 0.5709;
    end

    if kp>=100.1 && kp<=149.6  % kp: 100.1-149.6
        coef = 0.5355;
    end

    if kp>=150.1 && kp<=199.6  % kp: 150.1-199.6
        coef = 0.4837;
    end

    if kp>=200.1 && kp<=249.6  % kp: 200.1-249.6
        coef = 0.4153;
    end

    if kp>=250.1 && kp<=299.6  % kp: 250.1-299.6
        coef = 0.3583;
    end

    if kp>=300.1 && kp<=349.6  % kp: 300.1-349.6
        coef = 0.2919;
    end

    if kp>=350.1 && kp<=399.6  % kp: 350.1-399.6
        coef = 0.2288;
    end

    if kp>=400.1 && kp<=449.6  % kp: 400.1-449.6
        coef = 0.1602;
    end

    if kp>=450.1 && kp<=499.6  % kp: 450.1-499.6
        coef = 0.1602;
    end

    if kp>=500.1 && kp<=539.6  % kp: 500.1-539.6
        coef = 0.0432;
    end
    %}
    for ki = 0.1:10:500.1
        for delay = 0.01
            s = [s1 num2str(kp,'%.2f') '-' num2str(ki,'%.2f') '-' num2str(delay,'%.2f') s2 s3];
            a = importdata(s);
            t = a(:,1);
            f = a(:,4);
            txt = ['kp = ', num2str(kp,'%.2f'), ', ki = ', num2str(ki,'%.2f'), ', delay = ',num2str(delay,'%.2f')];
            plot(t, f, 'DisplayName',txt,'LineWidth',1)
        end
    end
end
hold off

legend show
theTitle = ['Machine g2 (Nordic: 0.998 ~ 1.002): AGC starting from ' num2str(startingTime) ' sec, system ending at ' num2str(endingTime) ' sec'];
title(theTitle)
xlabel('t(s)')
ylabel('Omega(pµ)')
xlim([0 369]);
ylim([0.99 1.01]);
grid on


