clear all;
clc;

a=imread("/Users/tjrox0825/Desktop/TJ.jpg");
ag=rgb2gray(a);
ar=imresize(ag,[128,128]);
ad=double(ar);
N=128;
[row,col]=size(ad);
figure('name','Figures');
subplot(1,3,1);
imshow(ar);
title('Original image');


temp=double(zeros(size(ad)));
for y=1:N:row-N+1
for x=1:N:col-N+1
croppedImage = ad((y:y+N-1),(x:x+N-1));
t=getSlantTransform(croppedImage,N);
temp((y:y+N-1),(x:x+N-1))=t;
end
end
st=uint8(temp);
subplot(1,3,2);
imshow(st);
title('Slant image');

% Inverse Slant
temp1=double(zeros(size(ad)));
for y=1:N:row-N+1
for x=1:N:col-N+1
croppedImage = temp((y:y+N-1),(x:x+N-1));
t=getInvSlantTransform(croppedImage,N);
temp1((y:y+N-1),(x:x+N-1))=t;
end
end
invst=uint8(temp1);
subplot(1,3,3);
imshow(invst);
title('Inverse Slant image');


function t=getSlantTransform(im,N)
s=sltmtx(log2(N));
t=s*im*s';
end
function t=getInvSlantTransform(im,N)
s=sltmtx(log2(N));
t=s'*im*s;
end
function T = sltmtx(L)
m = 2^L;
T = zeros(m);
[a0,a1,b0,b1,c0,c1,d0,d1] = gethf(L);
h = [a0+a1*(0:m-1), b0+b1*(0:m-1)];
f = [c0+c1*(0:m-1), d0+d1*(0:m-1)];
T(1,1:m) = h(1:m) + h(m+1:2*m); 
T(2,1:m) = f(1:m) + f(m+1:2*m);
for i = L-1:-1:1
for k = 1:2^(L-i-1)
m = 2^i;
[a0,a1,b0,b1] = getg(i);
g = [a0+a1*(0:m-1), b0+b1*(0:m-1)];
gr = g(2*m:-1:1);
le = 2^(i+1);
q = 2^(L-i)+2*(k-1)+1;
T(q,[1:le]+le*(k-1)) = g; 
T(q+1,[1:le]+le*(k-1)) = gr; 
end
end
end
function [a0,a1,b0,b1,c0,c1,d0,d1] = gethf(l)
m = 2^l;
u = 1/sqrt(m);
v = sqrt((2* m^2+1)/3);
a0 = u*(v+1)/(2*m) ;
b0 = u*(2*m-v-1)/(2*m) ;
a1 = u/m ;
    b1 = -a1 ;
    r = -sqrt((3*m-sqrt(6*m^2+3))/(3*m+sqrt(6*m^2+3)));
    c0 = r*a0;
    c1 = r*a1;
    d0 = -b0/r;
    d1 = -b1/r;
end
function [a0,a1,b0,b1,a0r,a1r,b0r,b1r] = getg(i)
    m  = 2^i;
    s1 = 6*sqrt( m / ( (m^2-1)*(4*m^2-1))   );
    t1 = 2*sqrt( 3/ (m*(m^2-1)));
    s0 = -s1 *(m-1) / 2;
    t0 = ( (m+1)* s1/3 - m* t1 ) *(m-1) /(2*m);
    a0 = (s0 + t0)/2;
    b0 = (s0 - t0)/2;
    a1 = (s1 + t1)/2;
    b1 = (s1 - t1)/2;
    % time reversed version
    a0r = b0+b1*(m-1);
    a1r = -b1;
    b0r = a0+a1*(m-1);
    b1r = -a1;
end
