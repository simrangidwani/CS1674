% read in images
img1 = imread('img3.png');
img2 = imread('img4.png');

%to examine and pick points
figure;
imshow(img1);
impixelinfo;
figure;
imshow(img2);
impixelinfo;

PA = [50 87; 269 41; 116 30; 123 234];
PB = [67 96; 159 62; 66 59; 120 227];

% estimate homography
H = estimate_homography(PA, PB);

% pick new point
point = [50,87];
p2 = apply_homography(point, H);

% display images
subplot(1,2,1), imagesc(img1)
hold on
plot(175,106,'gx')

subplot(1,2,2), imagesc(img2)
hold on
plot(p2(1), p2(2), 'yx')

pad1 = size(img2, 1);
pad2 = size(img2, 2);

mosaic_image = img2;
mosaic_image = padarray(mosaic_image, [pad1 pad2], 1);

for x=1:size(img1, 1)
    for y=1:size(img1, 2)
        pt = [x; y; 1];
        new_point = apply_homography(pt, H);
        x1 = floor(new_point(1, :));
        y1 = floor(new_point(2, :));
        x2 = ceil(new_point(1,:));
        y2 = ceil(new_point(2,:));
        
        pixel = img1(x, y, :);
        if x1 > 0 && y1 > 0 && x2 > 0 && y2 > 0 && y1 <= size(img2, 2) && y2 <= size(img2, 2) && x1 <= size(img2, 1) && x2 <= size(img2, 1)
            mosaic_image(size(img1, 2) + x1, size(img1, 1) + y1, :) = pixel;
            mosaic_image(size(img1, 2) + x2, size(img1, 1) + y2, :) = pixel;
        else
            mosaic_image(size(img1, 2) + x1, size(img1, 1) + y1, :) = pixel;
            mosaic_image(size(img1, 2) + x2, size(img1, 1) + y2, :) = pixel;
        end
    end
end
%figure;
%imshow(mosaic_image);
