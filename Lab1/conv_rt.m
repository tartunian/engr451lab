% Real-time convolution
function y = conv_rt(x,h)
    Lx = length(x);
    Lh = length(h);
    x = [zeros(1,Lh-1),x,zeros(1,Lh-1)];
    y = zeros(1, Lx+Lh-1);
    for i = 1:Lx
        for j = 1:Lh
            y(i) = y(i) + h(Lh-j+1)*x(i+j-1)
        end
    end
end
