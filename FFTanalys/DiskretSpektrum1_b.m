load signal.mat

N = 2048;
n=1:4500; %vektor med index

figure
plot(n,signal);
xlabel('Sampel')
ylabel('Amplitude')
title('Signal with multiple components')

N1=N;

%beräkna spektrum
S=abs(fft(signal,N)); %Obs, vi letar efter frekvensen, därav magnituden av spektrat fullt duglig
S=S(1:N1/2+1)/N1; %Reell data ger symetrisk spektrum, räcker halvan. Division med N för att få rätt amplitud

%plotta med koefficientr k på x-axeln
figure
stem((0:N1/2),S)
xlabel('Koefficient k')
ylabel('Magnitude')
title('Spectrum of the observed signal')

%plotta med radianer på x-axeln
figure
stem((0:N1/2)*(2*pi/N1),S)
xlabel('Frequency [rad]')
ylabel('Magnitude')
title('Spectrum of the observed signal')

