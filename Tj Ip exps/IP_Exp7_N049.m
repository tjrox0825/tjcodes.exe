clear all;
clc;

a=imread('/Users/tjrox0825/Desktop/Research.jpeg');
ag=rgb2gray(a);
ar=imresize(ag,[256,256]);
ad=double(ar);
[row,col]=size(ad);

figure('name','Figures');
subplot(3,3,1);
imshow(ar);
title('Original image');

lpmask=([1 1 1; 1 1 1; 1 1 1]/9); 
hpmask=([-1 -1 -1; -1 8 -1; -1 -1 -1]/9); 

lp=[];
hp=[];
for i=1:row
for j=1:col
lpsum=0;
hpsum=0;
if i==1 || i==row || j==1 || j==col
lp(i,j)=ad(i,j);
hp(i,j)=ad(i,j);
else
for k=1:3
for l=1:3
lpsum=lpsum+(ad(i+k-2,j+l-2)*lpmask(k,l));
hpsum=hpsum+(ad(i+k-2,j+l-2)*hpmask(k,l));
end
end
lp(i,j)=lpsum;
hp(i,j)=hpsum;
end
end
end
lpi=uint8(lp);
subplot(3,3,2);
imshow(lpi);
title('LPF Level 1');
hpi=uint8(hp);
subplot(3,3,3);
imshow(hpi);
title('HPF Level 1');

lpf=[];
hpf=[];
k=1;
for i=1:2:row
l=1;
for j=1:2:col
lpf(k,l)=lp(i,j);
hpf(k,l)=hp(i,j);
l=l+1;
end
k=k+1;
end
dlp=uint8(lpf);
subplot(3,3,4);
imshow(dlp);
title('Downsized LPF');
dhp=uint8(hpf);
subplot(3,3,5);
imshow(dhp);
title('Downsized HPF');

[r,c]=size(lpf);
ll=[];
lh=[];
hl=[];
hh=[];
for i=1:r
for j=1:c
llsum=0;
lhsum=0;
hlsum=0;
hhsum=0;
if i==1 || i==r || j==1 || j==c
            ll(i,j)=lpf(i,j);
            lh(i,j)=lpf(i,j);
            hl(i,j)=hpf(i,j);
            hh(i,j)=hpf(i,j);
        else
            for k=1:3
                for l=1:3
                    llsum=llsum+(lpf(i+k-2,j+l-2)*lpmask(k,l));
                    hlsum=hlsum+(hpf(i+k-2,j+l-2)*lpmask(k,l));
                    lhsum=lhsum+(lpf(i+k-2,j+l-2)*hpmask(k,l));
                    hhsum=hhsum+(hpf(i+k-2,j+l-2)*hpmask(k,l));
                end
            end
            ll(i,j)=llsum;
            lh(i,j)=lhsum;
            hl(i,j)=hlsum;
            hh(i,j)=hhsum;
        end
    end
end
lli=uint8(ll);
subplot(3,3,6);
imshow(lli);
title('LL Band');
lhi=uint8(lh);
subplot(3,3,7);
imshow(lhi);
title('LH Band');
hli=uint8(hl);
subplot(3,3,8);
imshow(hli);
title('HL Band');
hhi=uint8(hh);
subplot(3,3,9);
imshow(hhi);
title('HH Band');
