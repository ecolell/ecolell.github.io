x=[0:0.001:1];

% Asimetrica a la derecha
y=normaldis(0.25,0.25,x);
plot(x,y, "r;Asimetrica a la derecha;");
% Normal
y=normaldis(0.5,0.25,x);
plot(x,y, "g;Normal;");
% Asimetrica a la izquierda
y=normaldis(0.75,0.25,x);
plot(x,y,"b;Asimetrica a la izquierda;");
