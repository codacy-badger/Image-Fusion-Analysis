close all
clear
clc
%% Read Images
% the size of images must be equal
%[clock1.png, E:\study\PROJECTS\IMAGE PROCESSING\PRE-FINAL YEAR] = uigetfile('*.png','Load Image 1 ');cd(E:\study\PROJECTS\IMAGE PROCESSING\PRE-FINAL YEAR);
a=imread('leaf1.jpg');
%[clock2.png, E:\study\PROJECTS\IMAGE PROCESSING\PRE-FINAL YEAR] = uigetfile('*.png','Load Image 2 ');cd(E:\study\PROJECTS\IMAGE PROCESSING\PRE-FINAL YEAR);
b=imread('leaf2.jpg');
%%   Wavelet Transform 
[a1,b1,c1,d1]=dwt2(a,'db2');
[a2,b2,c2,d2]=dwt2(b,'db2');
[k1,k2]=size(a1);
%% Fusion Rules
%% Average Rule for finding 
for i=1:k1
    for j=1:k2
        a3(i,j)=(a1(i,j)+a2(i,j))/2;
   end
end
%% Max Rule
for i=1:k1
    for j=1:k2
        b3(i,j)=max(b1(i,j),b2(i,j));
        c3(i,j)=max(c1(i,j),c2(i,j));
        d3(i,j)=max(d1(i,j),d2(i,j));
    end
end
%% Inverse Wavelet Transform 
c=idwt2(a3,b3,c3,d3,'db2');
imshow(a)
title('First Image')
figure,imshow(b)
title('Second Image')
figure,imshow(c,[])%why is the fused image only visible in grayscale
title('Fused Image')
