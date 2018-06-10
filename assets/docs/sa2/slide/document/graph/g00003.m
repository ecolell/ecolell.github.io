x=[-0.5:0.001:0.5];

% Mesocurtica
y=normaldis(0,0.25,x);
plot(x,y,"b;f(x);");
plot(x(250),y(250),"^r;P(e_i);");
