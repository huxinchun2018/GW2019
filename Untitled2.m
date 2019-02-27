A=1;
b=1;
f0=2;
f1=5;
t=0:0.001:10;
datelen=t(end)-t(1);
nsample=length(t);
s=AF(t,A,b,f0,f1);
figure;
plot(t,s)

kNyp=floor(nsample/2)+1;
posfre=(0:kNyp-1)/datelen;
fftsig=fft(s);
fftsig=fftsig(1:kNyp);
figure;
plot(posfre,abs(fftsig))