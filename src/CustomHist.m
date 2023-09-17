classdef CustomHist
   methods (Static)
      function pixelsFlatten = getPixelFlatten(img)
        imgSize = size(img);
        if (length(imgSize) == 3)
            [row, col, channel] = size(img);
            pixelsFlatten = zeros(channel, channel);
            for ch=1:channel
                imgChannel = img(:,:,ch);
                k = 1;
                for i=1:row
                    for j=1:col
                        pixelsFlatten(k, ch) = imgChannel(i,j);
                        k = k+1;
                    end
                end
            end
        else
            [row, col] = size(img);
            pixelsFlatten = zeros(row*col, 1);
            k = 1;
            for i=1:row
                for j=1:col
                    pixelsFlatten(k) = img(i,j);
                    k = k+1;
                end
            end
        end
    end
    
    function histImg = getHistImg(img)
        pixelsFlatten = CustomHist.getPixelFlatten(img);
        [~, channels] = size(pixelsFlatten);
        binEdges = 0:255;
        for ch = 1:channels
            pixelsFlattenSliced = pixelsFlatten(:, ch);
            
            [freq, uniqueVals] = histcounts(pixelsFlattenSliced, binEdges);

            histImg = subplot(channels, 1, ch);
            bar(uniqueVals(1:end-1), freq)
            xlabel('Pixel Value');
            ylabel('Frequency');
            title(sprintf('Channel %d Histogram', ch));
        end
    end
   end
end