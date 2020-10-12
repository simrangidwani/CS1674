function [centers] = detectCircles(im, edges, radius, top_k)

centers = zeros(top_k, 2);
[numEdges, ~] = size(edges);
quant_val = 5;    
[imX, imY, imZ] = size(im);

h = zeros(imX, imY);

for i = 1:numEdges
    a = edges(i, 1) - radius * cosd( edges(i,4) );
    b = edges(i, 2) - radius * sind( edges(i,4) );
    
    a = abs(ceil(a/quant_val)) + 1;
    b = abs(ceil(b/quant_val)) + 1;
    h(a,b) = h(a,b) + 1;  
    
end

[~, sortedH] = sort(h(:), 'descend');
[x,y] = ind2sub(size(h), sortedH(1:top_k));

for i = (1:top_k)
    centers(i,1) = x(i) * quant_val;
    centers(i,2) = y(i) * quant_val;
end

figure;
imshow(im);
viscircles(centers, radius * ones(size(centers, 1), 1));
impixelinfo;
title(['Detected Circles with radius = ' num2str(radius)] );

end