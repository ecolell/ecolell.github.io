
function y = sinuside(r)
	for i = 1:length(r)
		y(i) =  cos(i/20) * (i + r(i)/3);
	endfor
endfunction

x = [0:0.01:1];
z = normrnd(50,70,1,length(x));
y = sinuside(z);
a0 = 0.10;
w0 = alisadoexponencial(y,a0);
a1 = 0.70;
w1 = alisadoexponencial(y,a1);

subplot(3,1,1) % plot de 3 filas, 1 columna, situado en 1
hold on;
plot(x, y, '-b0;serie temporal;');
plot(x, w0, strcat('-c;tendencia (alpha_0=',num2str(a0),');'));
plot(x, w1, strcat('-b;tendencia (alpha_1=',num2str(a1),');'));
title("(a) Serie temporal original");
hold off;

y0 = y - w0;
y1 = y - w1;

subplot(3,1,2) % plot de 3 filas, 1 columna, situado en 2
hold on;
plot(x, y0, strcat('c;serie temporal sin tendencia (alpha_0);'));
title("(b) Serie temporal original sin la tendencia para alpha_0");
hold off;

subplot(3,1,3) % plot de 3 filas, 1 columna, situado en 3
hold on;
plot(x, y1, strcat('b;serie temporal sin tendencia (alpha_1);'));
title("(c) Serie temporal original sin la tendencia para alpha_1");
hold off;
