classdef sequence
	properties
		data
		offset
    end
	
    methods(Static)
        
        function [a,b] = padData(x,y)
            Lx = length(x.data) + x.offset;
            Ly = length(y.data) + y.offset;
            a = [zeros(1,x.offset-y.offset), x.data, zeros(1,Ly-Lx)];
            b = [zeros(1,y.offset-x.offset), y.data, zeros(1,Lx-Ly)];
        end

%         % My Original Implementation
%         % 
%         % Pads the input sequences so that they are of the same length.
%         % Sequence with the lower offset will not have front padding. This
%         % returns the data portion of the sequences only.
%         function [a,b] = padData(x,y)
%             % Find which sequencce has the lower offset (furthest to the
%             % left).
%             lo = sequence([],0);
%             hi = sequence([],0);
%             if(x.offset<y.offset)
%                 lo = x;
%                 hi = y;
%             else
%                 lo = y;
%                 hi = x;
%             end
%             % Define ints for left and right padding of zeros.
%             leftPad = hi.offset-lo.offset;
%             rightPad = (length(lo.data)+lo.offset)-(length(hi.data)+hi.offset);
%             % Padding the left side of the sequence with the higher offset
%             % is easiest.
%             hi.data = [zeros(1,leftPad),hi.data];
%             % Pad the right side of either the lower or higher offset
%             % sequence depending on whether rightPad is
%             % positive or negative.
%             if(rightPad>0)
%                 hi.data = [hi.data, zeros(1,rightPad)];
%             elseif(rightPad<0)
%                 lo.data = [lo.data, zeros(1,abs(rightPad))];
%             end
%             % Map lo and hi back to the order in which they came i.e. a = x
%             % and b = y.
%             if(x.offset<y.offset)
%                 a=lo.data;
%                 b=hi.data;
%             else
%                 a=hi.data;
%                 b=lo.data;
%             end
%         end
    end
    
	methods
		function s = sequence(data, offset)
			% SEQUENCE   Sequence object
			%            S = SEQUENCE(DATA, OFFSET) creates sequence S
			%            using DATA and OFFSET
			%
			%            Your Name  1 Jan 2014
			s.data = data;
			s.offset = offset;
		end
		
		function display(s)
			var = inputname(1);
			if (isempty(var))
				disp('ans =');
			else
				disp([var '=']);
			end
			switch length(s.data)
				case 0
					disp('    data: []')
				case 1
					disp(['    data: ', num2str(s.data)])
				otherwise
					disp(['    data: [' num2str(s.data) ']'])
			end
			disp(['  offset: ' num2str(s.offset)])
		end
		
		function y = flip(x)
            ofs = -(x.offset+length(x.data)-1);
			y = sequence(x.data(end:-1:1),ofs);
		end
		
		function y = shift(x, n0)
			y = sequence(x.data, x.offset+n0);
        end
        
		function z = plus(x, y)
            if(isa(x,'double'))
                z = sequence(x+y.data,y.offset);
            elseif(isa(y,'double'))
                z = sequence(x.data+y,x.offset);
            else
                [a, b] = sequence.padData(x,y);
                z = sequence(a+b,min(x.offset,y.offset));
            end
            %trim(z);
        end
		
		function z = minus(x, y)
            if(isa(x,'double'))
                z = sequence(x-y.data,y.offset);
            elseif(isa(y,'double'))
                z = sequence(x.data-y,x.offset);
            else
                [a, b] = sequence.padData(x,y);
                z = sequence(a-b,min(x.offset,y.offset));
            end
            %trim(z);
		end
		
		function z = times(x, y)
            if(isa(x,'double'))
                z = sequence(x.*y.data,y.offset);
            elseif(isa(y,'double'))
                z = sequence(x.data.*y,x.offset);
            else
                [a, b] = sequence.padData(x,y);
                z = sequence(a.*b,min(x.offset,y.offset));
            end
            %trim(z);
        end
        
        function y = conv(x,h)
            lx = length(x.data);
            lh = length(h.data);
            if(lx>lh)
                y = convol(h,x,lh,lx);
            else
                y = convol(x,h,lx,lh);
            end
        end
        
        % Convolution
        function y = convol( x,h,lx,lh )
            widthH = lx + lh - 1;
            H=zeros( lx, widthH );
            for n = 1:lx
                zerosLeftLength     = n-1;
                dataStart           = 1;
                dataEnd             = min( lh, widthH - zerosLeftLength );
                zerosRightLength    = widthH - dataEnd - dataStart - zerosLeftLength + 1;
                left                = zeros( 1, zerosLeftLength );
                mid                 = h.data( dataStart : dataEnd );
                right               = zeros( 1, zerosRightLength );
                H(n,:)              = [left, mid, right];
            end
            y = sequence( x.data*H, x.offset+h.offset );
        end
        
        function y = deconv(x,h)
            y = conv(x,h);
        end
        
        function x = trim(x)
            while(x.data(1) == 0 && length(x.data)>1)
                x.data(1) = [];
            end
            while(x.data(end) == 0 && length(x.data)>1)
                x.data(end) = [];
            end
        end
		
		function stem(x)
			% STEM Display a Matlab sequence, x, using a stem plot.
            data_length = length(x.data);
            n_axis_indeces = linspace(1,data_length,data_length);
            n_axis_vals = n_axis_indeces+linspace(x.offset,x.offset,data_length)-1;

            figure()
            stem(x.data)
            
            xlabel('n'); title('x');
            
            set(gca,'XTick', n_axis_indeces );
            set(gca,'XTickLabel', n_axis_vals );
            
		end
	end
end

% When finished: publish Lab1 'pdf' or 'doc'