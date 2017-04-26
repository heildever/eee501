% IEU EEE501 applied digital image processing 
clear all, close all, clc;

I = imread ('crowd.tif');
I = im2double(I);
I = imresize (I,[256 256]);
figure(1),subplot(1,2,1),imshow(I),title('original image');
vf = fft2(I);
vf = fftshift(vf,2);
subplot(1,2,2),imshow(vf);title('fourier transformed image');
%% filter
d=zeros(256,256);
for i=1:256
    for j=1:256
         d(i,j) =  sqrt((i-128)^2+(j-128)^2);
         if d(i,j)<100
             d(i,j)=1;
         else
             d(i,j)=0;
         end
    end
end

for x=85:170
    for y=85:170
        d(x,y) =  sqrt((x-64)^2+(y-64)^2);
        if d(x,y)<30
            d(x,y)=1;
        else
            d(x,y)=0;
        end
    end
end
figure(2),subplot(1,2,1),imshow(d),title('filter');
%%
vff = vf.*I;
subplot(1,2,2),imshow(vff),title('filtered image in frequency domain');
%%
vff = ifftshift(vff);
Q = abs(ifft2(vff));
figure(3),imshow(Q,[]),title('resulted image in pixel domain');
%%
I2 = imread('D:\Courses\T.INCE\EEE501\figures\DIP.tif');
h = fspecial('gaussian');
L = imfilter (I2,d);
K = imfilter(I2,h);
figure(4),subplot(1,2,1),imshow(L),title('ideal circular bpf');
subplot(1,2,2),imshow(I2-K),title('gaussian hpf');
%%
w1 = [0 -1 0; -1 4 -1; 0 -1 0];
w2 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
L2 = imfilter (I2,w1);
K2 = imfilter (I2,w2);
figure(5),subplot(1,2,1),imshow(L2),title('filtered with w1');
subplot(1,2,2),imshow(K2),title('filtered with w2');

