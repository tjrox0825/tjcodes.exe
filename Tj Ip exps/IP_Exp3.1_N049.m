clear all;
clc;
 
img1=imread('/Users/tjrox0825/Desktop/Levis.jpg');
%img1=imread('/Users/tjrox0825/Desktop/Levis.jpg');
re_img1=imresize(rgb2gray(img1),[300,300]);
 
figure();
imshow(re_img1);
title('Orignal')
 
img_neg = re_img1;
 
%img_neg = double(img_neg);
 
img2 = img_neg(:);
L = max(img2);
 
 
for i=1:300
for j=1:300
        img_neg(i,j)= L-img_neg(i,j);
end
end
 
%img_neg = unit8(img_neg)
figure();
imshow(img_neg);
title("Negative")
 
img_thres = re_img1;
 
t = 100;
 
for i=1:300
for j=1:300
    if (img_thres(i,j)<=t)
        img_thres(i,j)=0;
    else
        img_thres(i,j)=255;
    end
end
end
 
figure();
imshow(img_thres);
title("Thresholding")
 
img_cont = re_img1;
 
r1 = input("Enter the value of r1: ");
r2 = input("Enter the value of r2: ");
s1 = input("Enter the value of s1: ");
s2 = input("Enter the value of s2: ");
 
alpha=(s1)/(r1);
beta=(s2-s1)/(r2-r1);
gamma=(L-s2)/(L-s1);
 
for i=1:300
    for j=1:300
        pix=img_cont(i,j);
        if (pix <= r1)
            newpix=alpha*pix;
            img_cont(i,j)=newpix;
        elseif((pix<r1)&& pix<=r2)
            newpix=beta*(pix-r1)+s1;
            img_cont(i,j)=newpix;
        else
            newpix = gamma*(r1-r2)+s2;
            img_cont(i,j)=newpix;
        end
    end
end
 
figure();
imshow(img_cont);
title("Image contrasting")
 
img_bac = re_img1;
wbimg1 = re_img1;
 
for row=1:300
    for col=1:300
        if(wbimg1(row,col)>= r1 && wbimg1(row,col)<= r2)
            wbimg1(row,col)= L-1;
        else
            wbimg1(row,col) = 0;
        end
    end
end
 
for i=1:300
for j=1:300
        if (img_bac(i,j)>=r1 && img_bac(i,j)<=r2)
            img_bac(i,j)=L-1;
        end
end
end
 
figure();
imshow(wbimg1);
title("Grey slicing(No background)")
figure();
imshow(img_bac);
title("Grey slicing(With background)")
 
img_copy = re_img1;
figure();
C=zeros(300,300,8);
for k=1:8
for i=1:size(re_img1,1)
for j=1:size(re_img1,2)
C(i,j,k)=bitget(img_copy(i,j),k) ; %Bit slicing
end
end
subplot(3,3,k+1), imshow(C(:,:,k)), title(['Bit Plane ',num2str(k-1)]);
end
