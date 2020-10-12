% CS1674: Homework 4
% Due: 10/8/2019, 11:59pm

function [features] = compute_features(x, y, scores, Ix, Iy)
    
mag = zeros(11, 11);
grad_bin = zeros(size(mag));
grad_angle = zeros(11, 11);
hist = zeros(1, 8);

features = zeros(size(x, 1), 8);

rem_x = []; rem_y = []; rem_s = [];
for i=1:size(scores, 1)
    if x(i) <= 5 || y(i) <=5 || x(i) > size(Ix, 1) || y(i) > size(Ix, 2)
        rem_x = [rem_x, i];
        rem_y = [rem_y, i];
    end
end
x(rem_x, :) = [];
y(rem_y, :) = [];

for i=1:size(x, 1) 
    for row=x(i)-5:x(i)+5
        for col=y(i)-5:y(i)+5
            r = x(i)-row+6;
            c = y(i)-col+6;
            %compute gradient magnitude and gradient angle
            mag(r, c) = sqrt(Ix(row, col)^2 + Iy(row, col)^2);
            %if mag = 0 then x and y grad are 0 and should ignore the
            %orientation for that pixle
            grad_angle(r, c) = atand(Iy(row, col) / Ix(row, col));
            if (mag(r, c) == 0)
                grad_angle(r, c)=0;
            end
        end
    end
        
    %quantize the gradient orientations in 8 bins -- variable with the same
    %size as the image that says which bin gradient at that pixle belongs too
    for k=1:size(grad_angle,1)
        for j=1:size(grad_angle, 2)
            if (grad_angle(k, j) < -67.5 && grad_angle(k, j) >= -90)
                grad_bin(k, j) = 1;
            elseif(grad_angle(k,j) < -45 && grad_angle(k, j) >= -67.5)
                grad_bin(k, j) = 2;
            elseif(grad_angle(k, j) < -22.5 && grad_angle(k, j) >= -45)
                grad_bin(k, j) = 3;
            elseif(grad_angle(k, j) < 0 && grad_angle(k, j) >= -22.5)
                grad_bin(k, j) = 4;
            elseif(grad_angle(k, j) < 22.5 && grad_angle(k, j) >= 0)
                grad_bin(k, j) = 5;
            elseif(grad_angle(k, j) < 45 && grad_angle(k, j) >= 22.5)
                grad_bin(k, j) = 6;
            elseif(grad_angle(k, j) < 67.5 && grad_angle(k, j) >= 45)
                grad_bin(k, j) = 7;
            else
                grad_bin(k, j) = 8;
            end
        end
    end
    
    %populate the histogram--sum the gradient magnitutdes that are between -90
    %and -67.5
    for m = size(hist, 2)
        val = find(grad_bin == m);
        [row, col] = ind2sub(size(grad_bin), val);
        for n = 1:size(row)
            hist(m) = hist(m) + mag(row(n), col(n));
        end
    end

%normalize, clip all values to 0.2 and normalize again to be of unit length using
%hist_final = hist_final / sum(hist_final);
    hist = hist / sum(hist);
    hist (hist > 0.2);
    hist_final = hist(:)/sum(hist);
    features(i, :) = hist_final;
end


    
