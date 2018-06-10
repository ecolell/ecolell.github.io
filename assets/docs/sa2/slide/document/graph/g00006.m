
function y = sinuside(r)
	for i = 1:length(r)
		y(i) =  cos(i/20) * (i + r(i)/3);
	endfor
endfunction

x = [0:0.01:1];
z = normrnd(50,30,1,length(x));
y = sinuside(z);
plot(x, y, 'b0');
