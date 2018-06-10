autoload("unidrnd", "/m/statistics/distributions/unidrnd.m")
autoload("normrnd", "/m/statistics/distributions/normrnd.m")


function y = normaldis(m,s,x)
	%m: media de la distribución.
	%s: desviación estándard de la distribución.
	%x: vector de x's.
	for i = 1:length(x)
		y(i)= ((1/(s*sqrt(2*pi)))*e^(-((x(i)-m)^2)/(2*s^2)));
	endfor
endfunction

function drawLine(x0, y0, x1, y1, c)
	plot ([x0; x1], [y0; y1], c);
endfunction

function y = linealize(x,z,a)
	for i = 1:length(z)
		y(i) = a*x(i) + z(i);
	endfor
endfunction

%%% SMOOTH MODELS %%%

function y = mediasmoviles(h, k)
	l = (k-1)/2;
	for i = l+1:length(h)-l
		m = h(i-l:i+l);
		y(i-l) = sum(m) / k;
	endfor
endfunction

function [w, h] = modelolineal(x , y)
	h = polyfit(x,y,1);
	w = h(1) * x + h(2);
endfunction

function [w, fit] = modelopolinomial(x, y)
	[fit, h] = polyfit(x,y,2);
	w = h.yf;
endfunction

function [w, fit] = modeloexponencial(x, y)
	z = log(y);
	[fit, h] = polyfit(x,z,2);
	fit(3) = exp(fit(3));
	w = exp(h.yf);
endfunction

function w = alisadoexponencial(y, a)
	for i = 1:length(y)
		if i > 1
			w(i) = w(i-1) + a * (y(i)-w(i-1));
		else
			w(i) = y(i);
		endif
	endfor
endfunction

