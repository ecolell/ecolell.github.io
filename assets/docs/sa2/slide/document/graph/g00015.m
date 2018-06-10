
cr = y1;
k = 3;
l = (k-1)/2;
w = mediasmoviles(cr,l*2+1);
x1 = stx(l+1:length(stx)-l);
y1 = cr(l+1:length(cr)-l) - w;

subplot(3,1,1) % plot de 3 filas, 1 columna, situado en 1
hold on;
plot(stx, cr, strcat('g;serie temporal con ciclicidad;'));
title("(a) Serie temporal original sin la tendencia ni la estacionalidad");
hold off;

subplot(3,1,2) % plot de 3 filas, 1 columna, situado en 2
hold on;
plot(x1, w, strcat('r;ciclicidad (k=',int2str(k),');'));
plot(stx, cr, strcat('g;serie temporal filtrada con ciclicidad;'));
title("(b) Ciclicidad con el modelo de medias moviles");
hold off;

subplot(3,1,3) % plot de 3 filas, 1 columna, situado en 3
hold on;
plot(x1, y1, strcat('r;residualidad;'));
title("(c) Variacion Residual de una serie temporal");
hold off;
