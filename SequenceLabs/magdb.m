function ph = magdb(h)
    H = fftshift(fft(h,1024));
    rH = H(end/2+1:end);
    rh = h(end/2+1:end);
    mag = sqrt(power(real(rH),2)+power(imag(rH),2));
    dBMag = mag2db(mag);
    ph = plot(linspace(0,1,length(rH)),dBMag,'color','blue');
    grid on;
    xlabel('\omega (rad/\pi)');
    ylabel('|H(\omega)|');
end

% fft is by default response btwn 0:2pi)
% xlimit(0,pi) or xlimimt(0,1)