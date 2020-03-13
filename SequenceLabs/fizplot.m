function fizplot(b, a)
% FIZPLOT Plot Frequency response, pole-zero plot and impulse response
%    of the filter H(z), specified by
%                                -1                -nb 
%             B(z)   b(1) + b(2)z + .... + b(nb+1)z
%      H(z) = ---- = ---------------------------------
%                                -1                -na
%             A(z)   a(1) + a(2)z + .... + a(na+1)z
%
%    given numerator and denominator coefficients in vectors B and A.

clf;
b = b(:)';
a = a(:)';
fplotnew(b, a, 'XLim', [0 1], 'XTick', 0.25);

h = get(gcf, 'Children');
for i = 1:2
   set(h(i), 'Units', 'normalized');
   pos = get(h(i), 'Position');
   pos(3) = 0.33;
   set(h(i), 'Position', pos);
end

subplot(2, 2, 2);
zplotnew(b, a);
title(['H(z)=' bastrnew({b, a}, 1)]);

subplot(2, 2, 4);
iplotnew(b, a);
figure(gcf);

return
