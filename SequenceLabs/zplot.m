function ph = zplot(b, a)
    % Get zeros and poles
    zeros = roots(b);
    poles = roots(a);
    
    % Get largest x or y value
    lim=1.1*max([real(zeros)' real(poles)' 1 imag(zeros)' imag(poles)']);
    
    % Plot unit circle
    rectangle('Position',[-1 -1 2 2],'Curvature',[1,1]);
    
    hold on;
    grid on;
    
    % Plot zeros and poles
    plot(real(zeros),imag(zeros),'o','color','blue');
    plot(real(poles),imag(poles),'x','color','red');
    
    % Config plot
    ax = gca;
    ax.DataAspectRatio = [1 1 1];
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    ax.XAxis.Color = 'black';
    ax.YAxis.Color = 'black';
    ax.XLim = [-lim lim];
    ax.YLim = [-lim lim];
    ax.Title.String = 'Pole-Zero Plot';
    
end