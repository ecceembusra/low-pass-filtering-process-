%kodlarýmýn duzgun calismasi icin once resmi griye cevirdim
I = imread('image.jpeg');
dgri=rgb2gray(I);
imwrite(dgri,'yeniresim.jpeg');