% DTFT2 Find real and imaginary parts of DTFT
function y = dtft2(x,w)
    Q = dtft(x,w);
    lx = length(x);
    lw = length(w);
    for i = 1 : lx
        for j = 1 : lw
            Q(i,j);
        end
    end
    y.real = real(Q);
    y.imag = imag(Q);
end