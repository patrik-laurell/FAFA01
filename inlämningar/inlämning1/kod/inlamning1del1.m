%Inlämningsuppgift 1.1

clear all
close all
clc

%---Uppgift 1---
%---a---
T = [296 301 306 309 320 333 341 349 353];
R = [143.1 116.3 98.5 88.9 62.5 43.7 35.1 29.2 27.2];

figure(1);
hold on
plot(T, R, '+');
title('Resistans som funktion av tid');
xlabel('{\it T} / K', 'interpreter', 'latex');
ylabel('{\it R} / \Omega');

%---b---
figure(2);
hold on
plot(1./T, log(R));

%---c---
fit = polyfit(1./T, log(R), 1);     %approximerar ett förstagradspolynom
b = fit(1);
a = exp(fit(2));

%---d---
%testar huruvida värdena på a och b ger en graf som passar till värdena
f = @(T) a*exp(b./T);
figure(1);
temp = linspace(290,360);
plot(temp, f(temp), 'k');

%plottar den approximerade linjen
xmin = 2.8e-3;
xmax = 3.5e-3;
figure(2);
plot(linspace(xmin, xmax), polyval(fit,linspace(xmin, xmax)), 'r');
