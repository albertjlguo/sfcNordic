clear all

A1 = importdata('temp_display_0.45-0.25.cur')
x1 = A1(:,1)
y1 = A1(:,4)
plot(x1,y1)
hold on

A2 = importdata('temp_display_0.45-0.25_delay-50-100.cur')
x2 = A2(:,1)
y2 = A2(:,4)
plot(x2,y2)


 
legend('No delay', 'delay from 50 to 100sec')
 

title('Machine g2')
xlabel('t(s)') % x-axis label
ylabel('Omega(pµ)') % y-axis label
grid on