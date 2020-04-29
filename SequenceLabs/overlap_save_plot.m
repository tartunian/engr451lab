function y = overlap_save_plot(x,h,ls)

    lh = length(h);
    xChunkLength = ls+lh-1;
    yChunkLength = xChunkLength+lh-1;
    yLength = length(x)+lh-1;
    xPadLength = mod(ls-mod(length(x),ls),ls);
    x = [x zeros(1,xPadLength)];
    lx = length(x);
    
    xChunkPrev = zeros(1,xChunkLength);
    yChunkPrev = zeros(1,yChunkLength);
    y = zeros(1,yLength);
    
    c=0;
    startSampleIndex = c*ls+1;
    endSampleIndex = startSampleIndex+ls-1;
    
    % While end of current xSample is <= length of padded x.
    while( endSampleIndex <= lx )
        prevXChunkTail = xChunkPrev(end-lh+2:end);
        xSample = x(startSampleIndex:endSampleIndex);
        
        xChunk = [prevXChunkTail xSample];
        yChunk = conv(xChunk,h);
        newYData = yChunk(lh:end);
        startYIndex = c*ls+1;
        endYIndex = min(yLength,startYIndex+length(newYData)-1);
        
        y(startYIndex:endYIndex) = yChunk(lh:lh+endYIndex-startYIndex);
        
        plot(startYIndex:endYIndex,y(startYIndex:endYIndex));
        hold on;
        pause(0.5);
        
        xChunkPrev = xChunk;
        yChunkPrev = yChunk;
        
        c=c+1;        
        startSampleIndex = c*ls+1;
        endSampleIndex = startSampleIndex+ls-1;
    end
    
end

% Read audiofile file.wav
% [x,fs]=audioread('file.wav')
% Play sequence x convolved with sequence h
% h=sequence(sinc(t),0);soundsc(x.conv(h).data,fs)