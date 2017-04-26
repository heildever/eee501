% IEU EEE501 applied digital image processing 
clear all, clc

I=imread('cameraman.tif');
for scale = [0.3,0.5,0.9,1.5]     % defining resizing ratios
Q = imresize (I,scale);          
figure,imshow(Q);
end

for values = [3,6,10,15]        % defining quantization levels 
thresh = multithresh (I,values);   % generates thresholds for given levels      
W = imquantize(I,thresh);
figure,imshow(W,[]);
end
