nmax = 6;
x = [1:1:nmax];
y = [1:1:nmax];
z=randn([length(x),length(y)]);

amount = zeros(1,9);
quantity = zeros(1,9);

hold on
axis([0,8,0,38])
xlabel("h")
ylabel("(Z(u+h)-Z(u))^2")
for i1 = x
	for j1 = y
		for i2 = x
			for j2 = y
				h = round(sqrt((i1-i2)**2+(j1-j2)**2));
				diff = (z(i1,j1) - z(i2,j2))**2;
				amount(h+1) = amount(h+1) + diff;
				quantity(h+1) = quantity(h+1) + 1;
				plot(h,diff,"^r;;")
			endfor
		endfor
	endfor
endfor
hold off



