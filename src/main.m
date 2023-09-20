customHistogram = CustomHist;
img = imread('../data/grayscaled/Lena.bmp');
imageManip = ImageManipulation;
histEqImg = imageManip.histogramEqual(img);
imshow(histEqImg);
%customHistogram.getHistImg(newImg);


