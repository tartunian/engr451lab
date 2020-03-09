clear
[w,j] = meshgrid(-10: 0.5: 10);
Y = exp(j*w) + exp(-2*j*w) + exp(-3*j*w);
figure;
surf(w,j,Y)