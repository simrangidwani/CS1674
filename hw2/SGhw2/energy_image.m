function [energyImage, Ix, Iy] = energy_image(im)
    grayIm = rgb2gray(im);
    doubledIm = im2double(grayIm);
    
    valuesX = [1 0 -1; 2 0 -2; 1 0 -1];
    valuesY = valuesX;
    
    Ix = imfilter(doubledIm, valuesX);
    %figure; imshow(Ix);
    Iy = imfilter(doubledIm, valuesY);
    %figure; imshow(Iy);
    
    energyImage = sqrt((Ix).^2+(Iy).^2);
%     figure; 
%     imshow(energyImage);