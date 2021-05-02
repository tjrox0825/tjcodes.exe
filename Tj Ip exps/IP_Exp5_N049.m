clear all;
clc;

a=imread("/Users/tjrox0825/Desktop/bw.jpg");
ag=rgb2gray(a);
ar=imresize(ag,[128,128]);
ad=double(ar);
n=128*128;

%Hadamard
h2=[1 1; 1 -1];
h4=kron(h2,h2);
h8=kron(h2,h4);
h16=kron(h2,h8);
h32=kron(h2,h16);
h64=kron(h2,h32);
h128=kron(h2,h64);

htimg=h128*ad*h128;
invht=(h128*htimg*h128)/n;

figure('name','Figures');
subplot(3,3,1);
imshow(ar);
title('Original image');
ht=uint8(htimg);
subplot(3,3,2);
imshow(ht);
title('Hadamard image');
iht=uint8(invht);
subplot(3,3,3);
imshow(iht);
title('Inverse image');

%DFT
dftimg=fft2(ad);
inv_dftimg=ifft2(dftimg);

subplot(3,3,4);
imshow(ar);
title('Original image');
df=uint8(dftimg);
subplot(3,3,5);
imshow(df);
title('Discrete Fourier image');
idf=uint8(inv_dftimg);
subplot(3,3,6);
imshow(idf);
title('Inverse image');

%Walsh
w8=[];
c=[];
for i=1:8
c(i)=0;
for j=2:8
if (h8(i,j)>0 && h8(i,j-1)<0) || (h8(i,j)<0 && h8(i,j-1)>0)
c(i)=c(i)+1;
end
end
end
for i=1:8
m=find(c==min(c));
for j=1:8
w8(i,j)=h8(m,j);
end
c(m)=9;
end
disp("Hadamard 8x8:");
disp(h8);
disp("Walsh 8x8:");
disp(w8);

w128=[];
c=[];
for i=1:128
    c(i)=0;
    for j=2:128
        if (h128(i,j)>0 && h128(i,j-1)<0) || (h128(i,j)<0 && h128(i,j-1)>0)
            c(i)=c(i)+1;
        end
    end
end
for i=1:128
    m=find(c==min(c));
    for j=1:128
        w128(i,j)=h128(m,j);
    end
    c(m)=129;
end

wtimg=w128*ad*w128;
invwt=(w128*wtimg*w128)/n;

subplot(3,3,7);
imshow(ar);
title('Original image');
wt=uint8(wtimg);
subplot(3,3,8);
imshow(wt);
title('Walsh image');
iwt=uint8(invwt);
subplot(3,3,9);
imshow(iwt);
title('Inverse image');
