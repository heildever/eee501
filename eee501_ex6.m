% IEU EEE501 applied digital image processing 
clear all, close all, clc;

I = double(imread ('cameraman.tif'));
[M,N] = size (I);
u = 0:(M-1); v = 0:(N-1);
idx = find(u > M/2);
u(idx) = u(idx) - M;
idy = find(v > N/2);
v(idy) = v(idy) - N;
[V, U] = meshgrid(v, u);
D = sqrt(U.^2 + V.^2);
figure(1),subplot(1,3,1),imshow(uint8(I)),title('original image');
h = fspecial('disk',4);
hf = fft2(h,size(I,1),size(I,2));
I_blur = real(ifft2(hf.*fft2(I)));
subplot(1,3,2),imshow(uint8(I_blur)),title('blurred image');
%sigma = .05;%-40dB PSNR
blur_noise = I_blur + imnoise(I_blur,'gaussian');
%blur_noise = I_blur + sigma*randn(M,N);
subplot(1,3,3),imshow(uint8(blur_noise)),title('blurred & noised image');
D0 = 35; n = 3;
H_but = (1./(1 + (D./D0).^(2*n)));
figure(2)
H_buta = abs(H_but);
surf([-127:128]/256,[-127:128]/256,fftshift(H_buta));
shading interp, camlight, colormap default
