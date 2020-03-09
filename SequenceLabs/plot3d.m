w0 = pi/4;

t=0:0.05:49;

% s=exp(-0.05*t).*exp(-w0*j*t);
s=power(1.5,w0*j*t);

% t=0:pi/32:2*pi;
% plot3(cos(w0*t),t,sin(w0*t));

% hold on

plot3(real(s),t,imag(s));

grid on

xlabel('real');
ylabel('t');
zlabel('imag');
