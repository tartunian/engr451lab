function ph = iplot(b,a)

    poles = roots(a);
    
    nb = 0;
    na = 0;
    while b(1) == 0
        b=b(2:end);
        nb = nb + 1;
    end
    while a(1) == 0
        a = a(2:end);
        na = na + 1;
    end
    n = na - nb;
    
    i = [1 zeros(1,999)];
    h = filter(b,a,i);
    
    if( isempty( poles ) )
        N = length(h);                        % FIR
    elseif ( abs ( poles ) >= 1 )
        N = 20;                               % Unstable
    else
        energy = round(sum(h.^2),4);
        energyUpperLimit = round(0.999*energy,4);
        c = round(cumsum(h.^2),4);
        x = find(c>=energyUpperLimit);    % Unstable IIR
        N = x(1);
    end
    
    if N<10
        N=10;
    elseif N > 100
        N=100;
    end
    
    stem(-n:N-n-1,h(1:N),'filled');

end