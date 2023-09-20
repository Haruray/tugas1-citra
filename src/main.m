customHistogram = CustomHist;
img = imread('../data/colored/Lena512warna.bmp');
imageManip = ImageManipulation;
histEqImg = imageManip.histogramEqual(img);
imshow(histEqImg);
%customHistogram.getHistImg(newImg);


