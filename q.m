function s=q(a,t,t0,ks,f0,fi0)
s=a*exp(-(t-t0).^2/(2*ks^2)).*sin(2*pi*f0*t+fi0);