%Calculates the numerical eignvalues and eigenvectors of the Jacobian
function [disc,lambda,rho,vec] = eigenvalues(mu2,mu3,eta,theta,omega1,omega2,sigma,Sstar,alpha)    

gprime0 = 1+1./alpha;
sgome = omega1 + Sstar.*gprime0;
a = 1;
b = -omega1 - Sstar.*gprime0;
c = omega1.*Sstar.*gprime0 + omega1.*Sstar.*gprime0.*mu2 + omega2.*mu2.*Sstar.*gprime0 + omega1.*sigma + omega2.*sigma;
disc = (sgome)^2 -4.*(omega1+omega2).*(mu2.*Sstar.*gprime0 - sigma);

lambda(1) = 0;
lambda(2) = -eta;
%lambda(3) = (sgome + disc.^(0.5))./2;
%lambda(4) = (sgome - (disc).^(0.5))./2

lambda(3) = (-b + ((b.^2 - 4.*a.*c).^0.5))./(2.*a);
lambda(4) = (-b - ((b.^2 - 4.*a.*c).^0.5))./(2.*a);

J = [0,-(1+mu2+mu3).*Sstar.*gprime0,0,eta.*theta;0,Sstar.*gprime0,-(omega1+omega2),0;0,mu2.*Sstar.*gprime0 - sigma,omega1,0;0,mu3.*Sstar.*gprime0 + sigma,omega2,-eta]
[vec,rho] = eig(J) %vec = eigenvectors, rho = eigenvalues
end