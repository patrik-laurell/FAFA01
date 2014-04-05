clear all
close all
clc

% Use to plot vertical line 
% line([hl hl], [-A A], 'Color', [0 .8 0]);

A = 0.014;
d = 0;
k = 40;
m = 0.1;
b = 0.4;
hl = log(4)*m/b;    %Halflife constant
w0 = sqrt(k/m);
tao = b/(2*m);
wprime = sqrt(k/m - (b/(2*m))^2);

t = linspace(0,2,1000);
x = @(t) A*cos(w0*t);
v = @(x) -A*w0*sin(w0*t);
xdamped = @(t) A*exp(-tao*t).*cos(wprime*t);
vdamped = @(t) -A*b/(2*m)*exp(-b/(2*m)*t).*cos(wprime*t) - A*wprime*exp(-b/(2*m)*t).*sin(wprime*t);
assym = @(t) A*exp(-b/(2*m)*t);

% ----UPPG 1----
figure(1);
subplot(1,2,1);
plot(t,x(t));
xlabel('{\it t} / s','interpreter','latex');
ylabel('{\it x} / m','interpreter','latex');

subplot(1,2,2);
hold on
plot(x(t),v(x(t)),'r');
xlabel('{\it x} / m','interpreter','latex');
ylabel('{\it v} / (m/s)','interpreter','latex');

% ----UPPG 2----
figure(2);

subplot(1,2,1);
hold on
plot(t,xdamped(t));
plot(t,assym(t),'k--');  % Plot pos. assymptot
plot(t,-assym(t),'k--'); % Plot neg. assymptot
plot(hl*[1 2 3 4 5],xdamped(hl*[1 2 3 4 5]),'o'); %Plot mulitple o:s at halflife times
xlabel('{\it t} / s','interpreter','latex');
ylabel('{\it x} / m','interpreter','latex');

subplot(1,2,2);
plot(xdamped(t),vdamped(t));
xlabel('{\it x} / m','interpreter','latex');
ylabel('{\it v} / (m/s)','interpreter','latex');
