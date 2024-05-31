%Skriptet demosntrerar hur man syntetiserar en periodisk signal med den
%ändliga Fourier Serier Syntesen med N ak koefficienter. 
close all
clear
clc

N=40; %Antal koefficienter i syntesen 
T1 = 8;
T0=T1/2; %Periodtiden för signalen
t=0:0.01:3*T0; %tidsvektorn

%här skapas original signal i detta fall en ren helvågsriktad våg 3.28
original= abs(sin(2*pi*t/T1));

%Syntes for-loopen med plott för varje tillagd komponent ak
%fyrkantsvågen har 0 i jämna k komponenter.
xN= 2/pi * ones(size(t)); %start på signalen xN(t) med första koefficienten a0
for k=1:N
    %Formel för ak 3.34
    ak = 2 / (pi * (1 - (4 * (k^2))));
    %Formel för x(t)
    xN = xN + ((2*ak) * (cos((2 * pi * k * t) / T0)));
    
    %plottning av den syntetiserad signal över den ursprungliga signalen
    plot(t,original,'k')
    hold on
    plot(t,xN)
    axis([0 12 -0.2 1.2])
    title(num2str(k))
    hold off
    %pausa med 0.25s
    pause(0.25)
end