clear all
close all
clc
hold on
box on

A0 = 1;
b = 0.20;
m = 1;
k = 1;
wprime = sqrt((k/m)-(b/(2*m)^2))
delta = -0.1;%1.46

x = @(t) A0*exp(-b/(2*m)*t).*cos(wprime*t + delta);
v = @(t) -A0*b/(2*m)*exp(-b/(2*m)*t).*cos(wprime*t + delta) - A0*exp(-b/(2*m)*t).*sin(wprime*t + delta);

t = linspace(0, 10, 1000);
plot(t, (k/m)*(x(t)).^2, 'r');
plot(t, (v(t)).^2);
plot(t, (k/m)*(x(t)).^2 + (v(t)).^2, 'k');
set(gca, 'Ytick', []);
set(gca, 'Xtick', []);
xlabel('{\it t} / s');
ylabel('{\it E} / J');
legend('Potentiell energi', 'Kinetisk energi', 'Total energi');
axis([0 10 0 1.2]);