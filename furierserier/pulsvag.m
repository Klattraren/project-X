%Skriptet demosntrerar hur man syntetiserar en periodisk signal med den
%ändliga Fourier Serier Syntesen med N ak koefficienter. 
close all
clear
clc

N=512; %Antal koefficienter i syntesen 
T0=4; %Periodtiden för signalen
t=0:0.01:3*T0; %tidsvektorn
tx = 3;

%här skapas original signal i detta fall en pulsvåg som ändras beroende på
%tx alltså pulsen
original = zeros(size(t));
for i = 1:length(t)
    on_off = mod(t(i)+(tx/2),T0);
    if  (on_off <= tx)
        original(i) = 1;
        1
    else
        0
    end
end

%Syntes for-loopen med plott för varje tillagd komponent ak
%fyrkantsvågen har 0 i jämna k komponenter.
xN=(tx/T0)*ones(size(t)); %start på signalen xN(t) med första koefficienten a0
for k=1:N
    %formeln för ak tagen från Exempel C-1 i boken
    %skriven på formeln enligt exercise C.3 (reell signal)
    ak=sin((pi * k * tx)/T0)/(pi * k);
    xN=xN+ 2 * ak * cos(2*pi/T0*k*t); %addition av ak
    
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