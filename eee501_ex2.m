% IEU EEE501 applied digital image processing 
clear all, clc;
tic
%assgn1
I = imread('C:\Users\aný_2\Desktop\lenna negative.bmp');
W = imread('C:\Users\aný_2\Desktop\rose negative.bmp');
I2 = imrotate (I,-180) ; I3 = imcomplement (I2) ; I4 = imresize (I3, [512 512],'nearest');
W2 = imrotate (W,90) ; W3 = imcomplement (W2) ; W4 = imresize (W3, [512 512],'bicubic');
figure,subplot(2,2,1),imshow(I4-80);
%assgn2
[x y RGB]=impixel(I4) ; F=[x y];
D1 = pdist(F) ; D2 = pdist(F,'cityblock') ; D3 = pdist(F,'cosine');
%assgn3
h=imdistline ; % by using draggable distance tool
subplot(2,2,2),imshow(W4-80),title('corrected darkened 512x512 image');
toc
