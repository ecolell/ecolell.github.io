x = [0:0.01:10];
C = 4;
rango = 4;
a = rango/3;

mean = (1 - exp(- x ./a)) * C;

hold on;
axis([0,10,0,5]);
xlabel('h');
plot(x,mean, strcat('-r; {/Symbol\gamma}(h);'));
drawLine(rango,0,rango,C,"g;tope;")
drawLine(0,0.5,rango,0.5,"b;rango;")
hold off;
