%Skriptet demosntrerar hur man syntetiserar en periodisk signal med den
%ändliga Fourier Serier Syntesen med N ak koefficienter. 
close all
clear
clc

N=70; %Antal koefficienter i syntesen 
T0=4; %Periodtiden för signalen
t=0:0.01:3*T0; %tidsvektorn

%här skapas original signal i detta fall en ren fyrkantsvåg
original = zeros(size(t));
for i = 1:length(t)
    t_mod = mod(t(i), T0);
    if t_mod <= T0 / 2
        original(i) = (2 / T0) * t_mod;
    else
        original(i) = (2 / T0) * (T0 - t_mod);
    end
end

%Syntes for-loopen med plott för varje tillagd komponent ak
%fyrkantsvågen har 0 i jämna k komponenter.
xN = 0.5 * ones(size(t)); %start på signalen xN(t) med första koefficienten a0
for k=1:N
    if mod(k,2) == 0
        ak = 0;
    elseif mod(k,2) == 1
        ak = -2/((pi^2) * (k^2));
    end

    xN=xN+2*ak*cos(2*pi/T0*k*t); %addition av ak
    
    
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