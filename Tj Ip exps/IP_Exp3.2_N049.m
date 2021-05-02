clear all;
clc;
 
img1=imread('/Users/tjrox0825/Desktop/Trip.jpg');
re_img1=imresize(rgb2gray(img1),[300,300]);
figure();
imshow(re_img1);
img2=imread('/Users/tjrox0825/Desktop/College.jpg');
re_img2 = imresize(rgb2gray(img2),[300,300]);
figure();
imshow(re_img2);
 
 
 
 
 
new_img=re_img1;
new_img=(0.5*re_img1+(1-0.5)*re_img2);
figure();
imshow(new_img);
