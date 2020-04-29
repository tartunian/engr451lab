% http://online.sfsu.edu/ee/book/Labs/Z%20transform/z%20Transform%20Lab.pdf

% First attempt at iplot which plots the impulse response.
function ph = iplot2(b,a)
% IPLOT Impulse response of system.
% IPLOT(B,A,N) is the N-point impulse response
% of the filter B/A:
%                            -1 -nb
%           B(z) b(1) + b(2)z + .... + b(nb+1)z
%    H(z) = ---- = ---------------------------------
%                            -1 -na
%           A(z) a(1) + a(2)z + .... + a(na+1)z
%
% given numerator and denominator coefficients in vectors B and A.
% N is specified according to the following rule:
% If h[n] FIR, then N = length(h);
% If h[n] is IIR and increasing (i.e. |h[n]|-->inf as n-->inf),
% then N = 20;
% If h[n] is IIR and decreasing (i.e. |h[n]|-->0 as n-->inf),
% then the maximum N is determined such that
% rms value of h(1:N) = 0.999 * rms value of h(1:1000).
% However, in this case, N must also be chosen such that 10 <= N <= 100

    % Get zeros and poles
    zeroes = roots(b);
    poles = roots(a);
    

    
    % Get largest magnitude of zeros and poles
    max_mag=max(max(sqrt(power(real(zeroes),2)+power(imag(zeroes),2))),max(sqrt(power(real(poles),2)+power(imag(poles),2))));
    
    x = [1 zeros(1,999)];
    
    shifted = 0;
    % If b/a is a noncausal system
    if( a(1) == 0 )
        % Shift the system left by one
        a(1) = 1;
        shifted = 1;
    end
    
    h = filter(b,a,x);
    h = h./max(h);
    
    energy = round(sum(abs(h).^2),4);
    energyLowerLimit = round(0.001*energy,4);
    energyUpperLimit = round(energy-energyLowerLimit,4);

    flipped = 0;
    % Flip the impulse response for calculating index of 99.9% of total
    % energy if is increasing from left to right.
    s = sum(h(1:20));
    if(s<energyLowerLimit)
        h=flip(h);
        flipped = 1;
    end
    
    c = round(cumsum(abs(h).^2),4);
    
    N = find(c>energyUpperLimit);
    n = linspace(0,1,N(1));
    
    if( shifted == 1 )
        n = n - 1;
    end
    
    h_1 = h(1:N);
    
    % Reflip the impulse response if it was flipped.
    if(flipped==1)
        h_1 = flip(h_1);
    end
    
    ph = stem(n,h_1);
    title('Impulse Response');
    
    grid on;
    
end