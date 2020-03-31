function h = rectfilt(N, wc)
    % N odd
    % wc/pi
    N = N+1-rem(N,2);
    n=-(N-1)/2:(N-1)/2;
    h=sinc(n*wc);
    h=h/sum(h); % magnitude response should be 1 at w=0
end

% Write rect, hamming, magdb
% magdb plot magnitude of fft, not left side only right side
% H = fft(h, N)