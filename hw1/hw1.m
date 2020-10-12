%Generate a 1000000x1 (one million by one) vector of random numbers from a Gaussian (normal) distribution with mean of 0 and standard deviation of 5. 
% Use Matlab's randn function.
vector = 5.*randn(1000000, 1) + 0;
%disp(vector);

%Add 1 to every value in the previous list, by using a loop. 
% To determine how many times to loop, use Matlab's size function. Time this operation and print the number in the code. 
% Write that number down in answers.txt. Use Matlab's documentation to find out how to time operations.
%tic/toc starts and stops timer and prints out elapsed time
tic
for i=1:size(vector)
    vector(i,:) = vector(i,:) + 1;
end
toc;

%Now add 1 to every value in the original random vector, without using a loop. 
% Time this operation, print the time and write it down. Use a different way to print the number than the method you used above. 
% (See ways to print numbers at the beginning of the Matlab tutorial script.)
%check below
tic
vec2 = vector+1;
t = toc;
disp("Elapsed time is: " + t);

%Plot the exponential function 2.^x, for non-negative even values of x smaller than 100, without using loops.
x = 2:2:98;
plot(2.^x)

%Create two matrices A and B which, when added together, result in a 10x10 matrix C containing all numbers from 
%1 to 100. In other words, when I add A and B and convert the result to vector form, I should get a vector containing all numbers from 1 to 100. 
% In code, C = A + B; assert(all(C(:) == (1:100)') == 1); Each matrix should only be created with a single command (no loops).

A = reshape(0.5:0.5:50, 10, 10, []);
B = reshape(0.5:0.5:50, 10, 10, []);
C = A + B;
%disp(C);

%Create a script that prints all the values between 1 and 10, 
% in random order, with pauses of 1 second between each two prints.
N=10;
p=randperm(N);
for i=1:length(p)
    disp([p(i)]);
    b = mod(i,2);
    if b == 0
        pause(1);
        %disp("pause");
    end
end

%Generate two random matrices A and B, and compute their product by hand, 
% using loops. The size of the first matrix should be [5, 3] and of the second [3, 5]. 
% Check your code by comparing the loop-computed product with the product that you get from Matlab's A*B.
% A=rand(5, 3);
% B=rand(3, 5);
% prodMatrix = zeros(5, 5);
% for row=1:5
%     for col=1:5
%         sum=0;
%         for i=1:5
%             sum=sum + A(row, i) * B(i, col);
%         end
%         prodMatrix(row, col) = sum;
%     end
% end
% prodMatrix
% prod = A*B

%Read this image into Matlab as a matrix, and write down its dimensions.
I = imread('pittsburgh.png');
%imshow(I)
%whos I

%Convert the image into grayscale.
GrayIm = rgb2gray(I);
%imshow(GrayIm)

%Use the function sum and a logical operator which measures equality to a scalar, 
% to determine and write down how many pixels in the grayscale image are equal to 6. 
% Don't use loops.
pixles = GrayIm;
val = sum(GrayIm(:)==6);

%Find the darkest pixel in the image, and write its value and 
% [row, column] in your answer sheet. Don't use loops. 
% Hint: Convert to a vector first, 
% and use Matlab's ind2sub function. 
% Use Matlab's help to find out how to use that function.
darkestPix = min(GrayIm(:));
[rowVal, colVal] = find(GrayIm == darkestPix);

%Consider a 31x31 square (a square with side equal to 31 pixels) that 
% is centered on the darkest pixel from question 14. 
% Replace all pixels in that square with white pixels 
% (pixels with value 255). Do this with loops.
for row = rowVal-15:rowVal+15
    for col = colVal-15:colVal+15
        GrayIm(row, col) = 255;
    end
    %imshow(GrayIm);
end

%Take the previous image with the white square in it. 
% Place a 121x121 gray square (e.g. pixel values 150) 
% at the center of this image. 
% This time you are NOT allowed to use loops. 
% Hint: You can access a range of rows and columns 
% in a matrix; think about how.
S = size(GrayIm);
%get the row length and divide by 2 to get middle
middleRow = ceil(S(1)/2);
%take column length and divide by 2 to get middle 
middleCol = ceil(S(2)/2);
GrayIm(middleRow-60:middleRow+60, middleCol-60:middleCol+60) = 150;
%imshow(GrayIm);

%Make a new figure, display the modified image 
% (which includes both a white square and gray square), 
% and save the new figure to a file using 
% saveas(gcf, 'new_image.png').
figure;
imshow(GrayIm);
saveas(gcf, 'new_image.png');

%Using the original pittsburgh.png image, compute the scalar 
% average pixel value along each channel (R, G, B) separately, 
% then subtract the average value per channel. 
% Display the resulting image and write it to a 
% file mean_sub.png. If you choose to do this using a 
% new matrix as your image, make sure it is of the same 
% class/datatype (uint8) as the original image; 
%a simple cast would do the job. You may use loops.
totalSize = sum(sum(I));
imageSize = size(I);
redChannel = totalSize(1)/(imageSize(1) * imageSize(2));
greenChannel = totalSize(2)/(imageSize(1) * imageSize(2));
blueChannel = totalSize(3)/(imageSize(1) * imageSize(2));

I(:, :, 1) = I(:, :, 1) - redChannel;
I(:, :, 2) = I(:, :, 2) - greenChannel;
I(:, :, 3) = I(:, :, 3) - blueChannel;

figure;
imshow(I)
saveas(gcf, "mean_sub.png");
