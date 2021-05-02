clc;
clear all;
 
img1=imread('/Users/tjrox0825/Desktop/animal.jpg');
img1=imresize(img1,[256,256],'nearest');
img1=rgb2gray(img1);
% subplot(1,3,1);
% imwrite(img1,'I1.jpg')
% imshow(img1);
% title('Input image 3')
 
img2=imread('/Users/tjrox0825/Desktop/TJ.jpg');
img2=imresize(img2,[256,256],'nearest');
img2=rgb2gray(img2);
% subplot(1,3,2);
% imwrite(img2,'I2.jpg')
% imshow(img2);
% title('Input image 1')
 
img3=imread('/Users/tjrox0825/Desktop/Tarun.jpg');
img3=imresize(img3,[256,256],'nearest');
img3=rgb2gray(img3);
% subplot(1,3,3);
% imwrite(img3,'I3.jpg')
% imshow(img3);
% title('Input image 3')
 
ig1=double(img1);
% ig2=double(img2);
% ig3=double(img3);
 
figure('Name','FULL DCT');
%DCT
subplot(2,2,1);
imshow(img1);
title('Input image');
 
h=dctmtx(256);
subplot(2,2,2);
imshow(h);
title('DCT matrix 256*256');
 
 
it=(h*ig1*h');
subplot(2,2,3);
imshow(uint8(it));
title('DCT transform');
 
 
for i=1:256
    for j=1:256
        if(i+j>150)
            it(i,j)=0;
        end
    end
end
 
in=(h'*it*h);
subplot(2,2,4);
imwrite(uint8(in),'o13.jpg');
imshow(uint8(in));
title('DCT inverse');
 
 
figure('Name','4x4 Block DCT');
% 4*4 Block DCT
subplot(2,2,1);
imshow(img1);
title('Input image');
 
h=dctmtx(4);
subplot(2,2,2);
imshow(h);
title('DCT matrix 4*4');
 
t=zeros(4,4);
dd=zeros(4,4);
temp=zeros(256,256);
for i=1:4:256
    for j=1:4:256
        for k=1:4
            for l=1:4
                t(k,l)=ig1((i+k-1),(j+l-1));
            end
        end
        dd=(h*t*h');
        for m=1:4
            for n=1:4
                if(m+n>3)
                    dd(m,n)=0;
                end
            end
        end
        in=(h'*dd*h);
        for o=1:4
            for p=1:4
                temp((i+o-1),(j+p-1))=in(o,p);
            end
        end 
    end
end
 
temp=uint8(temp);
imwrite(temp,'o23.jpg');
subplot(2,2,3);
imshow(temp);
title('DCT inverse');
 
figure('Name','8x8 Block DCT');
% 8*8 Block DCT
subplot(2,2,1);
imshow(img1);
title('Input image');
 
h=dctmtx(8);
subplot(2,2,2);
imshow(h);
title('DCT matrix 8*8');
 
t=zeros(8,8);
dd=zeros(8,8);
temp=zeros(256,256);
for i=1:8:256
    for j=1:8:256
        for k=1:8
            for l=1:8
                t(k,l)=ig1((i+k-1),(j+l-1));
            end
        end
        dd=(h*t*h');
        for m=1:8
            for n=1:8
                if(m+n>5)
                    dd(m,n)=0;
                end
            end
        end
        in=(h'*dd*h);
        for o=1:8
            for p=1:8
                temp((i+o-1),(j+p-1))=in(o,p);
            end
        end 
    end
end
 
temp=uint8(temp);
imwrite(temp,'o33.jpg');
subplot(2,2,3);
imshow(temp);
title('DCT inverse');