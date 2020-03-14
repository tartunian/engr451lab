function plot_magph2(x, w)
    z = mag_phase(dtft2(x,w));
    figure();
    subplot(3,1,1);
    stem(w,x.data);
    grid on;
    subplot(3,1,2);
    plot(w,z.mag);
    grid on;
    title('Magnitude');
    xlabel('\omega (rad/\pi)');
    ylabel('|X(\omega)|');
    hold on;
    subplot(3,1,3);
    plot(w,z.phase);
    grid on;
    title('Phase');
    xlabel('\omega (rad/\pi)');
    ylabel('\angleX(\omega)');
end