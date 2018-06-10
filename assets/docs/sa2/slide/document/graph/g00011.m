
function y = sinuside(r)
	for i = 1:length(r)
		y(i) =  sin(i/2.5) * (i/2 + r(i)/3);
	endfor
endfunction

function y = exponencialize(r)
	for i = 1:length(r)
		y(i) =  (e^(i/30) + r(i))/350;
	endfor
endfunction

function z = fitError(y,y1)
	h = (y-y1);
	aux = 0;
	for i = 1:length(h)
		aux = aux + h(i) ^ 2;
	endfor
	z = aux
endfunction

function y  = expfx (x, a, b)
	y = exp(a + b * x);
endfunction

x = [0:0.01:2];
z = normrnd(50,100,1,length(x));
y = exponencialize(sinuside(z));
[w, fit] = modeloexponencial(x,y);

subplot(3,1,1) % plot de 3 filas, 1 columna, situado en 1
hold on;
plot(x, y, 'b0;serie temporal;');
title("(a) Serie temporal original");
hold off;

subplot(3,1,2) % plot de 3 filas, 1 columna, situado en 2
hold on;
plot(x, w, strcat('b;tendencia polinomial (',num2str(fit(3)),') e^{(',num2str(fit(1)),')x^2+(',num2str(fit(2)),')x};'));
plot(x, y, 'b0;serie temporal;');
title("(b) Tendencia con el modelo exponencial");
hold off;

y1 = y - w;

subplot(3,1,3) % plot de 3 filas, 1 columna, situado en 3
hold on;
plot(x, y1, strcat('b;serie temporal sin tendencia;'));
title("(c) Serie temporal original sin la tendencia");
hold off;
