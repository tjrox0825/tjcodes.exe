clear all;
clc;
 
img1=imread('/Users/tjrox0825/Desktop/College.jpg');
re_img1=imresize(rgb2gray(img1),[300,300]);
 
r1=[-1 0;0 1];
r2=[0 -1;1 0];
s1=[-1 -2 -1;0 0 0;1 2 1];
s2=[-1 0 1;-2 0 2;-1 0 1];
p1=[-1 -1 -1;0 0 0;1 1 1];
p2=[-1 0 1;-1 0 1;-1 0 1];
o1=re_img1;
o2=re_img1;
db_img1 = double(re_img1);
for i=2: size(re_img1,1)-1
for j=2: size(re_img1,2)-1
    value1(i,j) = s1(1)*db_img1(i-1,j-1)+ s1(2)*db_img1(i-1,j)+ s1(3)*db_img1(i-1,j+1)+ s1(4)*db_img1(i,j-1)+ s1(5)*db_img1(i,j)+ s1(6)*db_img1(i,j+1)+ s1(7)*db_img1(i+1,j-1)+ s1(8)*db_img1(i+1,j)+ s1(9)*db_img1(i+1,j+1);
    
end
end
for i=2: size(re_img1,1)-1
for j=2: size(re_img1,2)-1
    value2(i,j) = s2(1)*db_img1(i-1,j-1)+ s2(2)*db_img1(i-1,j)+ s2(3)*db_img1(i-1,j+1)+ s2(4)*db_img1(i,j-1)+ s2(5)*db_img1(i,j)+ s2(6)*db_img1(i,j+1)+ s2(7)*db_img1(i+1,j-1)+ s2(8)*db_img1(i+1,j)+ s2(9)*db_img1(i+1,j+1);
    
end
end
figure();
subplot(1,4,1);
imshow(re_img1);
title('Orignal image');
subplot(1,4,2);
imshow(uint8(value1));
title('X gradient');
subplot(1,4,3);
imshow(uint8(value2));
title('Y gradient');
subplot(1,4,4);
imshow(uint8(value1+value2));
title('Sobel Edge Detection');
for i=2: size(re_img1,1)-1
for j=2: size(re_img1,2)-1
    value11(i,j) = p1(1)*db_img1(i-1,j-1)+ p1(2)*db_img1(i-1,j)+ p1(3)*db_img1(i-1,j+1)+ p1(4)*db_img1(i,j-1)+ p1(5)*db_img1(i,j)+ p1(6)*db_img1(i,j+1)+ p1(7)*db_img1(i+1,j-1)+ p1(8)*db_img1(i+1,j)+ p1(9)*db_img1(i+1,j+1);
    
end
end
for i=2: size(re_img1,1)-1
for j=2: size(re_img1,2)-1
    value22(i,j) = p2(1)*db_img1(i-1,j-1)+ p2(2)*db_img1(i-1,j)+ p2(3)*db_img1(i-1,j+1)+ p2(4)*db_img1(i,j-1)+ p2(5)*db_img1(i,j)+ p2(6)*db_img1(i,j+1)+ p2(7)*db_img1(i+1,j-1)+ p2(8)*db_img1(i+1,j)+ p2(9)*db_img1(i+1,j+1);
    
end
end
figure();
subplot(1,4,1);
imshow(re_img1);
title('Orignal image');
subplot(1,4,2);
imshow(uint8(value11));
title('X gradient');
subplot(1,4,3);
imshow(uint8(value22));
title('Y gradient');
subplot(1,4,4);
imshow(uint8(value11+value22));
title('Prewitt Edge Detection');
for i=2: size(re_img1,1)-1
for j=2: size(re_img1,2)-1
    valuer1(i,j) = r1(1,1)*db_img1(i,j)+r1(1,2)*db_img1(i,j+1)+r1(2,1)*db_img1(i+1,j)+r1(2,2)*db_img1(i+1,j+1);
    
end
end
for i=2: size(re_img1,1)-1
for j=2: size(re_img1,2)-1
    valuer2(i,j) = r2(1,1)*db_img1(i,j)+r2(1,2)*db_img1(i,j+1)+r2(2,1)*db_img1(i+1,j)+r2(2,2)*db_img1(i+1,j+1);
    
end
end
figure();
subplot(1,4,1);
imshow(re_img1);
title('Orignal image');
subplot(1,4,2);
imshow(uint8(valuer1));
title('X gradient');
subplot(1,4,3);
imshow(uint8(valuer2));
title('Y gradient');
subplot(1,4,4);
imshow(uint8(valuer1+valuer2));
title('Robert edge');
