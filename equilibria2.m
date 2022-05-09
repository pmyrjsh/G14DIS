clc;clf;clear all

mu2 = linspace(0,1,100);
mu3 = linspace(0,1,100);

for i = 1:length(mu2)
    for j = 1:length(mu3)
        [Y,t] = memes(0.9,0,0.1,0,0.1,mu2(i),mu3(j),0.05,0.05,0.25,0.5,0.5);
        eq(i,j) = Y(1,length(Y));
    end
end

set(gca,'FontSize',20)
pcolor(mu2,mu3,eq)
xlabel("mu 2")
ylabel("mu 3")
