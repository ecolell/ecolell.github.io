x = [1:1:9];
mean = zeros(1,9);

for i = x
	q = quantity(i);
	if q == 0
		q = 1;
	endif
	mean(i) = amount(i)/q;
endfor



hold on
axis([0,8,0,10])
xlabel("h")
ylabel("(Z(u+h)-Z(u))^2")
plot(x .- 1,mean)
hold off
