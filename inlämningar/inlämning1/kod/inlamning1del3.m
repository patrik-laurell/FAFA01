% Inlämningsuppgift 1.3
clear all
close all
clc
hold on

k = 1;      %dämpningskonstant
m = 1;      %massa
A = 0.5;    %utgångshöjd
w0 = sqrt(k/m);     %egenvinkelfrekvens
bunder = 0.4;       %dämpande kraft vid svagt dämpad rörelse
bcrit = 2*m*w0;     %dämpande kraft vid kritiskt dämpad rörelse
bover = 2 * bcrit;  %dämpande kraft vid överdämpad rörelse
t = linspace(0,20,1000);

%---svagt dämpad rörelse---
wprime = w0*sqrt(1-(bunder/(2*m*w0))^2);
%uttryck för underdämpad svängning:
xunder = @(t) A*exp(-bunder/(2*m)*t).*cos(wprime*t); 
plot(t,xunder(t));

%---kritiskt dämpad rörelse
C1crit = A;
C2crit = m/bcrit;
%uttryck för kritiskt dämpad svägning:
xcrit = @(t) (C1crit*t + C2crit).*exp(-bcrit/(2*m)*t);
plot(t, xcrit(t), 'g');

%---överdämpad rörelse---
r1 = -bover/(2*m) + sqrt((bover/(2*m))^2-w0^2);
r2 = -bover/(2*m) - sqrt((bover/(2*m))^2-w0^2);
C1over = -r2/(2*(r1-r2));
C2over = 0.5-C1over;
%uttryck för överdämpad rörelse:
xover = @(t) C1over*exp(r1*t) + C2over*exp(r2*t);
plot(t,xover(t),'r');
title('Dämpade svängningar');
xlabel('{\it T} / s', 'interpreter', 'latex');
ylabel('{\it x} / m', 'interpreter', 'latex');
legend('Svagt dämpad', 'Kritiskt dämpad', 'Överdämpad');