%--------------------------------------------------------------------------
% IEU
% EEE 501 APPLIED DIGITAL IMAGE PROCESSING
% LAB Exercise 2.1 - Matlab practices
%--------------------------------------------------------------------------
% clear workspace and screen
clear all, clc
%--------------------------------------------------------------------------
%Step 1. Read and display one Lena image (e.g. 'lena.bmp')
figure, imshow('lena.bmp');title('original Lena image')
%read image into 2-D array I to process it
I = imread('lena.bmp');
%display original image with specified gray level range [low high]
figure, imshow(I, [0 80])

%list variables in workspace
whos
%size of image
size(I)
%type of data
class(I)

%image information tool (display image and allows to do some common image
%proc tasks
imtool(I)

%save an image to a different format (jpeg) and change its compression
%level
imwrite(I,'test.jpg','Quality', 25);
%compare visual quality and sizes of test.jpg and original lena.bmp

%--------------------------------------------------------------------------
%Step 2. Basic operations on Lena image
%create negative of original image
J = imadjust(I,[0 1],[1 0]);
figure, imshow(J),title('negative Lena image')

%manipulate image pixel values
I_double = double(I); %first convert from integer to double
if(0)
I_mean = mean(I_double); 
I_double = I_double - repmat(I_mean,[256 1]);
figure, imagesc(uint8(I_double));colormap('gray')
end

%log transformation of original image: Y(i,j) = log10(I(i,j)+1) 
%compare normalized image to the original. Which pixel value ranges got
%stretched/compressed?
Y = log10(I_double+1);
Ymin = min(Y(:));
Ymax = max(Y(:));
Ynorm = (Y-Ymin)/(Ymax-Ymin)*255;
figure;imshow(uint8(Ynorm));title('the normalized log transformed image')

%matrix transformation applied to original image
shift = 80; %# pixels to shift down 
E = eye(256);
T = zeros(256,256);
T(1:shift,:) = E(256-(shift-1):256,:);
T(shift+1:256,:) = E(1:256-shift,:);
%multiply image with transformation matrix
I_shift = T*I_double;
figure, imagesc(uint8(I_shift)),colormap('gray')


