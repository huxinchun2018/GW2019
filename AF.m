function s=AF(t,A,b,f0,f1)
s=A*cos(2*pi*f1*t).*sin(2*pi*f0*t+b*cos(2*pi*f1));
