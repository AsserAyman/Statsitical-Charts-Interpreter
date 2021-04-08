function [ maximumNumVal, maxY] = fun1(I)

[row  cols channels]=size(I);
cropedImg=I(:,2:floor(cols/10),:);
%figure,imshow(cropedImg);

crop = rgb2gray(cropedImg);
BW = im2bw(crop);

results = ocr(BW,'TextLayout','Block');

maxY = results.CharacterBoundingBoxes(1,2);

maximumNumVal = str2double(results.Words(1,1));

maxY

maximumNumVal

end

