function h = hammingfilt(N, wc)
    N = N+1-rem(N,2);
    n = -(N-1)/2:(N-1)/2;
    h_ideal = wc/pi*sinc(wc*n);
    w = (0.54+0.46*cos(2*pi*n/(N-1)));
    h = h_ideal.*w;
    h = h/sum(h);
end