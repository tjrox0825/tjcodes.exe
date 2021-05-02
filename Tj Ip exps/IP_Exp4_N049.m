clear all;
clc;
 
img1=imread('/Users/tjrox0825/Desktop/Tanmay.png');
%img1=imread('/Users/tjrox0825/Desktop/Tanmay.png ');
re_img1=imresize(rgb2gray(img1),[300,300]);
noise_img1 = imnoise(re_img1,'gaussian');
 
 
 
db_img1 = double(noise_img1);
mask = [1 1 1;1 1 1;1 1 1]/9;
disp(mask);
for i=2: size(re_img1,1)-1
for j=2: size(re_img1,2)-1
    value(i,j) = mask(1)*db_img1(i-1,j-1)+ mask(2)*db_img1(i-1,j)+ mask(3)*db_img1(i-1,j+1)+ mask(4)*db_img1(i,j-1)+ mask(5)*db_img1(i,j)+ mask(6)*db_img1(i,j+1)+ mask(7)*db_img1(i+1,j-1)+ mask(8)*db_img1(i+1,j)+ mask(9)*db_img1(i+1,j+1);
    
end
end
figure();
subplot(1,3,1);
imshow(re_img1);
title('Orignal image');
subplot(1,3,2);
imshow(noise_img1);
title('Noise image');
subplot(1,3,3);
imshow(uint8(value));
title('Processed image');
 
mask2 = [-1 -1 -1;-1 8 -1;-1 -1 -1];
for i=2: size(re_img1,1)-1
for j=2: size(re_img1,2)-1
    value1(i,j) = mask2(1)*re_img1(i-1,j-1)+ mask2(2)*re_img1(i-1,j)+ mask2(3)*re_img1(i-1,j+1)+ mask2(4)*re_img1(i,j-1)+ mask2(5)*re_img1(i,j)+ mask2(6)*re_img1(i,j+1)+ mask2(7)*re_img1(i+1,j-1)+ mask2(8)*re_img1(i+1,j)+ mask2(9)*re_img1(i+1,j+1);
    
end
end
figure();
subplot(1,2,1);
imshow(re_img1);
title('Orignal image');
subplot(1,2,2);
imshow(uint8(value1));
title('Processed image');
 
noise_salt_img= imnoise(re_img1,'salt & pepper',0.05);
 
db_img2=double(noise_salt_img);
m=db_img2;
[r,c] = size(m);
for i=2: size(re_img1,1)-1
for j=2: size(re_img1,2)-1
    a1 =[m(i-1,j-1) m(i-1,j) m(i-1,j+1) m(i,j-1) m(i,j) m(i,j+1) m(i+1,j-1) m(i+1,j) m(i+1,j+1)];
    a2 = sort(a1);
    med= a2(5);
    db_img2(i,j)=med;
end
end
 
figure();
subplot(1,3,1);
imshow(re_img1);
title('Orignal image');
subplot(1,3,2);
imshow(noise_salt_img);
title('Noise image');
subplot(1,3,3);
imshow(uint8(db_img2));
title('Processed image');


