clear all
close all

% Uppgift 7

% 7a - Plottning av Besselfunktion
x = linspace(0,25,1000);
plot(x,  besselj(1,x));