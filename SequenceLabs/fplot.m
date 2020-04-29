function ph = fplot(b,a)

    w=linspace(0,2*pi,512);
    numerator=polyval(b,exp(-1j*w));
    denominator=polyval(a,exp(-1j*w));
    H=numerator./denominator;
    
    subplot(2,1,1)
    plot(w./pi,abs(H));
    title('Magnitude Response');
    xlim([0 1]);
    
    subplot(2,1,2)
    plot(w./pi,angle(H));
    title('Phase Response');
    xlim([0 1]);

end