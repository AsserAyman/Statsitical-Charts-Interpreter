function [output,radius] = PieOrBar(input)
[centers,radii] = imfindcircles(input,[90,200],'ObjectPolarity','dark','Sensitivity',0.96);
output = centers;
radius = radii;
end

