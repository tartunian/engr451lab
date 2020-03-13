load lab2;
x=seashell(:,1);
t=linspace(-50,50,101);
impulse=[zeros(1,50) 1 zeros(1,50)];
T=pi;
h=sin(T*t)./t;
h_i=impulse-h;
h_i(51)=0;
y=conv(x,h_i);
soundsc(y,fs)