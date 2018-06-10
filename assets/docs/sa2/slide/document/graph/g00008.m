
function y = sinuside(r)
	for i = 1:length(r)
		y(i) =  cos(i/20) * (i + r(i)/3);
	endfor
endfunction

x = [0:0.01:1];
z = normrnd(50,70,1,length(x));
y = sinuside(z);
l = 10;
w = mediasmoviles(y,l*2+1);
x1 = x(l+1:length(x)-l);

subplot(2,1,1) % plot de 2 filas, 1 columna, situado en 1
hold on;
plot(x1, w, strcat('b;tendencia (k=',num2str(l*2+1),');'));
plot(x, y, 'b0;serie temporal;');
title("(a) Serie temporal original")
hold off;

y1 = y(l+1:length(x)-l) - w;

subplot(2,1,2) % plot de 2 filas, 1 columna, situado en 2
hold on;
plot(x1, y1, strcat('b;serie temporal sin tendencia;'));
title("(b) Serie temporal original sin la tendencia")
hold off;
