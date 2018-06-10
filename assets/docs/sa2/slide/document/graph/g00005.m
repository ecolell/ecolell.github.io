x = [0:10:120];

subplot(1,3,1) % plot de 1 fila, 3 columnas, situado en 1
y1 = linealize(x, normrnd(20,10,1,length(x)),1);
z1 = modelolineal(x,y1);
hold on
plot(x, z1,'b');
plot(x, y1, '*r');
title('CC_P(X,Y)\approx +1');
hold off

subplot(1,3,2) % plot de 1 fila, 3 columnas, situado en 2
y2 = linealize(x, unidrnd(20,1,length(x)),0);
z2 = modelolineal(x,y2);
hold on
%plot(x, z2,'b');
plot(x, y2, '*r');
title('CC_P(X,Y)\approx 0');
hold off

subplot(1,3,3) % plot de 1 fila, 3 columnas, situado en 3
y3 = linealize(x, normrnd(20,10,1,length(x)),-1);
z3 = modelolineal(x,y3);
hold on
plot(x, z3,'b');
plot(x, y3, '*r');
title('CC_P(X,Y)\approx -1');
hold off


