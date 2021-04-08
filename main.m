I = imread('B1.JPG');
imshow(I);
[o,r] = PieOrBar(I);
[numberOfCircles,~] = size(o);
if(numberOfCircles > 0)
    minX=floor(o(1)-r); 
    minY=floor(o(2)-r);
    maxX=ceil(o(1)+r);
    maxY=ceil(o(2)+r);
    colors = unique(I,o,r);
    [n,x] = size(colors);
    colorCounter = zeros(n,1);
    for i = minY:maxY
    for j = minX:maxX
        exactColor = 0;
        for k = 1:n
            if(I(i,j,1) == colors(k,1) && I(i,j,2) == colors(k,2) && I(i,j,3) == colors(k,3))
                colorCounter(k) = colorCounter(k) + 1;
                exactColor = 1;
            end
        end
        if(exactColor == 1)
            continue;
        end
        index = 0;
        minDist = 5000000;
        for k = 1:n
            dist = eucledian(double(I(i,j,1)),double(I(i,j,2)),double(I(i,j,3)),double(colors(k,1)),double(colors(k,2)),double(colors(k,3)));
            if (dist < minDist)
                index = k;
                minDist = dist;
            end
        end
        distWhite = eucledian(double(I(i,j,1)),double(I(i,j,2)),double(I(i,j,3)),255.0,255.0,255.0);
        if(distWhite > minDist)
            colorCounter(index) = colorCounter(index) + 1; 
        end
    end
    end
    perc = calculatePercentage(colorCounter);
    leg = extractLegend(I);
    match(leg,colors,perc);
else
    [maximumNumVal, maxY] = fun1(I);
    fun2(maximumNumVal,maxY,I);

end