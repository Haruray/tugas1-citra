classdef ImageManipulation
   methods (Static)
       function imgBright = imageBrighten(img, a, b)
           imgBright = a * img+ b;
       end
       function imgNeg = imageNegative(img)
           maxVal = 255;
           imgNeg = maxVal - img;
       end
       function logTransform = logTransformation(img, c)
           img = im2double(img);
           logTransform = uint8(c * log(img + 1));
       end
       function powerTransform = powerTransformation(img, c, gamma)
           img = im2double(img);
           powerTransform = uint8(c * (img^gamma));
       end
       function contrastStretch = contrastStretching(img)
           custHist = CustomHist;
           [~, ~, channels] = size(img);
           stretchedChannels = zeros(size(img));
           for ch=1:channels
               processedImg = img(:,:,ch);
               rmin = min(processedImg);
               rmax = max(processedImg);
               stretchedChannels(:,:,ch) = (processedImg - rmin).*(255./(rmax-rmin));
           end
           contrastStretch = uint8(stretchedChannels);
       end
   end
end