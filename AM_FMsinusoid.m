function sigVec=AM_FMsinusoid(A,t,b,f0,f1)
% Generate a Sine-Gaussian signal
%sigVec=A*exp(-(t-param(1)).^2/(2*sigma^2)).*sin(2*pi*param(2)*t+param(3));
sigVec=A*cos(2*pi*f1*t).*sin(2*pi*f0*t+b*cos(2*pi*f1*t));