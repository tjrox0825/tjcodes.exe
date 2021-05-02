clear all;
clc;

a=imread("/Users/tjrox0825/Desktop/TJ.jpg");
ag=rgb2gray(a);
ar=imresize(ag,[128,128]);
ad=double(ar);
N=128;
[row,col]=size(ar);

%DCT
c4=[];
for k=0:3
for n=0:3
if k==0
c4(k+1,n+1)=1/(4^0.5);
else
c4(k+1,n+1)=((2/4)^0.5)*cos((pi*((2*n)+1)*k)/(2*4));
end
end
end

c128=[];
for k=0:127
for n=0:127
if k==0
c128(k+1,n+1)=1/(N^0.5);
else
c128(k+1,n+1)=((2/N)^0.5)*cos((pi*((2*n)+1)*k)/(2*N));
end
end
end
% disp(c128);
dctimg=c128*ad*c128;
invdct=(c128*dctimg*c128');

figure('name','Figures');
subplot(3,3,1);
imshow(ar);
title('Original image');
dct=uint8(dctimg);
subplot(3,3,2);
imshow(dct);
title('DCT image');
idct=uint8(invdct);
subplot(3,3,3);
imshow(idct);
title('Inverse image');

%DST
dst128=[];
for k=0:127
for n=0:127
dst128(k+1,n+1)=((2/(N+1))^0.5)*sin((pi*(n+1)*(k+1))/(N+1));
end
end
% disp(dst128);
dstimg=dst128*ad*dst128;
invdst=(dst128*dstimg*dst128');

subplot(3,3,4);
imshow(ar);
title('Original image');
dst=uint8(dstimg);
subplot(3,3,5);
imshow(dst);
title('DST image');
idst=uint8(invdst);
subplot(3,3,6);
imshow(idst);
title('Inverse image');

%Hartley
h128=[];
for k=1:128
    for n=1:128
        h128(k,n)=(1/(N^0.5))*(cos((2*(k-1)*(n-1)*pi)/N)+sin((2*(k-1)*(n-1)*pi)/N));
    end
end
% disp(dst128);
himg=h128*ad*h128;
invh=(h128*himg*h128');

subplot(3,3,7);
imshow(ar);
title('Original image');
h=uint8(himg);
subplot(3,3,8);
imshow(h);
title('Hartley image');
ih=uint8(invh);
subplot(3,3,9);
imshow(ih);
title('Inverse image');
