customHistogram = CustomHist;
img = imread('../data/grayscaled/Lena.bmp');
imageManip = ImageManipulation;
newImg = imageManip.contrastStretching(img);
imshow(newImg);
%customHistogram.getHistImg(newImg);


