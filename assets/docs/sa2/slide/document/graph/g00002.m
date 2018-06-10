x=[0:0.001:1];

% Platicurtica
y=normaldis(0.5,0.5,x);
plot(x,y, "r;Platicurtica;");
% Mesocurtica
y=normaldis(0.5,0.25,x);
plot(x,y, "g;Mesocurtica (Normal);");
% Leptocurtica
y=normaldis(0.5,0.15,x);
plot(x,y,"b;Leptocurtica;");
