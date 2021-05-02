clear all;
clc;
clear;
clc;
img=imread('/Users/tjrox0825/Desktop/Tarun.jpg');
img=rgb2gray(img);
img=imresize(img,[256,256]);
subplot(5,2,1), imshow(img);
img=double(img);

mask=([1 1 1;1 1 1 ;1 1 1]);

% opening image
for i=2:255
for j=2:255
a=img(i-1,j-1)*mask(1,1); 
b=img(i-1,j)*mask(1,2) ;
c=img(i-1,j+1)*mask(1,3); 
d=img(i,j-1)*mask(2,1) ;
e=img(i,j)*mask(2,2) ;
f=img(i,j+1)*mask(2,3); 
g=img(i+1,j-1)*mask(3,1); 
h=img(i+1,j)*mask(3,2) ;
k=img(i+1,j+1)*mask(3,3);
open_ero(i,j)=min([a, b, c, d, e, f, g, h,k]);
end
end

[x,y]=size(open_ero);

for i=2:x-1
for j=2:y-1
a=open_ero(i-1,j-1)*mask(1,1); 
b=open_ero(i-1,j)*mask(1,2) ;
c=open_ero(i-1,j+1)*mask(1,3); 
d=open_ero(i,j-1)*mask(2,1) ;
e=open_ero(i,j)*mask(2,2) ;
f=open_ero(i,j+1)*mask(2,3); 
g=open_ero(i+1,j-1)*mask(3,1); 
h=open_ero(i+1,j)*mask(3,2) ;
k=open_ero(i+1,j+1)*mask(3,3);
open_dil(i,j)=max([a,b,c,d,e,f,g,h,k]);
end
end


% closing image
for i=2:255
for j=2:255
a=img(i-1,j-1)*mask(1,1); 
b=img(i-1,j)*mask(1,2) ;
c=img(i-1,j+1)*mask(1,3); 
d=img(i,j-1)*mask(2,1) ;
e=img(i,j)*mask(2,2) ;
f=img(i,j+1)*mask(2,3); 
g=img(i+1,j-1)*mask(3,1); 
h=img(i+1,j)*mask(3,2) ;
k=img(i+1,j+1)*mask(3,3);
close_dil(i,j)=max([a, b, c, d, e, f, g, h,k]);
end
end

[x,y]=size(close_dil);
for i=2:x-1
for j=2:y-1
a=close_dil(i-1,j-1)*mask(1,1); 
b=close_dil(i-1,j)*mask(1,2) ;
c=close_dil(i-1,j+1)*mask(1,3); 
d=close_dil(i,j-1)*mask(2,1) ;
e=close_dil(i,j)*mask(2,2) ;
f=close_dil(i,j+1)*mask(2,3); 
g=close_dil(i+1,j-1)*mask(3,1); 
h=close_dil(i+1,j)*mask(3,2) ;
k=close_dil(i+1,j+1)*mask(3,3);
close_ero(i,j)=min([a,b,c,d,e,f,g,h,k]);
end
end

% open followed by closing
for i=2:255
for j=2:255
a=img(i-1,j-1)*mask(1,1); 
b=img(i-1,j)*mask(1,2) ;
c=img(i-1,j+1)*mask(1,3); 
d=img(i,j-1)*mask(2,1) ;
e=img(i,j)*mask(2,2) ;
f=img(i,j+1)*mask(2,3); 
g=img(i+1,j-1)*mask(3,1); 
h=img(i+1,j)*mask(3,2) ;
k=img(i+1,j+1)*mask(3,3);
open_close_ero(i,j)=max([a, b, c, d, e, f, g, h,k]);
end
end

[x,y]=size(open_close_ero);
for i=2:x-1
for j=2:y-1
a=open_close_ero(i-1,j-1)*mask(1,1); 
b=open_close_ero(i-1,j)*mask(1,2) ;
c=open_close_ero(i-1,j+1)*mask(1,3); 
d=open_close_ero(i,j-1)*mask(2,1) ;
e=open_close_ero(i,j)*mask(2,2) ;
f=open_close_ero(i,j+1)*mask(2,3); 
g=open_close_ero(i+1,j-1)*mask(3,1); 
h=open_close_ero(i+1,j)*mask(3,2) ;
k=open_close_ero(i+1,j+1)*mask(3,3);
open_close_dil(i,j)=min([a,b,c,d,e,f,g,h,k]);
end
end

% close followed by open
[x,y]=size(close_ero);
for i=2:x-1
for j=2:y-1
        a=close_ero(i-1,j-1)*mask(1,1); 
        b=close_ero(i-1,j)*mask(1,2) ;
        c=close_ero(i-1,j+1)*mask(1,3); 
        d=close_ero(i,j-1)*mask(2,1) ;
        e=close_ero(i,j)*mask(2,2) ;
        f=close_ero(i,j+1)*mask(2,3); 
        g=close_ero(i+1,j-1)*mask(3,1); 
        h=close_ero(i+1,j)*mask(3,2) ;
        k=close_ero(i+1,j+1)*mask(3,3);
        close_open_ero(i,j)=min([a, b, c, d, e, f, g, h,k]);
    end
end

[x,y]=size(close_open_ero);

for i=2:x-1
    for j=2:y-1
        a=close_open_ero(i-1,j-1)*mask(1,1); 
        b=close_open_ero(i-1,j)*mask(1,2) ;
        c=close_open_ero(i-1,j+1)*mask(1,3); 
        d=close_open_ero(i,j-1)*mask(2,1) ;
        e=close_open_ero(i,j)*mask(2,2) ;
        f=close_open_ero(i,j+1)*mask(2,3); 
        g=close_open_ero(i+1,j-1)*mask(3,1); 
        h=close_open_ero(i+1,j)*mask(3,2) ;
        k=close_open_ero(i+1,j+1)*mask(3,3);
        close_open_dil(i,j)=max([a,b,c,d,e,f,g,h,k]);
    end
end

img=uint8(img);
open_ero=uint8(open_ero);
open_dil=uint8(open_dil);
close_dil=uint8(close_dil);
close_ero=uint8(close_ero);
open_close_ero=uint8(open_close_ero);
close_open_dil=uint8(close_open_dil);
figure('name','EXPERIMENT 9');
subplot(4,3,1),imshow(img),title('Original');
subplot(4,3,2),imshow(open_ero),title('Eroded');
subplot(4,3,3),imshow(open_dil),title('Open');
subplot(4,3,4),imshow(img),title('Original');
subplot(4,3,5),imshow(close_dil),title('Dialted');
subplot(4,3,6),imshow(close_ero),title('Close');
subplot(4,3,7),imshow(img),title('Original');
subplot(4,3,8),imshow(open_dil),title('Open');
subplot(4,3,9),imshow(open_close_ero),title('Open->Close');
subplot(4,3,10),imshow(img),title('Original');
subplot(4,3,11),imshow(close_ero),title('Close');
subplot(4,3,12),imshow(close_open_dil),title('Close->Open');
