%% FIR filter design example
%% parameter: wn
%Sampling frequency
fs = 2048 ;%Hz;

%Number of samples in impulse input sequence
nSamples = 256;

%Sampling times
timeVec = (0:(nSamples-1))/fs;

f1 = 100
f2 = 200
f3 = 300
sigVec = sgnlGenerate_sw(timeVec,0,[10,f1,0]) + ...
    sgnlGenerate_sw(timeVec,0,[5,f2,pi/6])+ ...
    sgnlGenerate_sw(timeVec,0,[2.5,f3,pi/4]);

plot(timeVec,sigVec)

%Length of data 
dataLen = timeVec(end)-timeVec(1);
%DFT sample corresponding to Nyquist frequency
kNyq = floor(nSamples/2)+1;
% Positive Fourier frequencies
posFreq = (0:(kNyq-1))*(1/dataLen);
% FFT of signal
fftSig = fft(sigVec);
% Discard negative frequencies
fftSig = fftSig(1:kNyq);

%Plot periodogram
figure;
plot(posFreq,abs(fftSig));
% plot(abs(fftSig));

%Filter order
fN = 30;
 
%Frequency values at which to specify
%the target transfer function
f = 0:2:1024;
 
%Target transfer function
targetTf = f.*(1024-f);
 
%Design the digital filter
b = fir2(fN,f/(fs/2),targetTf);

wn = [0.05,0.1]
b = fir1(fN,wn,'bandpass');

 
%Get the impulse response by letting the filter act on an impulse sequence
impVec = zeros(1,nSamples);
impVec(floor(nSamples/2))=1; %Impulse in the middle
impResp = fftfilt(b,impVec);
plot(timeVec,impResp)
 
%Get the transfer function: FFT of impulse response
designTf = fft(impResp);

%Plots
% figure;
hold on;
plot(f,targetTf);
kNyq = floor(nSamples/2)+1;
posFreq = (0:(kNyq-1))/(nSamples/fs);
plot(posFreq,abs(designTf(1:kNyq)));

% figure;
% plot(timeVec,impResp);

%% Application of the designed filter
% Signal parameters
a1=12;
a2=0.5;
a3=5;
a4=10; 
a5=pi/3;
timeVec2 = (0:2047)/fs;
% sigVec = crcbgenqcsig_sw(timeVec2,A,[a1,a2,a3,a4,a5]);
% sigVec = sgnlGenerate_sw(timeVec2,A,[10,100,0])+ ...
%     sgnlGenerate_sw(timeVec2,A,[5,200,pi/6])+ ...
%     sgnlGenerate_sw(timeVec2,A,[2.5,300,pi/4]);
figure;
plot(timeVec,sigVec);
hold on;
filtSigVec = fftfilt(b,sigVec);
axis tight;
plot(timeVec,filtSigVec*max(sigVec)/max(filtSigVec));
xlabel('Time (sec)');
title(['Filter order ', num2str(fN)]);

%%
% Make plots independently of the spectrogram function
[S,F,T]=spectrogram(filtSigVec, 256,80,[],fs);
figure;
imagesc(T,F,abs(S));axis xy;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');