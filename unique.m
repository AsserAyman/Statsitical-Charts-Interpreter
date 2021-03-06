function [output] = unique(I,o,r)
minX=floor(o(1)-r);
minY=floor(o(2)-r);
maxX=ceil(o(1)+r);
maxY=ceil(o(2)+r);
output = [];
for i = minY+2:maxY-2
    for j = minX+2:maxX-2
        colorFound = 0;
        if(I(i,j,1) == I(i-1,j,1) && I(i,j,1) == I(i+1,j,1) && I(i,j,1) == I(i,j-1,1) && I(i,j,1) == I(i,j+1,1) && ...
           I(i,j,1) == I(i-1,j-1,1) && I(i,j,1) == I(i+1,j+1,1) && I(i,j,1) == I(i+1,j-1,1) && I(i,j,1) == I(i-1,j+1,1) && ...           
           I(i,j,2) == I(i-1,j,2) && I(i,j,2) == I(i+1,j,2) && I(i,j,2) == I(i,j-1,2) && I(i,j,2) == I(i,j+1,2) && ...
           I(i,j,2) == I(i-1,j-1,2) && I(i,j,2) == I(i+1,j+1,2) && I(i,j,2) == I(i+1,j-1,2) && I(i,j,2) == I(i-1,j+1,2) && ...            
           I(i,j,3) == I(i-1,j,3) && I(i,j,3) == I(i+1,j,3) && I(i,j,3) == I(i,j-1,3) && I(i,j,3) == I(i,j+1,3) && ...
           I(i,j,3) == I(i-1,j-1,3) && I(i,j,3) == I(i+1,j+1,3) && I(i,j,3) == I(i+1,j-1,3) && I(i,j,3) == I(i-1,j+1,3) && ...
           ...
           ...
           I(i,j,1) == I(i-2,j,1) && I(i,j,1) == I(i+2,j,1) && I(i,j,1) == I(i,j-2,1) && I(i,j,1) == I(i,j+2,1) && ...
           I(i,j,1) == I(i-2,j-2,1) && I(i,j,1) == I(i+2,j+2,1) && I(i,j,1) == I(i+2,j-2,1) && I(i,j,1) == I(i-2,j+2,1) && ...           
           I(i,j,2) == I(i-2,j,2) && I(i,j,2) == I(i+2,j,2) && I(i,j,2) == I(i,j-2,2) && I(i,j,2) == I(i,j+2,2) && ...
           I(i,j,2) == I(i-2,j-2,2) && I(i,j,2) == I(i+2,j+2,2) && I(i,j,2) == I(i+2,j-2,2) && I(i,j,2) == I(i-2,j+2,2) && ...            
           I(i,j,3) == I(i-2,j,3) && I(i,j,3) == I(i+2,j,3) && I(i,j,3) == I(i,j-2,3) && I(i,j,3) == I(i,j+2,3) && ...
           I(i,j,3) == I(i-2,j-2,3) && I(i,j,3) == I(i+2,j+2,3) && I(i,j,3) == I(i+2,j-2,3) && I(i,j,3) == I(i-2,j+2,3))
            if(I(i,j,1) >250 && I(i,j,2) >250 && I(i,j,3) >250)
                continue;
            end
            for k=1:size(output)
               if( I(i,j,1) == output(k,1) && I(i,j,2) == output(k,2) && I(i,j,3) == output(k,3)) 
                    colorFound = 1;
                    break;
               end
            end
            if (colorFound == 0)
                col = [I(i,j,1),I(i,j,2),I(i,j,3)];
                output = [output;col];
            end
        end
    end
end
end
