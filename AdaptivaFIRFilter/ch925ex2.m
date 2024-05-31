%Exempel from ch.9.2.5 fig. 9.16 in Hayes
clear
close all
clc

N=1001; %Antal sampel i signalen
n=0:N-1;

%signalen
d=sin(0.05*pi*n+0*(pi/180)); %ren signal
figure
plot(n,d);
xlabel('n')
ylabel('Amplitude')
title('Pure sine signal')
axis([0 N-1 -3 3])

%Noise v1 & v2 with increasing variance 0.25 to 6.25
v1=zeros(1,N);
v2=zeros(1,N);
var = linspace(0.25,6.25,N);
g=sqrt(var(1))*randn;
v1(1)=g;
v2(1)=g;
for i=2:N
    g=sqrt(var(i))*randn;
    v1(i)=0.8*v1(i-1)+g;
    v2(i)=-0.6*v2(i-1)+g;
end

x=d+v1; %signalen med brus
figure
plot(n,x);
xlabel('n')
ylabel('Amplitude')
title('Signal+noise v1')
axis([0 N-1 -10 10])

figure
plot(n,v2);
xlabel('n')
ylabel('Amplitude')
title('Ref signal v2')
axis([0 N-1 -10 10])

%[A,E] = nlms(x,d,beta,nord,a0)
[A,E] = nlms(v2,x,0.25,30);

figure
plot(n,E);
xlabel('n')
ylabel('Amplitude')
title('Error signal')
axis([0 N-1 -5 5])