
function [N, beta] = kaiserparams(deltaOmega, delta)
    A = -20*log(delta)/log(10);
    if(A>50)
        beta = 0.1102*(A-8.7);
    elseif((21<=A) && (A<=50))
        beta = 0.5842*power(A-21,0.4)+0.07886*(A-21);
    elseif(A<21)
        beta =  0;
    end
    N = ceil((A-8)/(2.285*deltaOmega*pi));
end