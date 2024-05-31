%Exempel 9.2.1 i Hayes
clear all
close all
clc

N=500;

%zero mean and unit variance white noise
v=randn(1,N);

%Signal
x=zeros(N,1);
x(1)=v(1);
x(2)=1.2728*x(1)+v(2);
for n=3:N
x(n)=1.2728*x(n-1)-0.81*x(n-2)+v(n);
end

%[A,E] = lms(x,d,mu,nord,a0)
nord=2; %filter length

[A,E] = lms(x(1:end-nord),x(2:end),0.02,nord);

figure(1)
plot(0:N-3,A(:,1),'b',0:N-3,A(:,2),'r',0:N-3,1.2728*ones(1,N-2),'--k',0:N-3,-0.81*ones(1,N-2),'--k');
xlabel('Iteration')
ylabel('Coefficients')
title('LMS with {\mu}=0.02')
axis([0 N -1.5 1.5])

figure(2)
plot(0:N-3,E.^2)
xlabel('Iteration')
ylabel('Squared Error')
title('LMS with {\mu}=0.02')
axis([0 N 0 30])

[A,E] = lms(x(1:end-nord),x(2:end),0.004,nord);

figure(3)
plot(0:N-3,A(:,1),'b',0:N-3,A(:,2),'r',0:N-3,1.2728*ones(1,N-2),'--k',0:N-3,-0.81*ones(1,N-2),'--k');
xlabel('Iteration')
ylabel('Coefficients')
title('LMS with {\mu}=0.004')
axis([0 N -1 1.5])

figure(4)
plot(0:N-3,E.^2)
xlabel('Iteration')
ylabel('Squared Error')
title('LMS with {\mu}=0.004')
axis([0 N 0 30])