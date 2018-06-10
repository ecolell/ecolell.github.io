

function [w, aux] = desestacionalize(x, y, a)
	i = 1;
	while (x(i) - x(1) < a)
		i = i + 1;
	endwhile
	aux = zeros(i,1);
	count = zeros(i,1);
	for h = 1:i %todos los estados de 1 ciclo
		for j = h:i:length(x) %un estado de todos los ciclos
			aux(h) = aux(h) + y(j);
			count(h) = count(h) + 1;
		endfor
		aux(h) = aux(h) / count(h);
	endfor
	for k = 1:length(x)-1
		in = mod(k,i)+1;
		w(k+1) = aux(in);
	endfor
endfunction

subplot(3,1,1) % plot de 3 filas, 1 columna, situado en 1
hold on;
plot(stx, stsinmpy1, strcat('b;serie temporal sin tendencia;'));
title("(a) Serie temporal original sin la tendencia");
hold off;

#1] Calcular el tamaño del ciclo (deterministicamente) -recorrer los datos y buscar errores mínimos-. (para lograr una aproximación realizar pruebas)

m = 0.15;
[ve, igve] = desestacionalize(stx, stsinmpy1, m);

subplot(3,1,2) % plot de 3 filas, 1 columna, situado en 2
hold on;
plot(stx, ve, strcat('g;estacionalidad;'));
plot(stx, stsinmpy1, 'b;serie temporal sin tendencia;');
title("(b) Estacionalidad mediante IGVE");
hold off;

y1 = stsinmpy1 - ve;

subplot(3,1,3) % plot de 3 filas, 1 columna, situado en 3
hold on;
plot(stx, y1, strcat('g;serie temporal sin tendencia ni estacionalidad;'));
title("(c) Serie temporal original sin la tendencia y desestacionalizada");
hold off;
