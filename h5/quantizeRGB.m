%part1
function [outputImg, meanColors, clusters] = quantizeRGB(origImg, k)
%read in file--delete later 
%origImg = imread(origImg);

[origX, origY, origZ] = size(origImg);
numPixels = origX * origY;

%resize
X = reshape(origImg, numPixels, 3);
resizedImg = double(X);
clusters = kmeans(resizedImg, k);

%calculating the average RGB
newImg = origImg;

i = 1;
while i <= k
    size_clusters = 0;
    sum_r = 0;
    sum_g = 0;
    sum_b = 0;
    
    %summing in each cluster
    j = 1;
    while j <= numPixels
        if clusters(j) == i
            size_clusters = size_clusters + 1;
            %getting individual RGB values
            [x,y] = ind2sub([origX, origY, origZ], j);
            sum_r = sum_r + double(newImg(x,y,1));
            sum_g = sum_g + double(newImg(x,y,2));
            sum_b = sum_b + double(newImg(x,y,3));
            
        end
        j = j + 1;
    end
    
    %compute the cluster's average RGB (Floor because we need pixel ints)
    r_average = floor(sum_r / size_clusters); 
    g_average = floor(sum_g / size_clusters);
    b_average = floor(sum_b / size_clusters);

    %iterate over every pixel and set its value to its cluster's mean
    j = 1;
    while j <= numPixels
        if clusters(j) == i
            [x,y] = ind2sub([origX, origY, origZ], j);
            
            newImg(x,y,1) = r_average;
            newImg(x,y,2) = g_average;
            newImg(x,y,3) = b_average;
            
        end
        j = j + 1;
    end
    
    i = i + 1; 
end

subplot(1, 2, 1), imagesc(origImg);
subplot(1, 2, 2), imagesc(newImg), title(['Quantized Image with k = ' num2str(k)] );

end