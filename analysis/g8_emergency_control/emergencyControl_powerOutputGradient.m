s = 'temp_display_g8_45.10-0.10-0.01s.cur';
a = importdata(s);
t = a(:,1);
p6 = a(:,5);
p7 = a(:,6);
p14 = a(:,7);
p15 = a(:,8);
p16 = a(:,9);
a = {6,7,14,15,16};
b = {468.0, 234.0, 819.0, 1404.0, 819.0};

hold on
for i = 1:length(a)
    index = a{i};  % 6,7,14,15,16
    nominalPower = b{i};
    %p = ['p', num2str(index)]
    
    if index == 6
        p = p6;
    end
    if index == 7
        p = p7;
    end
    if index == 14
        p = p14;
    end
    if index == 15
        p = p15;
    end
    if index == 16
        p = p16;
    end
    
    % max power rate (MW/s)
    fx = gradient(p);
    mwps = max(fx);
    
    % max power
    mpower = max(p);
    if mpower > nominalPower
        sign = '<';
    end
    if mpower == nominalPower
        sign = '=';
    end
    if mpower < nominalPower
        sign = '>';
    end
    
    txt = ['g', num2str(index), ': Nominal Power = ', num2str(nominalPower, '%.1f'), 'MW ', ...
            sign, ' Max Power = ', num2str(mpower, '%.4f'), 'MW; '...
            'Max Gradient = ', num2str(mwps, '%.4f'), 'MW/s.'];
    plot(t, p, 'DisplayName', txt)
end

hold off
legend show
xlabel('t(s)')
ylabel('P(MW)')
xlim([0 369])
grid on