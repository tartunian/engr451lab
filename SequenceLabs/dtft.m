% DTFT
% Periodic result between -pi pi or -2pi 2pi
% Real valued: magnitude response = even function
% Example: x[n] = dirac[n+3]+dirac[n+2]+dirac[n+1]
% X(e^jw) = e^3jw + e^2jw + e^jw = e^2jw(e^jw + 1 + e^-jw) = e^2jw(1+2cos(w))
% w is a vector from -pi to pi , not a variable
% A = exp(-j*Q) answer

function y = dtft(x,w)
    lx = length(x.data);
    n = linspace(x.offset,x.offset+lx-1,lx);
    Q = n'*w;
    y = x.data*exp(-j*Q); % Does this need to be cos(wn) + j sin(wn)
end