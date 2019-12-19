clc;
clear all
close all

% Convert excel to audio
b=xlsread('18MO01.xlsx');
% audiowrite('anbu1.wav',b,1000);
fs=8000;

b = b(1:100,:);
% [x,fs]= audioread('anbu1.wav');
t=linspace(0,length(b)/fs,length(b));

%periodogram
[s,f] = periodogram(b,[],1024,8000);

plot(f(1:70,:),s(1:70,:))
xlabel('Frequency'),ylabel('Power in db');
title('Normal Periodogram');

%Modified Periodogram
[Sm,fm]=periodogram(b,rectwin(length(t)),1024,8000);
figure
plot(fm,Sm);
xlabel('Frequency'),ylabel('Power in db');
title('Modified Periodogram');

%Welch method
b1= xlsread('18MO01.xlsx');
[S0,f0] = pwelch(b1);
figure
plot(f0(1:2000,:),S0(1:2000,:));
xlabel('Frequency'),ylabel('Power in db');
title('Periodogram using Welch method');


%hamming window
[s1,f1] = periodogram(b,hamming(length(t)),1024,8000);
figure
plot(f1,s1);
xlabel('Frequency'),ylabel('Power in db');
title('Periodogram using Hamming window');

%cheb window
[s2,f2] = periodogram(b,chebwin(length(t)),1024,8000);
figure
plot(f2,s2);
xlabel('Frequency'),ylabel('Power in db');
title('Periodogram using chebysev window');

%kaiser window
[s3,f3] = periodogram(b,kaiser(length(t)),1024,8000);
figure
plot(f3,s3);
xlabel('Frequency'),ylabel('Power in db');
title('Periodogram using Kaiser window');

%bartlett window
[s4,f4] = periodogram(b,bartlett(length(t)),1024,8000);
figure
plot(f4,s4);
xlabel('Frequency'),ylabel('Power in db');
title('Periodogram using Bartlett window');

%heart sound with respect to time
figure
plot(b);
xlabel('Time in seconds'),ylabel('Amplitude');
title('Heart beat with respect to time');