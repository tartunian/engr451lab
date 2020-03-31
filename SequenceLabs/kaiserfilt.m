function h = kaiserfilt(N, wc, beta)
    n=-(N-1)/2:(N-1)/2;
    h_ideal=wc/pi*sinc(wc.*n);
    
    top=beta*sqrt(1-power(2*n/(N-1),2));
    w=besseli(0,top)./besseli(0,beta);
    
    h=w.*h_ideal;
    h=h/sum(h);
end

% wvtool(h) time domain vs freq domain