function y = overlap_save(x,h,lc)
    % Length of x
    lx = length(x)
    % Length of impulse response
    lh = length(h)
    % Sample size equals length of h minus 1 plus chunk size
    x_b_size = lh - 1 + lc;
    % Size of convolved output of x_b and h equals length of h minus 1 plus
    % x_b_size.
    y_b_size = lh - 1 + x_b_size;
    % Size of final output of discrete convolution of x and h.
    y_size = lh+lx-1;
    
    % Initialize y.
    y = zeros(1,y_size);
    
    % Look at this more
    x_pad_size = mod(lc,mod(lx,lc))
    
    % Pad x to be whole number of chunks.
    x = [x zeros(1,x_pad_size)];
    
    % Update lx to account for padding.
    lx = lx + x_pad_size;
    
    % Declare holder for previous sample.
    % Initialize to zeros.
    x_b_prev = zeros(1,x_b_size);
    % Declare holder for previous output of convolution.
    % Initialize to zeros.
    y_b_prev = zeros(1,y_b_size);
    
    % Starting index of x for current sample
    x_offset = 1;
    
    while(x_offset + lc - 1 <= lx)
        x_b = [x_b_prev(end-lh+2:end) x(x_offset:x_offset+lc-1)]
        y_b = conv(x_b,h)
        x_b_prev = x_b;
        y_b_prev = y_b;
        x_offset = x_offset + lc
    end
end

% Read audiofile file.wav
% [x,fs]=audioread('file.wav')
% Play sequence x convolved with sequence h
% h=sequence(sinc(t),0);soundsc(x.conv(h).data,fs)