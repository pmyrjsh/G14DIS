%%Solving the system of ODE's
function [Y,t,equil] = memes(S0,E0,I0,R0,alpha,mu2,mu3,omega1,omega2,sigma,theta,eta)
if nargin==0
    S0=0.9;E0=0;I0=0.1;R0=0;
    alpha=1;mu2=.01;mu3=.01;
    omega1=0.05;omega2=0.05;
    sigma=0.25;theta=0.5;eta=0.5;
    
end
g = @(t,I) I.*(1+alpha)./(alpha + I);
time= [0 150];

IC = [S0 ; E0 ; I0; R0];

Fs = @(t,x) -(1+mu2+mu3).*x(1).*g(t,x(3)) + theta.*eta.*x(4);
Fe = @(t,x) x(1).*g(t,x(3)) - (omega1+omega2).*x(2);
Fi = @(t,x) mu2.*x(1).*g(t,x(3)) + omega1.*x(2) - sigma.*x(3);
Fr = @(t,x) mu3.*x(1).*g(t,x(3)) + omega2.*x(2) + sigma.*x(3) - eta.*x(4);

Sys = @(t,x)[Fs(t,x) ; Fe(t,x); Fi(t,x); Fr(t,x)];

options=odeset('RelTol',0.01,'AbsTol',0.01,'NonNegative',1:4);
sol = ode15s(@(t,x) Sys(t,x), time, IC); %add options back at the end

t=sol.x;
Y=sol.y;

N = Y(1,:) + Y(2,:) + Y(3,:) +Y(4,:);
equil = 1-eta.*(1-theta).*trapz(t,Y(4,:));

%hold on
%plot(t,Y,t,N,'LineWidth',3)
%yline(equil,'LineWidth',3)
%set(gca,'FontSize',20)
%legend("S","E","I","R","N")
%xlabel("t")
%ylabel("Population Percentage")
%hold off
end