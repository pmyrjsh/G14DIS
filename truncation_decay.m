%calculating the rate of decay
[Y,t] = memes;

Cat = 2 ; %(S = 1,E = 2,3 = I, 4 = R)

for i = 1:length(t) %truncating from the beginning
    if t(i) >= 20
        k = i;
        break
    end
end

for i = 1:length(t) %truncating the end
    if t(i) >= 72
        j = i;
    break
    end 
end

%Do the truncation and take logarithms
trunc = log(Y(Cat,k:j));
t = t(k:j);
plot(t,trunc)

%length(t)
%length(S_trunc)

%Calculating the linear approximation
a = polyfit(t,trunc,1); 
Sm = a(1) 
Sc = a(2)

y = polyval(a,t);
plot(t,trunc,t,y)
legend("numerical solution","exponential decay")

%% adding exponential decay to semi-log plot

[Y,t] = memes;

semilogy(t,Y,t,exp(-0.0386.*t),'LineWidth',3)
set(gca,'FontSize',20)
legend("S","E","I","R","e^{(-0.0386t)}")
xlabel("t")
ylabel("Population Percentage")


