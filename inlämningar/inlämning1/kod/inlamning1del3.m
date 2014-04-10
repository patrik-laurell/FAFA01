% Inlämningsuppgift 1.3
% Björn Wictorin och Patrik Laurell

clear all
close all
clc
hold on

k = 1;
m = 1;
A = 0.5;
w0 = sqrt(k/m);
bunder = 0.4; %dämpande kraft vid svagt dämpad rörelse
bcrit = 2*m*w0; %dämpande kraft vid kritiskt dämpad rörelse
bover = 2 * bcrit; %dämpande kraft vid överdämpad rörelse
t = linspace(0,20,1000);

%---svagt dämpad rörelse---
wprime = w0*sqrt(1-(bunder/(2*m*w0))^2);
delta = atan(-bunder/(2*m*wprime));
A0 = 0.5/cos(delta);
xunder = @(t) A0*exp(-bunder/(2*m)*t).*cos(wprime*t + delta);
plot(t,xunder(t));

%---kritiskt dämpad rörelse
C1crit = bcrit/(4*m);
C2crit = 0.5;
xcrit = @(t) (C1crit*t + C2crit).*exp(-bcrit/(2*m)*t);
plot(t, xcrit(t), 'g');

%---överdämpade rörelse---
r1 = -bover/(2*m) + sqrt((bover/(2*m))^2-w0^2);
r2 = -bover/(2*m) - sqrt((bover/(2*m))^2-w0^2);
C1over = -r2/(2*(r1-r2));
C2over = 0.5-C1over;
xover = @(t) C1over*exp(r1*t) + C2over*exp(r2*t);
plot(t,xover(t),'r');
box on
xlabel('{\it T} / s');
ylabel('{\it x} / m');
legend('Svagt dämpad', 'Kritiskt dämpad', 'Överdämpad');