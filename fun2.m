function [] = fun2( maxVal , maxY,I)

bw0 = im2bw(I,0.99);
se = strel('rectangle' , [30 30]);
bw0=~bw0;
myerodedimg = imerode(bw0, se);
myerodedimg = imdilate(myerodedimg,se);

[L,num]=bwlabel(myerodedimg);
if num<3
    display('101');
    bw0 = im2bw(I,0.8);
se=strel('rectangle' , [30 30]);
bw0=~bw0;
myerodedimg = imerode(bw0, se);
myerodedimg = imdilate(myerodedimg,se);
[L,num]=bwlabel(myerodedimg);
end


%boundingBox
s = regionprops(L,'BoundingBox','Centroid');
disp(s);
bboxes=vertcat(s(:).BoundingBox);
bboxesCen=vertcat(s(:).Centroid);
disp(bboxes);
minY = ceil(bboxes(1,2)+bboxes(1,4));
yAxiesHeight = minY - maxY;
heightPerUnit = yAxiesHeight / maxVal;
barHeight = zeros(num);
for i = 1:num
    barHeight(i) = bboxes(i,4);
end
barVal = barHeight/heightPerUnit;
barVal = ceil(barVal);
barVal
barColors=uint8(zeros(num,3));
for i=1:num
     barColors(i,:)=I(ceil(bboxesCen(i,2)),ceil(bboxesCen(i,1)),:);
end
barColors
leg = extractLegend(I);
match(leg,barColors,barVal);
end
