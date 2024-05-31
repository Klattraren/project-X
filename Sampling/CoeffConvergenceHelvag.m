%Skriptet visar hur man estimerar ak parametrarna för en fyrkantsvåg
%med den Diskreta Fourier Serien, då vi bara har tillgång till en samplad
%periodisk signal f[n]
close all
clear all
clc

k=10; %välj koefficient ak
Nmax=1000; %Maximal antal sampel under signalens ena period
T0 = 2*pi;
t = linspace(0, T0, Nmax);
ak=[]; %tom vektor för att spara olika estimat med 


for N=4:4:Nmax %for-loop för att öka antal sampel N
    f = zeros(N);
    for i = 1:length(N)
        f(i) = abs(sin(2*pi*i/T0));
    end

    akN=0;%nollställ parametern
    for n=0:N-1%for-loop för att skatta ak parameter
        %formeln tagen ur formelsamling s.12 i kap. 1.6.2
        %(ck är samma som ak i boken)
        akN=akN+f(n+1)*exp(-j*((2*pi)/N)*k*n); %itterativ summa för att estimera ak
    end
    ak(end+1)=akN/N;%spara estimatet (inte den mest effektivaste sättet)
end

plot(4:4:Nmax,ak_helvag(k)*ones(1,length(2:4:Nmax)),'r')%plotta den teoretiska värdet
hold on; %behåll förra plotten
plot(4:4:Nmax,ak); %plotta estimatet med de olika val av N
hold off
xlabel('N');
