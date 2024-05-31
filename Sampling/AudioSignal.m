%Demo av hur man spelar in egen audiodata med datorns mikrofoner direkt in i MATLAB.
%För Mac användare om skriptet inte fungerar se följande lösning:
%https://se.mathworks.com/matlabcentral/answers/733408-matlab-does-not-record-audio
clear
close all
clc

%Parametrar
Fs=48000;%Samplingsfrekvensen i Hz, (1000 till 200000 i Josefs dator)
nBits=16;  %Antal bitar som går att välja 8, 16 och 24
nChannels=2; %Antal kanaler, en kanal per mikrofon
RecTime=10; %Inspelningstid i sec

myVoice = audiorecorder(Fs,nBits,nChannels);

%Skapar utskrift i Command Window för att markera när inspelning startar
%och slutar.
disp('Start speaking.');%inspelning startar en liten stund efter att denna visas i command fönstret
recordblocking(myVoice, RecTime);%startar inspelning av audio och pausar skriptet
disp('End of recording.');

%play(myVoice);%Spelar upp den inspelat data

%Extrahera inslepad data ur objektet myVoice
data = getaudiodata(myVoice);%vid val av fler kanaler får vi en matris 
audio=data(:,1);%Ta data för första kanalen

%sound() och soundsc() är två andra funktioner som kan användas för att
%spela upp ljud. Om någon av dessa ska användas kommentera bort play() på
%rad 22. Det går att välja andra alternativ för Fs och nBits för att
%manipulera inspelningen.

%sound(audio,Fs,nBits);
soundsc(audio,Fs,nBits);

t=0:1/Fs:RecTime-1/Fs;%Tidsvektor
%plottar audio tidssignalen
figure(1)
plot(t,audio);
xlabel('Time (secs)');
ylabel('Amplitude')

%plottar frekvensinnehållet (kräver Signal Processing Toolbox)
%mer om detta senare i kursen när vi behandlar kapitel 8
%här är den med bara för att ge lite inblick i frekvensinnehållet
figure(2)
spectrogram(audio,Fs/4,Fs/8,[],Fs,'yaxis')