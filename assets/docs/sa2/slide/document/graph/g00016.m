
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

function z = diferencial(y, j)
	for i = 1+j:length(y)
		z(i-j) = y(i) - y(i-j);
	endfor
endfunction

stlx = [0:1:36];
stlz = normrnd(5,10,1,length(stlx));
stly = linealize(sinuside(stlz));
[stlw, stlh] = modelolineal(stlx,stly);

subplot(2,1,1) % plot de 2 filas, 1 columna, situado en 1
hold on;
plot(stlx, stly, strcat('b0;serie temporal (valores anuales);'));
plot(stlx, stlw, strcat('b;tendencia lineal (y = ', num2str(stlh(1)), 'x+', num2str(stlh(2)), ');'));
title("(a) Serie temporal original");
hold off;

j = 1;
diffstlx = stlx(j+1:length(stlx));
diffstly = diferencial(stly, j);
[diffstlw, diffstlh] = modelolineal(diffstlx,diffstly);

subplot(2,1,2) % plot de 2 filas, 1 columna, situado en 2
hold on;
plot(diffstlx, diffstly, strcat('r;serie temporal de los diferenciales ({/Symbol\Delta} y_t = y_t - y_{t-',num2str(j),'});'));
plot(diffstlx, diffstlw, strcat('b;tendencia lineal (y = ', num2str(diffstlh(1)), 'x+', num2str(diffstlh(2)), ');'));
title("(b) Serie temporal de diferenciales");
hold off;
