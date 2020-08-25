clc;
clear all;
close all;
myImg = imread('output.png');
figure(1);
imshow(myImg);

gray = rgb2gray(myImg);
figure(2); 
imshow(gray);
title('grayscale');

bw = edge(gray,"Canny");
figure(3)
imshow(bw);
title("Canny");
