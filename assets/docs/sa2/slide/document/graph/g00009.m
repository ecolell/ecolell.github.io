
function y = sinuside(r)
	for i = 1:length(r)
		y(i) =  sin(i/1.1) * (i/2 + r(i)/3);
	endfor
endfunction

function y = linealize(r)
	for i = 1:length(r)
		y(i) =  (2*i + r(i))/2;
	endfor
endfunction

x = [0:0.01:1];
z = normrnd(50,100,1,length(x));
y = linealize(sinuside(z));
[w, h] = modelolineal(x,y);

subplot(3,1,1) % plot de 3 filas, 1 columna, situado en 1
hold on;
plot(x, y, 'b0;serie temporal;');
title("(a) Serie temporal original");
hold off;

subplot(3,1,2) % plot de 3 filas, 1 columna, situado en 2
hold on;
plot(x, w, strcat('b;tendencia lineal (y = ', num2str(h(1)), 'x+', num2str(h(2)), ');'));
plot(x, y, 'b0;serie temporal;');
title("(b) Tendencia con el modelo lineal");
hold off;

y1 = y - w;

subplot(3,1,3) % plot de 3 filas, 1 columna, situado en 3
hold on;
plot(x, y1, strcat('b;serie temporal sin tendencia;'));
title("(c) Serie temporal original sin la tendencia calculada");
hold off;
