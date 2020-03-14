function y = mag_phase(x)
    y.mag = sqrt(power(x.real,2)+power(x.imag,2));
    y.phase = atan2(x.imag,x.real);
end

