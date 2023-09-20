classdef CustomHist
   methods (Static)
    function histImg = getHistImg(img)
        binEdges = 0:255;
        [freq, uniqueVals] = histcounts(img, binEdges);
        histImg = bar(uniqueVals(1:end-1), freq);
        xlabel("Pixel Value");
        ylabel("Frequency");
        title("Image Histogram");
    end
    function [freq, uniqueVals] = getHistData(img)
        binEdges = 0:255;
        [freq, uniqueVals] = histcounts(img, binEdges);
    end
   end
end