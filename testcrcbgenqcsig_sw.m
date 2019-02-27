%% Plot the quadratic chirp signal
% Signal parameters
a1=12;
a2=0.5;
a3=5;
a4=10; 
a5=pi/3
A = 10;
% Instantaneous frequency after 1 sec is 
maxFreq = a1+2*a2+3*a3;
samplFreq = 5*maxFreq;
samplIntrvl = 1/samplFreq;
samplIntrvl = 0.001

% Time samples
timeVec = 0:samplIntrvl:5.0;
% Number of samples
nSamples = length(timeVec);

% Generate the signal
sigVec = crcbgenqcsig_sw(timeVec,A,[a1,a2,a3,a4]);

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
% fftSig = fftSig(1:kNyq);

%Plot periodogram
figure;
% plot(posFreq,abs(fftSig));
plot(abs(fftSig));
