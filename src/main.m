customHistogram = CustomHist;
img = imread('../data/colored/Lena512warna.bmp');
ref = imread('../data/grayscaled/Lena.bmp');
imageManip = ImageManipulation;
histEqImg = imageManip.histogramSpecification(img, ref);
imshow(histEqImg);
%customHistogram.getHistImg(newImg);


