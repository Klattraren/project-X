close all
clear
clc

b=[1]; %bk koefficienter för LTI FIR system. I detta exemlep är det one sample difference.

N=512;%Antal sampel, välj jämn nummer
omega=linspace(-pi,pi,N);%skapa vektor med samplad frekvensaxeln mellan -pi och pi med N antal sampel
H=freqz(b,1,omega);%räknar fram frekvenssvaret H för FIR filtret (komplex)
absH=abs(H);%Magnituden för FIR filtret
argH=angle(H);%Fasen för FIR filtret i radianer

%Plotta Magnituden
subplot(2,1,1)
plot(omega,absH)
axis([-pi pi 0 max(absH)])
xlabel('Frequency [rad]')
ylabel('Magnitude')

%Plotta Fasen
subplot(2,1,2)
plot(omega,argH)
axis([-pi pi -pi pi])
xlabel('Frequency [rad]')
ylabel('Phase [rad]')

%Testsignal
n=0:N-1;%index vektorn
A=2; %Amplitud
l=300;%sampelposition
w=omega(l);%välj frekvensen för testsignalen ur den samplad omega vektorn (för N=512, börjar positiva omega från sampel 257)
fas=0; %Fas angiven i grader
s=A*cos(w*n+fas*(pi/180)); %signal med en frekvenskomponent

y=conv(s,b,'full');%faltnin av signalen med systemet
figure
plot(n,y(1:end-length(b)+1))
hold on

%Framräknad med ekv. 6.6 i kursboken kap.6-2
y2=absH(l)*A*cos(w*n+fas*(pi/180)+argH(l));
plot(n,y2,'--k')
hold off
xlabel('Time [s]')
ylabel('Amplitude')
legend('Convolved','Calculated')
