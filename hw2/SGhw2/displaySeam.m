%to display the selected type fo seam on top of the input image
%the input im should be the result of an imread
%seamDirection should be the string horizontal or vertical
%seam should be the output of find_optimal_vertical_seam or
%find_optimal_horizotal_seam 

function displaySeam(im, seam, seamDirection)
    %figure;
    if (strcmp(seamDirection, "HORIZONTAL") == true)
        hold on;
        x = [1:1:length(seam)];
        plot(x, seam, 'r');
    elseif(strcmp(seamDirection, "VERTICAL") == true)
        hold on;
        y = [1:1:length(seam)];
        plot(seam, y, 'y');
    end