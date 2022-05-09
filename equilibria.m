%% varying theta and S(0) - investigating the equilibria as theta changes

clear all;clc;clf
theta = linspace(0,1,1000);

for i = 1:length(theta)
    [Y,t] = memes(0.9,0,0.1,0,0.1,0.01,0.01,0.05,0.05,0.25,theta(i),0.5);
    eq(i) = Y(1,length(Y));
end

hold on
plot(theta,eq,'LineWidth',3)
hold off
set(gca,'FontSize',20)
xlabel("theta")
ylabel("S*")
xlim([0,1])

%% Varying alpha - investigating the equilibria as alpha changes
clear all;clc;clf
b = 25;
alpha = linspace(0,b,b.*1000);

for i = 1:length(alpha)
    [Y,t] = memes(0.9,0,0.1,0,alpha(i),0.01,0.01,0.05,0.05,0.25,0.5,0.5);
    eq(i) = Y(1,length(Y));
end

plot(alpha,eq,'LineWidth',3)
set(gca,'FontSize',20)
xlabel("alpha")
ylabel("S*")
xlim([0,b])
%% varying S(0) - investigating the equilibria as S(0) changes
clear all;clc;clf
S = 0.01:0.01:0.99;


for i = 1:length(S)
    I = 1-S(i);
    [Y,t] = memes(S(i),0,I,0,0.1,0.01,0.01,0.05,0.05,0.25,0.5,0.5);
    eq(i) = Y(1,length(Y));
    i
end

M = mean(eq)
St = std(eq)

hold on
plot(S,eq,'LineWidth',3)
yline(M,'LineWidth',3)
hold off
set(gca,'FontSize',20)
legend("S*","Mean")
xlabel("S(0)")
ylabel("S*")
xlim([0,1])

%% polyfit for theta (1)
clear all;clc;clf
theta = linspace(0,1,1000);


for i = 1:length(theta)
    [Y,t] = memes(0.9,0,0.1,0,0.1,0.01,0.01,0.05,0.05,0.25,theta(i),0.5);
    eq(i) = Y(1,length(Y));
end
theta2 = linspace(0,0.7,700)
eq2 = eq(1:700)

a = polyfit(theta2,eq2,1); 
Sm = a(1) 
Sc = a(2)
y = polyval(a,theta);

plot(theta,eq,theta,y,'LineWidth',5)
set(gca,'FontSize',20)
xlabel("theta")
ylabel("S*")
legend("numerical solution","linear approximation")

error = norm(eq-y,2)
%% polyfit  for theta (2)

clear all;clc;clf
theta = linspace(0.8,1,200);

for i = 1:length(theta)
    [Y,t] = memes(0.9,0,0.1,0,0.1,0.01,0.01,0.05,0.05,0.25,theta(i),0.5);
    eq(i) = Y(1,length(Y));
end


a = polyfit(theta,eq,2); 
b = polyfit(theta,eq,1)
A = a(1) 
B = a(2)
C = a(3)
y = polyval(a,theta);
y2 = polyval(b,theta);
semilogy(theta,eq,theta,y2,theta,y,'LineWidth',5)
set(gca,'FontSize',20)
legend("Actual Value", "Linear Exponent", "Quadratic Exponent")

error = norm(eq-y2,2)
error = norm(eq-y,2)