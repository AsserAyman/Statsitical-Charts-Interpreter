function [output] = extractLegend(I)
original = I;
I =im2bw(I,0.03);
I = ~I;
[height,width] = size(I);
largestObject = bwareafilt(I,1);
[labels,~] = bwlabel(largestObject);
stats = regionprops(labels,'BoundingBox');
x =stats(1).BoundingBox(1);
y =stats(1).BoundingBox(2);
w =stats(1).BoundingBox(3);
h =stats(1).BoundingBox(4);
if(h < 10 || w < 10)
    I = original;
    I =im2bw(I,0.99);
    I = ~I;
    [height,width] = size(I);
    largestObject = bwareafilt(I,1);
    [labels,~] = bwlabel(largestObject);
    stats = regionprops(labels,'BoundingBox');
    x =stats(1).BoundingBox(1);
    y =stats(1).BoundingBox(2);
    w =stats(1).BoundingBox(3);
    h =stats(1).BoundingBox(4);
end
if(w*   h > 0.5*(height*width))
    largestObject = bwareafilt(I,2);
    [labels,~] = bwlabel(largestObject);
    stats = regionprops(labels,'BoundingBox');
    x =stats(2).BoundingBox(1);
    y =stats(2).BoundingBox(2);
    w =stats(2).BoundingBox(3);
    h =stats(2).BoundingBox(4);
end

output = imcrop(original,[x+2,y+2,w-2,h-2]);
figure, imshow(output);
end