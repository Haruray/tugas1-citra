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
       function histEq = getHistEqual(img)
           [height, width, ~] = size(img);
           hist = CustomHist;
           [freq, ~] = hist.getHistData(img);
               
           histEq = zeros(height, 1);
           NPixels = height * width;
           NGray = 255;
           for i=1:NGray
               sum = 0;
               for j=1:i
                   sum = sum + (freq(j) / NPixels);
               end
               histEq(i) = floor(NGray * sum);
           end
       end
       function histEqImg = histogramEqual(img)
           [height, width, channel] = size(img);
           
           histEqImg = img;
           for ch=1:channel
               imageChannel = img(:,:,ch);
           
               histEq = ImageManipulation.getHistEqual(imageChannel);

               for i=1:height
                   for j=1:width
                       histEqImg(i,j, channel) = histEq(imageChannel(i,j)+1);
                   end
               end
           end
           histEqImg = uint8(histEqImg);
       end
       function histSpec = histogramSpecification(img, ref)
           [height, width, channel] = size(img);
           [heightRef, widthRef, channelRef] = size(ref);
           hist = CustomHist;
           histSpec = img;
           NGray = 255;
           for ch=1:channel
               imageOriginalChannel = img(:,:,ch);
               if (channel <= channelRef)
                imageRefChannel = ref(:,:,ch);
               else
                   imageRefChannel = ref(:,:,1);
               end
           
               histEqOriginal = ImageManipulation.getHistEqual(imageOriginalChannel);
               histEqRef = ImageManipulation.getHistEqual(imageRefChannel);
               invHist = zeros(height);

               for i=1:height
                   minval = abs(histEqOriginal(i) - histEqRef(1));
                   minj = 0;
                   for j=1:NGray
                       if (abs(histEqOriginal(1) - histEqRef(j)) < minval)
                           minval = abs(histEqOriginal(i) - histEqRef(j));
                           minj = j;
                       end
                       invHist(i) = minj;
                   end
               end
               for i=1:height
                   for j=1:width
                       histSpec(i,j, channel) = invHist(imageOriginalChannel(i,j)+1);
                   end
               end
           end
           histSpec = uint8(histSpec);
       end
   end
end