clear all;
I = imread('4.png');
bw0 = im2bw(I,0.99);
se=strel('rectangle' , [30 30]);
bw0=~bw0;
myerodedimg = imerode(bw0, se);
myerodedimg = imdilate(myerodedimg,se);
figure ,imshow(myerodedimg);
%--------------------------------------------
In = edge(myerodedimg,'canny');
BW1=In;
figure,imshow(BW1);
%--------------------------------
%boundingBox
[l,~]=bwlabel(BW1);
s = regionprops(l,'BoundingBox','Centroid');
disp(s);
bboxes=vertcat(s(:).BoundingBox);
disp(bboxes);
ocrResults=ocr(BW1,bboxes,'CharacterSet','.0123456789','TextLayout','block');
minY = ceil(bboxes(1,2)+bboxes(1,4));
yAxiesHeight = maxY - minY;

figure,imshow(I);