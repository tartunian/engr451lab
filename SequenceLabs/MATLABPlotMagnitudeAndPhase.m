Fs=50;
T=1;
N=T*Fs;

t=(0:1/Fs:N)-N/2;
f=linspace(-Fs/N,Fs/N,length(t));

x=cos(pi/4*t);

X=fft(x);

figure()
subplot(3,1,1);
plot(t,x);
xlabel('t');
ylabel('cos(pi/4*t)');
subplot(3,1,2);
plot(f,abs(X));
xlabel('w');
ylabel('magnitude');
subplot(3,1,3);
plot(f,angle(X));
xlabel('w');
ylabel('phase');