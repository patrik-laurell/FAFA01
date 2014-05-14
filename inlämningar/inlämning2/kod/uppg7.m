clear all
close all

%% Uppgift 7 - Diffraktion i spalt resp. cirkulär apparatur.

betaf = @(k,a,theta) 0.5*k*a*sin(theta); %Funktion för beräkning av beta.

%% 7a - Plottning av besselfunktion är första slaget.
x = linspace(0,20,1000);
plot(x, besselj(1,x));

%% 7b - Endimensionell intensitetsplot
I0 = 1;                                 %Intentsiteten vid theta=0
l = 5;    %Avstånd från apparatur till skärm
lambda = 600 * 10^-9;                   %Våglängd i m
a = 50 * 10^-6;                         %Spaltbredden i m
theta = linspace(-0.08,0.08);           % ----Vinkeln relativt normalen???----
beta = betaf(2*pi/lambda, a, theta);    %Beta beräknat från parametrar
I_slit = I0 * (sin(beta)./beta);        %Intensitet för spaltdiffraktion
I_circ = I0 * (besselj(1,beta)./beta);  %Intensitet för cirkulär öppning
x = l * tan(theta);

% Plottning av diffraktionsmönster
figure(2);
plot(x, I_slit);
hold on
plot(x, I_circ, 'r');
xlabel('x / \it{m}');
ylabel('I / \it{W/m^2}');
legend('Spalt', 'Cirkulär apparatur');

%TODO: Plotta intensitet längs linje på en skärm 5 m bort. Skala
%intensiteten på ljuset med P/(4pi*r^2)?

%% 7c - Flerdimensionell intensitetsplot med cirkulär öppning
l = 5;    %Avstånd från apparatur till skärm          
x = linspace(-0.5,0.5,1000);   
y = x;
[xg,yg] = meshgrid(x,y);            %Meshgrid motsvarande x och y koordinater på skärmen.
r = sqrt(xg.^2 + yg.^2);            %Avståndet från en punkt (x,y) på skärmen till origo.
theta = atan(r/5);                  %Vinkeln relativt normalen för en stråle som träffar (x,y) på skärmen.
beta = betaf(2*pi/lambda, a, theta);%Beta beräknat från parametrar
I = I0 * (besselj(1,beta)./beta);   %Intensiteten

%Plottning av intensitet
figure(3);
mesh(x,y,I);





