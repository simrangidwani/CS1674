function [] = generate_results(filename, reduceAmt, reduceWhat)
    
    im = imread(filename);
    
    if(strcmp(reduceWhat, "HEIGHT"))
        for i=1:reduceAmt
            if(i==1)
                resizedIm = reduceHeight(im, true);
            else
                resizedIm = reduceHeight(resizedIm, false);
            end
        end
        standard = imresize(im, [size(im, 1)-reduceAmt, size(im, 2)]);
    elseif(strcmp(reduceWhat, "WIDTH"))
        for i=1:reduceAmt
            if(i==1)
                resizedIm = reduceWidth(im, true);
            else
                resizedIm = reduceWidth(resizedIm, false);
            end
        end
        standard = imresize(im, [size(im, 1), size(im, 2)-reduceAmt]);
    else
    end
    
    %display subplot
    figure;
    sgtitle(strcat('Reduced ', reduceWhat, ' by ', num2str(reduceAmt)));
    subplot(1, 3, 1); imshow(im); title('Original');
    subplot(1, 3, 2); imshow(resizedIm); title("Content-Aware");
    subplot(1, 3, 3); imshow(standard); title("Standard");