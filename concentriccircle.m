close all
clear all
clc
a=imread('C:\Users\parve\Downloads\coloredChips.png');
subplot(2,2,1);
imshow(a);
red=a(:,:,1);
subplot(2,2,2);
imshow(red);
r1=red<255&red>210;
subplot(2,2,3);
imshow(r1);
r2=medfilt2(r1,[15 15]);
r3=bwareaopen(r2,100);
subplot(2,2,4);
imshow(r3);
hold on
L=bwlabel(r3,8);
k=regionprops(L,'BoundingBox','Centroid');
for s=1:length(k);
x=k(s).BoundingBox;
y=k(s).Centroid;
rectangle('Position',x,'edgecolor','r','linewidth',5);
plot(y(1),y(2),'r+');
end