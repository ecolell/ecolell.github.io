
function y = sinuside(r)
	for i = 1:length(r)
		y(i) =  cos(i/4) * (i + r(i)/19) + i;
	endfor
endfunction

x = [0:0.01:1];
z = normrnd(25,40,1,length(x));
y = sinuside(z);
plot(x, y, 'b0');
drawLine(x(30),min(y)-1,x(30),y(30), 'x-r;A;');
drawLine(x(40),min(y)-1,x(40),y(40), '^-r;B;');
drawLine(x(100),min(y)-1,x(100),y(100), 'o-r;C;');

