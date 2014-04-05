%Inlämningsuppgift 1.2

clear all
close all
clc

%---Uppgift 1.2a)---
v0 = 10;
g = 9.81;
y = @(t, theta) v0*sind(theta)*t-(g*t.^2)/2;%y-led utan luftmotstånd
x = @(t, theta) v0*cosd(theta)*t;%x-led utan luftmotstånd
t = linspace(0, 3);
k = 0.01;
figure(1);
hold on
box on
%plottar kasten utan luftmotstånd
plot(x(t, 20), y(t, 20), 'k');
plot(x(t, 40), y(t, 40), 'k--');
plot(x(t, 60), y(t, 60), 'k:');
axis([0 11 0 5]);   %anger längd för x- och y-axlar
legend('20\circ', '40\circ', '60\circ');
xlabel('{\it x} / m', 'interpreter', 'latex');
ylabel('{\it y} / m', 'interpreter', 'latex');

%---Uppgift 1.2b)---

%x-led med luftmotstånd
xluftm = @(t,theta) v0*cosd(theta)/k*(1-exp(-k*t));
%y-led med luftmotstånd
yluftm = @(t,theta) (1/k)*((g/k + v0*sind(theta))*(1-exp(-k*t)) - g*t);

figure(2);
hold on
box on

%plottar kasten med luftmotstånd
plot(xluftm(t,20),yluftm(t,20),'k');
plot(xluftm(t,40),yluftm(t,40),'k--');
plot(xluftm(t,60),yluftm(t,60),'k:');
legend('20\circ', '40\circ', '60\circ');
xlabel('{\it x} / m', 'interpreter', 'latex');
ylabel('{\it y} / m', 'interpreter', 'latex');
axis([0 11 0 5]);   %anger längd för x- och y-axlar
