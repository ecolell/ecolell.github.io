
function y = sinuside(r)
	for i = 1:length(r)
		y(i) =  sin(i/2.5) * (i/2 + r(i)/3);
	endfor
endfunction

function y = parabolize(r)
	for i = 1:length(r)
		y(i) =  (i^2/400 - i/2 + r(i)/12.50 + 31);
	endfor
endfunction

stx = [0:0.01:2];
z = normrnd(50,70,1,length(stx));
sty = parabolize(sinuside(z));
[mp, fit] = modelopolinomial(stx,sty);

subplot(3,1,1) % plot de 3 filas, 1 columna, situado en 1
hold on;
plot(stx, sty, 'b0;serie temporal;');
title("(a) Serie temporal original");
hold off;

subplot(3,1,2) % plot de 3 filas, 1 columna, situado en 2
hold on;
plot(stx, mp, strcat('b;tendencia polinomial ',num2str(fit(1)),'x^2',num2str(fit(2)),'x+',num2str(fit(3)),';'));
plot(stx, sty, 'b0;serie temporal;');
title("(b) Tendencia con el modelo polinomial");
hold off;

stsinmpy1 = sty - mp;

subplot(3,1,3) % plot de 3 filas, 1 columna, situado en 3
hold on;
plot(stx, stsinmpy1, strcat('b;serie temporal sin tendencia;'));
title("(c) Serie temporal original sin la tendencia");
hold off;
