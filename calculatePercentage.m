function [output] = calculatePercentage(colorCounter)
    total = 0.0;
    [n,~] = size(colorCounter);
    for i=1:n
        total = total + colorCounter(i);
    end
    output = zeros(n,1);
    for i=1:n
        output(i) = output(i) + (colorCounter(i)/total) *100;
    end
end