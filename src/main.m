customHistogram = CustomHist;
img = imread('../data/colored/Lena512warna.bmp');
imageManip = ImageManipulation;
newImg = imageManip.imageNegative(img);
imshow(newImg);
customHistogram.getHistImg(newImg);
[freq, uniqueVals] = customHistogram.getHistData(img);
disp(freq)


