clear all
close all

% Uppgift 5

v = 340;
f = 200;
lambda = v/f;
P = 10;
d = 6;

%Deklarering av avstånds variabler.
r1 = 4;
r2 = @(theta) sqrt(d^2 + r1^2 + 2.*r1.*d.*cos(theta));

theta = linspace(0, 2*pi, 5000);

%Vägskillnaden som funktion av theta.
s = r2(theta) - r1;

%Fasförskjutningen mellan vågorna
delta = 2*pi*s./lambda;

%Intensitets beräkning
I1 = P / (4*pi*r1^2);
I2 = P ./ (4*pi*r2(theta).^2);
I = I1 + I2 + 2*sqrt(I1.*I2).*cos(delta);
plot(theta, I);
