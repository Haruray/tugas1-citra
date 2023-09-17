customHistogram = CustomHist;
img = imread('../data/grayscaled/Lena.bmp');

imageManip = ImageManipulation;
newImg = imageManip.contrastStretching(img);
pixelsFlatten = customHistogram.getHistImg(newImg);
