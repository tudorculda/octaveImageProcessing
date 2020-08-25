clc;
clear all;
close all;
function newChannel = processChannel(colorChannel, levelsPerChannel)
  newChannel = colorChannel;
  minim = min(min(colorChannel));
  maxim = max(max(colorChannel));
  delta = (maxim-minim) / (levelsPerChannel - 1);
  for i = 1 : levelsPerChannel
    valMedie = minim + (i-1) * delta;
    valJos = valMedie - delta / 2 -1;
    valSus = valMedie + delta / 2 ;
    newChannel(find( colorChannel >= valJos & colorChannel < valSus )) = valMedie;    
  endfor 
endfunction

myImg = imread('1.png');
levelsPerChannel = 4

red = myImg(:,:,1);
green = myImg(:,:,2);
blue = myImg(:,:,3);
figure(1);
imshow(myImg);
red = processChannel(red, levelsPerChannel);
green = processChannel(green, levelsPerChannel);
blue = processChannel(blue, levelsPerChannel);
newImg = myImg;
newImg(:,:,1) = red;
newImg(:,:,2) = green;
newImg(:,:,3) = blue;
figure(3)
imhist(myImg);
figure(4)
imhist(newImg)




figure(2);
imshow(newImg);
imwrite(newImg, 'output.png');


