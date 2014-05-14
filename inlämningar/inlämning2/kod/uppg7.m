clear all
close all

%% Uppgift 7 - Diffraktion i spalt resp. cirkul�r apparatur.

betaf = @(k,a,theta) 0.5*k*a*sin(theta); %Funktion f�r ber�kning av beta.

%% 7a - Plottning av besselfunktion �r f�rsta slaget.
x = linspace(0,20,1000);
plot(x, besselj(1,x));

%% 7b - Endimensionell intensitetsplot
I0 = 1;                                 %Intentsiteten vid theta=0
l = 5;    %Avst�nd fr�n apparatur till sk�rm
lambda = 600 * 10^-9;                   %V�gl�ngd i m
a = 50 * 10^-6;                         %Spaltbredden i m
theta = linspace(-0.08,0.08);           % ----Vinkeln relativt normalen???----
beta = betaf(2*pi/lambda, a, theta);    %Beta ber�knat fr�n parametrar
I_slit = I0 * (sin(beta)./beta);        %Intensitet f�r spaltdiffraktion
I_circ = I0 * (besselj(1,beta)./beta);  %Intensitet f�r cirkul�r �ppning
x = l * tan(theta);

% Plottning av diffraktionsm�nster
figure(2);
plot(x, I_slit);
hold on
plot(x, I_circ, 'r');
xlabel('x / \it{m}');
ylabel('I / \it{W/m^2}');
legend('Spalt', 'Cirkul�r apparatur');

%TODO: Plotta intensitet l�ngs linje p� en sk�rm 5 m bort. Skala
%intensiteten p� ljuset med P/(4pi*r^2)?

%% 7c - Flerdimensionell intensitetsplot med cirkul�r �ppning
l = 5;    %Avst�nd fr�n apparatur till sk�rm          
x = linspace(-0.5,0.5,1000);   
y = x;
[xg,yg] = meshgrid(x,y);            %Meshgrid motsvarande x och y koordinater p� sk�rmen.
r = sqrt(xg.^2 + yg.^2);            %Avst�ndet fr�n en punkt (x,y) p� sk�rmen till origo.
theta = atan(r/5);                  %Vinkeln relativt normalen f�r en str�le som tr�ffar (x,y) p� sk�rmen.
beta = betaf(2*pi/lambda, a, theta);%Beta ber�knat fr�n parametrar
I = I0 * (besselj(1,beta)./beta);   %Intensiteten

%Plottning av intensitet
figure(3);
mesh(x,y,I);





