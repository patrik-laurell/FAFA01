% Uppgift 4a

%Semiempirisk formel för luftens brytningsidex som funktion av vakuumvåglängd3e i
%mikrometer
n = @(lvak) (8342.13 + 2406030./(130 - (1./lvak).^2) + 15997./(38.9 - (1./lvak).^2) + 10^8) ./ 10^8;

lvak = linspace(0.2 , 0.8, 500);

plot(lvak, n(lvak));


% Uppgift 4b

% Dispertionen av glassort Bk-7.
a1 = 2.721176;
a2 = -9.700709*10^-3;
a3 = 0.0110971;
a4 = 4.622809 * 10^-5;
a5 = 1.616105 * 10^-5;
a6 = -8.285043* 10^-7;
n = @(lambda) sqrt(a1 + a2.*(lambda.^2) + a3.*(lambda.^-2) + a4.*(lambda.^-4) + a5.*(lambda.^-6) + a6.*(lambda.^-8));

lambda = linspace(0.4, 0.8, 500);

figure(2);
plot(lambda, n(lambda));