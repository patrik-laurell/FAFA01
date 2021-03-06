clear all
close all

alpha = @(k,d,theta) 0.5*k*d.*sin(theta);
beta = @(k,a,theta) 0.5*k*a.*sin(theta);
IF = @(alpha,N) ((sin(N*alpha))./(N*sin(alpha))).^2;
SSF = @(beta) (sin(beta)./beta).^2;
I = @(alpha,beta,N,I0) I0 .* SSF(beta) .* IF(alpha,N);
k = @(lambda) 2*pi/lambda;

theta = linspace(-0.04,0.04,10000);

plot(theta, I(alpha(k(632*10^-9),10^-4,theta),beta(k(632*10^-9),50*10^-6,theta),2,1), 'r');
hold on
plot(theta, I(alpha(k(400*10^-9),10^-4,theta),beta(k(400*10^-9),50*10^-6,theta),2,1), 'b');
%plot(theta, SSF(beta(k(632*10^-9),50*10^-6,theta)), 'r');
%plot(theta, IF(alpha(k(632*10^-9),10^-4,theta),4), 'g');


% Variera antalet spalter och konstatera att det blir skarpare max
% Vissa max släcks ut då spatlbredd är multipel av spaltavstånd??
% Vad händer då spaltbredd resp. spaltavst. ändras?
% Variera antalet spalter och våglängd.
