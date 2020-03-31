function [sr,sc] = separate(s,fs)

    wc = 2*1075/fs;
    
    N = 1023;
    n = -(N-1)/2:(N-1)/2;
    d = dirac(n);
    d(ceil(N/2)) = 1;
    
    lp = rectfilt(N,wc);
    hp = d - lp;
    
    sr=conv(s,lp);
    sc=conv(s,hp);
    
end

function w = freq2omega(f)
    w = 2*pi*f;
end