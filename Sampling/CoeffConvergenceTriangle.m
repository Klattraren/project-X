
%Skriptet visar hur man estimerar ak parametrarna för en fyrkantsvåg
%med den Diskreta Fourier Serien, då vi bara har tillgång till en samplad
%periodisk signal f[n]
close all
clear all
clc

k=2; %välj koefficient ak
Nmax=100; %Maximal antal sampel under signalens ena period
ak=[]; %tom vektor för att spara olika estimat med 
T0 = 2*pi;  % New period corresponding to 2*pi
t = T0/2;
for N=4:4:Nmax %for-loop för att öka antal sampel N

    f = zeros(N);
    for i = 1:length(t)
        if ((-T0/2) <= t) && (t<0)
            f(i) = (-2*t)*T0;
        else
            f(i) = (2*t)/T0;
        end
    end

    akN=0;%nollställ parametern
    for n=0:N-1%for-loop för att skatta ak parameter
        %formeln tagen ur formelsamling s.12 i kap. 1.6.2
        %(ck är samma som ak i boken)
        akN=akN+f(n+1)*exp(-j*((2*pi)/N)*k*n); %itterativ summa för att estimera ak
    end
    ak(end+1)=akN/N;%spara estimatet (inte den mest effektivaste sättet)
end

plot(4:4:Nmax,ak_triangle(k)*ones(1,length(2:4:Nmax)),'r')%plotta den teoretiska värdet
hold on; %behåll förra plotten
plot(4:4:Nmax,ak); %plotta estimatet med de olika val av N
hold off
xlabel('N');
