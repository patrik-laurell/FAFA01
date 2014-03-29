clear all
close all
clc

% ---- UPPGIFT 1 ----
T = [296 301 306 309 320 333 341 349 353];
R = [143.1 116.3 98.5 88.9 62.5 43.7 35.1 29.2 27.2];
plot(T,R,'+');
xlabel('{\it R} / \Omega');
ylabel('{\it T} / K', 'interpreter', 'latex');

