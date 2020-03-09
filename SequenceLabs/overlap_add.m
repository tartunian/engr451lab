% lc - chunk length

% Rewrite with while loop not 'loop' var
function y = overlap_add(x,h,lc)
    xL = length(x);
    loop = ceil(xL/lc);
    x = [x zeros(1,lc*loop-xL)];
    ys = sequence([],0);
    for i=1:loop
        temp=x(1+lc*(i-1):lc*i);
        tempoffset = lc * (i-1);
        data = conv(temp,h);
        ts = sequence(data,tempoffset);
        ys = plus(ys,ts);
    end
    y = ys.data;
end

