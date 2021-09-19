im1=imread('UncleGG.jpg');
im2=imread('BackG.jpg');
im1gray=rgb2gray(im1)*0.5+rgb2gray(im2)*0.5;
imshow(im1gray)
