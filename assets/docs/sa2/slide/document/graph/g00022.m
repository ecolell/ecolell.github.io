x = [1:1:11];
mean = ones(1,11) .* 4;

hold on
axis([0,10,0,5])
xlabel("h")
plot(x .- 1,mean, strcat('r; {/Symbol\gamma}(h);'))
plot(0,4, "or;;");
plot(0,0, "*r;;");
hold off
