function [sr,sc] = separate(s,fs)

    % Midpoint of row and column freqs = 1075
    wc = 2*1075/fs;
    wc2 = 2*400/fs;
    
    N = 303;
    n = -(N-1)/2:(N-1)/2;
    d = n == 0;
    
    lp = hammingfilt(N,wc);
    lp2 = hammingfilt(N,wc2);
    bp = lp-lp2;
    hp = d - lp;
    
    sr=conv(s,bp);
    sc=conv(s,hp);
    
end

function w = freq2omega(f)
    w = 2*pi*f;
end