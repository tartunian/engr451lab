function y = overlap_save(x,h,L)
    y=[];

    Lx = length(x);
    M= length(h);
    N = L+M-1;
    xPad = L-mod(Lx,L);
    x = [x zeros(1,xPad)];
    Lx = length(x);
    c=0;
    
    x_c_prev = zeros(1,N);
    
    while( c*L+L <= Lx )
        startSampleIndex = c*L+1;
        endSampleIndex = startSampleIndex+L-1;
        x_c = [x_c_prev(end-M+2:end) x(startSampleIndex:endSampleIndex)];
        x_c_prev = x_c;
        y_c = conv(x_c,h);
        y=[y y_c(M:end-M+1)];
        c=c+1;
    end
    
    y=y(find(y,1,'first'):find(y,1,'last'));
    
end

% Read audiofile file.wav
% [x,fs]=audioread('file.wav')
% Play sequence x convolved with sequence h
% h=sequence(sinc(t),0);soundsc(x.conv(h).data,fs)