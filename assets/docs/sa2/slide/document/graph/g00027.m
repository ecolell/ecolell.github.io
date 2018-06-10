h=3; k=5; N=256;
t=(0:N)*2*pi/N;

hold on;
r=7;
plot( r*cos(t)+h, r*sin(t)+k,"r;Hipotesis Intrinseca;");
r=3;
plot( r*cos(t)+h, r*sin(t)+k-3,"b;Estacionalidad de Segundo Orden;");
axis('square', 'off')
hold off;
