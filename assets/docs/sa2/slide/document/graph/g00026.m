x = [0:0.01:10];
C1 = 0.5;
C2 = 1;
lambda1 = 1;
lambda2 = 0.5;

mean1 = C1*x.**lambda1;
mean2 = C2*x.**lambda2;

hold on;
axis([0,10,0,5]);
xlabel('h');
plot(x,mean1, strcat('-r; {/Symbol\gamma}(h),{/Symbol\lambda}=1;'));
plot(x,mean2, strcat('-b; {/Symbol\gamma}(h),{/Symbol\lambda}=0.5;'));
hold off;
