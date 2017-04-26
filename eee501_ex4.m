% IEU EEE501 applied digital image processing 
clear all, clc;

I = imread ('chest.tif');
I = im2double(I);
[f1,f2] = freqspace(size(I),'meshgrid');
D = sqrt(f1.^2 + f2.^2);
H_b=1./((1+0.1./D).^2);  %Butterworth high-pass filter
H_em=0.5+0.75*H_b; %High frequency emphasis filter
H_em=ifftshift(H_em);
I_f=fft2(I);
I_f=I_f.*H_em;
I2=(ifft2(I_f));
imshow(I2);
