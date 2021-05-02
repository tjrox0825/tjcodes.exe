clear all;
clc;
%IMAGE READ
img=imread('/Users/tjrox0825/Desktop/Tarun.png');
%IMAGE DISPLAY
subplot(1,4,1);
imshow(img);
[row,col]=size(img);
img_grey= rgb2gray(img);
subplot(1,4,2);
imshow(img_grey);
imwrite(img_grey,'grayimg.jpg')
%IMAGE RESIZE
re_size=imresize(img,[100,100]);
subplot(1,4,3);
imshow(re_size);
%IMAGE ADDITION
addimg= img + img;
subplot(1,4,4);
imshow(addimg);
%IMAGE SUB
subimg= img - img;

imshow(subimg);
%IMAGE DIV
img10=img/10;
figure();
imshow(img10);
img50=img/50;
figure();
imshow(img50);
img255=img/255;
figure();
imshow(img255);
%IMAGE MULTI
img10m=img*10;
figure();
imshow(img10m);
img20m=img*20;
figure();
imshow(img20m);
img255m=img*255;
figure();
imshow(img255m);
