x = [0:0.01:10];
C = 4;
a = 3;

for i = 1:length(x)
	if x(i) <= a
		mean(i) = ( (3/2) * (x(i)/a) - (1/2) * (x(i)/a)**3 ) * C;
	else
		mean(i) = C;
	endif
endfor

hold on;
axis([0,10,0,5]);
xlabel('h');
plot(x,mean, strcat('-r; {/Symbol\gamma}(h);'));
drawLine(a,0,a,C,"g;tope;")
drawLine(0,0.5,a,0.5,"b;rango;")
hold off;
