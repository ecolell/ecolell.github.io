
function w = paint(y,z)
	for i = 1:length(z)
		w(i) = y(i) * z(i);
	endfor
endfunction

function w = F(y)
	aux = 0;
	for i = 1:length(y)
		aux = aux + y(i);
		w(i) = aux/length(y);
	endfor
endfunction

x=[0:0.001:1];
z = unidrnd(2,1,length(x))-1;
% Normal Distribution
y=normaldis(0.5,0.25,x);
y1 = paint(y,z);
y2 = F(y);

#1] Verificar que las etiquetas esten bien conceptualmente.
#2] Terminar de marcar el gráfico 2.

subplot(2,1,1) % plot de 2 filas, 1 columna, situado en 1
hold on;
plot(x,y, "b0;f(x);");
area(x(300:700),y(300:700),"facecolor", "r","keylabel","F_X(a)-F_X(b)");
drawLine(x(700),0,x(700),y(700), "^-r");
area(x(1:300),y(1:300),"facecolor", "b", "keylabel","F_X(a)");
drawLine(x(300),0,x(300),y(300), "^-b;P(a);");
title("(a) Distribucion de probabilidad");
hold off;


subplot(2,1,2) % plot de 2 filas, 1 columna, situado en 2
hold on;
plot(x,y2, "b0;F_X;");
drawLine(x(700),0,x(700),y2(700), "^-r;b;");
drawLine(x(300),0,x(300),y2(300), "^-b;a;");
title("(b) Funcion de distribucion");
hold off;
