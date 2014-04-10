%Inlämningsuppgift 1.2
%Björn Wictorin och Patrik Laurell

clear all
close all
clc

%---Uppgift 1.2a)---
v0 = 10;
g = 9.81;
y = @(t, theta) v0*sind(theta)*t-(g*t.^2)/2;
x = @(t, theta) v0*cosd(theta)*t;
t = linspace(0, 3);
k = 1;
figure(1);
hold on
box on
plot(x(t, 20), y(t, 20));
plot(x(t, 40), y(t, 40), 'r');
plot(x(t, 60), y(t, 60), 'g');
axis([0 11 0 5]);
legend('20\circ', '40\circ', '60\circ');
xlabel('{\it x} / m', 'interpreter', 'latex');
ylabel('{\it y} / m', 'interpreter', 'latex');

%---Uppgift 1.2b)---

xluftm = @(t,theta) v0*cosd(theta)/k*(1-exp(-k*t));
yluftm = @(t,theta) (1/k)*((g/k + v0*sind(theta))*(1-exp(-k*t)) - g*t);
figure(2);
hold on
box on
plot(xluftm(t,20),yluftm(t,20));
plot(xluftm(t,40),yluftm(t,40),'r');
plot(xluftm(t,60),yluftm(t,60),'g');
legend('20\circ', '40\circ', '60\circ');
xlabel('{\it x} / m', 'interpreter', 'latex');
ylabel('{\it y} / m', 'interpreter', 'latex');
axis([0 6 0 3]);
