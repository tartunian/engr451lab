function plot_magph(x, w)
    z = mag_phase(dtft2(x,w));
    figure();
    subplot(2,1,1);
    plot(w,z.mag);
    grid on;
    title('Magnitude');
    xlabel('\omega (rad/\pi)');
    ylabel('|X(\omega)|');
    hold on;
    subplot(2,1,2);
    plot(w,z.phase);
    grid on;
    title('Phase');
    xlabel('\omega (rad/\pi)');
    ylabel('\angleX(\omega)');
end