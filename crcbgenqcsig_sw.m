function sigVec = crcbgenqcsig(dataX,snr,qcCoefs)
% Generate a quadratic chirp signal
% S = CRCBGENQSIG(X,SNR,C)
% Generates a quadratic chirp signal S. X is the vector of
% time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S and C is the vector of
% three coefficients [a1, a2, a3] that parametrize the phase of the signal:
% a1*t+a2*t^2+a3*t^3. 

%Soumya D. Mohanty, May 2018

% sigVec = qcCoefs(1)*exp(-(dataX-qcCoefs(2)).^2/(2*qcCoefs(3)^2)).*sin(2*pi*qcCoefs(4)*dataX + qcCoefs(5));
sigVec = qcCoefs(1)*cos(2*pi*qcCoefs(4)*dataX).*sin(2*pi*qcCoefs(3)*dataX + qcCoefs(2)*cos(2*pi*qcCoefs(4)*dataX));
% sigVec = sin(2*pi*phaseVec);
% sigVec = snr*sigVec/norm(sigVec);


