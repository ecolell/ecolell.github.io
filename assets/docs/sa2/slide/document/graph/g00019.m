
x = [0:1:30];
maximum = 10;
gammah = maximum*(1-exp(-x/6));
c0 = ones(1,length(x)) * maximum;
for i = 1:length(gammah)
	ch(i) = c0(i) - gammah(i);
endfor

hold on
axis([0,30,0,12])
xlabel("h")
plot(0,maximum,"go;C(0);")
plot(x,c0,"g;f(h) = C(0);")
plot(x,gammah,strcat('r; {/Symbol\gamma}(h);'))
plot(x,ch,"b;C(h);")
hold off



