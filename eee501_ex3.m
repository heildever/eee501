%--------------------------------------------------------------------------
% IEU
% EEE 501 APPLIED DIGITAL IMAGE PROCESSING 
% Lab Exercise 3 - Investigation of of Spatial Resolution Changes and
% Quantization on Gray Level Images
%--------------------------------------------------------------------------
% clear workspace and screen
clear all, clc
%--------------------------------------------------------------------------
% 1) Changing spatial resolution of original image down to 512x512, 256x256, 128x128,
% 64x64 and 32x32 using Matlab imresize function with nearest neighbour interpolation  
%Step 1. Read and display test image
I1 = imread('C:\Users\aný_2\Desktop\course\T.INCE\EEE501\Assignment2\rose negative.bmp');
figure, imshow(I1), title('original image')

I1_r1 = imresize(I1, [256 256], 'nearest');
imwrite(I1_r1, 'rose_256.tif', 'tif'); 
figure, imshow('rose_256.tif')




% 2) Quantize original image to 6-bit, 4-bit, 2-bit, and 1-bit levels
% using Matlab gray2ind and ind2gray functions
%Step 1. Read and display test image
I2 = imread('C:\Users\aný_2\Desktop\course\T.INCE\EEE501\Lab2\ctskull_256.bmp');
figure, imshow(I2), title('original image')

[I2_2_index,map] = gray2ind(I2,4); 
I2_2_image = ind2gray(I2_2_index,map);
imwrite(I2_2_image, 'ctskull_q2bit.tif', 'tif');
figure, imshow(I2_2_image)




