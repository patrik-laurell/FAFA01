clear all
close all

v = 340;
f = 200;
lambda = v/f;
d = 6;
r1 = 4;
r2 = @(theta) sqrt(d^2 + r1^2 + 2.*r1.*d.*cos(theta));

A0 = 1;

theta = linspace(0, 2*pi);

% Vägskillnaden som funktion av theta.
s = r2(theta) - r1;

%Fasförskjutningen mellan vågorna
delta = 2*pi*s./lambda;

A = 2*A0.*cos(0.5*delta);
plot(theta, A);