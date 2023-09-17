classdef CustomHist
   methods (Static)
      function pixelsFlatten = getPixelFlatten(img)
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
    
    function histImg = getHistImg(img)
        pixelsFlatten = CustomHist.getPixelFlatten(img);
        histImg=histogram(pixelsFlatten);
    end
   end
end