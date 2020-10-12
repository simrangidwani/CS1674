im1 = imread("baby_happy.jpg");
im2 = imread("baby_weird.jpg");
im1 = imresize(rgb2gray(im1), [512, 512]);
im2 = imresize(rgb2gray(im2), [512, 512]);
im1_blur = imgaussfilt(im1, 10, "FilterSize", 31);
im2_blur = imgaussfilt(im2, 10, "FilterSize", 31);
im2_detail = im2-im2_blur;
addedIm = im1_blur+im2_detail;
imshow(addedIm);
saveas(gcf, "hybrid_twins.png");

