%% Plot the AM-FM sinusoid signal

% xinchun hu
% Signal parameters
f0=5;
f1=10;
b=0.5;

% Time samples
samplIntrvl=0.001;
timeVec = 0:samplIntrvl:12;

Ampli=12;

% Number of samples
nSamples = length(timeVec);

% Generate the signal call signal model
sigVec = AM_FMsinusoid(Ampli,timeVec,b,f0,f1);  

%Plot the signal 
figure;
plot(timeVec,sigVec)

%Plot the periodogram
%--------------
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
