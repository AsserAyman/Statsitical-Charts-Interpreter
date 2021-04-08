function [output] = eucledian(r1,g1,b1,r2,g2,b2)
    output = sqrt( (r1-r2)^2 + (g1-g2)^2 + (b1-b2)^2 );
end
