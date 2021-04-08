function [] = match(legend,colors,perc)
bw = im2bw(legend,0.93);
bw = ~bw;
figure,imshow(legend);
figure,imshow(bw);
%Get Boxes Only in Image
SE = strel('square',7);
box=imerode(bw,SE);
box=imdilate(box,SE);
box = bwareaopen(box,10);

figure,imshow(box);

%Match Color Indices for every word
[n,~] = size(colors);
indices = zeros(n,1);
[label,no]=bwlabel(box);
stats = regionprops(label,'BoundingBox','Centroid');
disp(colors);
    for i = 1:no
    x =stats(i).Centroid(1);
    y =stats(i).Centroid(2);
    x = ceil(x);
    y = ceil(y);
    minDist = 5000000;
       for k = 1:n
           dist = eucledian(double(legend(y,x,1)),double(legend(y,x,2)),double(legend(y,x,3)),double(colors(k,1)),double(colors(k,2)),double(colors(k,3)));
           if (dist < minDist)
               index = k;
               minDist = dist;
           end
       end
       indices(i) = index;
    end

disp(indices);

%Words only
words = bw - box;
figure,imshow(words);

SE = strel('square',2);
words = imerode(words,SE);

SE = strel('rectangle',[1,5]);
words = imdilate(words,SE);

SE = strel('rectangle',[3 5]);
words = imdilate(words,SE);



figure,imshow(words);

[labelText,noText]=bwlabel(words);
statsText = regionprops(labelText,'BoundingBox');

boxToWord = zeros(n,1);
for i = 1:no
    xC =stats(i).Centroid(1);
    yC =stats(i).Centroid(2);
    xC = ceil(xC);
    yC = ceil(yC);
    minDist = 500000;
    for j=1:noText
        xT = statsText(j).BoundingBox(1);
        yT = statsText(j).BoundingBox(2);
        %hT = statsText(j).BoundingBox(4);
        %hT = hT/2;
        %yT = yT + hT;
        xT = ceil(xT);
        yT = ceil(yT);
        wDist = sqrt( (double(xC)-double(xT))^2 + (double(yC)-double(yT))^2);
        if(wDist < minDist)
            minDist = wDist;
            boxToWord(i) = j;
        end
    end
end
disp(boxToWord);

for i=1:no
    colorOfBox = indices(i);
    percentageOfColor = perc(colorOfBox);
    wordOfColor = boxToWord(i);
    x =statsText(wordOfColor).BoundingBox(1);
    y =statsText(wordOfColor).BoundingBox(2);
    w =statsText(wordOfColor).BoundingBox(3);
    h =statsText(wordOfColor).BoundingBox(4);
    croppedWord = imcrop(legend,[x,y,w,h]);
    position = [1 1];
    value = [percentageOfColor];
    disp(percentageOfColor);
    croppedWord = insertText(croppedWord, position, value,'AnchorPoint','LeftTop', 'FontSize', 3);
    figure,imshow(croppedWord);

end

end

