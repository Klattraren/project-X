%Exempel from ch.9.2.5 fig. 9.17 in Hayes
clear
close all
clc

N=1000; %Antal sampel i signalen
n0=25;
n=0:N-1+n0;

%signalen
d=sin(0.05*pi*n-130*(pi/180)); %ren signal

%WGN brus
m=0; %DC nivå är noll men kan ändras
variance=0.25;
g=m + sqrt(variance)*randn(1,N+n0);

%Noise v1
v1=zeros(1,N+n0);
v1(1)=g(1);
for i=2:N+n0
    v1(i)=0.5*v1(i-1)+g(i);
end
%v1=m + sqrt(variance)*randn(1,N+n0);

x=d+v1; %signalen med brus
figure
plot(n(1:N),x(n0+1:end));
hold on
plot(n(1:N),d(n0+1:end),'--r');
hold off
xlabel('n')
ylabel('Amplitude')
title('Signal+noise v1')
axis([0 N -3 3])

%[A,E] = nlms(x,d,beta,nord,a0)
[A,E] = nlms(x(1:N),x(n0+1:end),0.05,12);% funkar ok med mindre B, och längre ordning av filtret
figure
plot(n(1:N),x(n0+1:end)-E);
hold on
plot(n(1:N),d(n0+1:end),'--r');
hold off
xlabel('n')
ylabel('Amplitude')
title('d^\^ = signal x - error E')
axis([0 N -3 3])

%Spektrum plot för att tydligare se att bruset har gått ner
figure
plot(abs(fft(x(n0+1:end))),'r')%ursprunglig
hold on
plot(abs(fft(x(n0+1:end)-E)),'b')%filtrerad
hold off
title('Simple FFT on the two signals')