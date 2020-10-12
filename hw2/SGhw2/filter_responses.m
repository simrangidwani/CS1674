%For each filter, generate a 2X4 subplot showing the rows:
% (1) the filter and a blank subplot
% (2) the responses to the cardinal images
% (3) the responses to the leopard images
% (4) the responses to the panda images
filenames = {'cardinal1.jpg', 'cardinal2.jpg', 'leopard1.jpg', 'leopard2.jpg', 'panda1.jpg', 'panda2.jpg'};
temp = cell(1, 6);

for k=1:length(filenames)
    img=imread(filenames{k});
    %figure
    GrayIm = rgb2gray(img);
    filenames{k} = imresize(GrayIm, [100, 100]);
    %imshow(resizedIm);
end

for i=1:length(F)-1
    for j=1:length(filenames)
       image = filenames{j};
       imshow(filenames{j});
       filteredIm = F(:,:,i);
       B=imfilter(image, filteredIm);
       temp{j} = B;
    end
    subplot(2, 4, 1), imagesc(filteredIm);
    subplot(2, 4, 3), imagesc(temp{1}), title('cardinal1.jpg');
    subplot(2, 4, 4), imagesc(temp{2}), title('cardinal2.jpg');
    subplot(2, 4, 5), imagesc(temp{3}), title('leopard1.jpg');
    subplot(2, 4, 6), imagesc(temp{4}), title('leopard2.jpg');
    subplot(2, 4, 7), imagesc(temp{5}), title('panda1.jpg');
    subplot(2, 4, 8), imagesc(temp{6}), title('panda2.jpg');
    saveas(gcf, strcat('responses_to_filter_', num2str(i), '.png'));
end


