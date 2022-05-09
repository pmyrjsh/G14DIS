%% investigates how alpha changing affects the shape of E
clear all;clc;clf
alpha = 1:3:10;

for i = 1:length(alpha)
    [Y,t] = memes(0.9,0,0.1,0,alpha(i),0.01,0.01,0.05,0.05,0.25,0.5,0.5);
    hold on
    plot(t,Y(2,:),'LineWidth',3)
    hold off
end

xlabel("t")
ylabel("E")
legend("alpha=1","alpha=4","alpha=7","alpha = 10")
xlim([0,50])

%% plots the graph of g(I;alpha)
clear all;clc;clf
alpha = [0.1,0.5,1,2];
I = 0:0.01:1;
for t = 1:length(alpha)
    a = alpha(t);
   g = gI(a);
   hold on
   plot(I,g,'Linewidth',3)
   hold off
end

xlabel("I")
ylabel("g(I)")
legend("alpha = 0.1", "alpha = 0.5", "alpha = 1", "alpha = 2",'location','best')
set(gca,'FontSize',20)