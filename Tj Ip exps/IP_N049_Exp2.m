clear all;
clc;
 
img1=imread('/Users/tjrox0825/Desktop/College.jpg');
img2=imread('/Users/tjrox0825/Desktop/College.jpg');
 
re_img1=imresize(rgb2gray(img1),[100,100]);
re_img2=imresize(rgb2gray(img2),[100,100]);
re_img1_mod=re_img1;
 
 
for i=1:5
for j=1:5
        re_img1_mod(i,j )= randi([50,100]);
end
end
figure();
subplot(131);
imshow(re_img1)
subplot(132);
imshow(re_img2);
subplot(133)
imshow(re_img1_mod);
re_img1=double(re_img1);
re_img2=double(re_img2);
re_img1_mod=double(re_img1_mod);
 
 
 
sum=0;
for i =1:100
for j =1:100
                distance=(re_img1(i,j)-re_img1(i,j))^2;
                sum=sum+distance;
end
end
eu_dist=sqrt(sum);
disp("The euclidian distance for IMG1 with itself is " + eu_dist);
sum1=0;
for i =1:100
for j =1:100
                distance=(re_img1(i,j)-re_img1_mod(i,j))^2;
                sum=sum+distance;
end
end
 
eu_dist1=sqrt(sum);
disp("The euclidian distance for IMG1 and modified IMG1 is " + eu_dist1);
 
sum2=0;
for i =1:100
for j =1:100
                distance=(re_img1(i,j)-re_img2(i,j))^2;
                sum=sum+distance;
end
end
eu_dist2=sqrt(sum);
disp("The euclidian distance for IMG1 and IMG2 is " + eu_dist2);
man_dist=0;
for i =1:100
for j =1:100
                distance=abs(re_img1(i,j)-re_img1(i,j));
                man_dist=man_dist+distance;
end
end
 
disp("The Manhattan distance for IMG1 with itself is " + man_dist);
man_dist1=0;
for i =1:100
for j =1:100
                distance=abs(re_img1(i,j)-re_img1_mod(i,j));
                man_dist1=man_dist1+distance;
end
end
 
disp("The Manhattan distance for IMG1 and IMG1 modified is " + man_dist1);
man_dist2=0;
for i =1:100
for j =1:100
                distance=abs(re_img1(i,j)-re_img2(i,j));
                man_dist2=man_dist2+distance;
end
end
 
disp("The Manhattan distance for IMG1 and IMG2 is " + man_dist2);

