file = fullfile('scenes_all', 'scenes_all');
imds = imageDatastore(file, 'IncludeSubfolders',true, 'LabelSource', 'foldernames')
numImages = 100;
[imdsTrain, imdsTest] = splitEachLabel(imds, numImages, 'randomize');

layers = [
    imageInputLayer([227 227 3])
    convolution2dLayer(11, 50)
    reluLayer
    maxPooling2dLayer(3, 'Stride', 1)
    convolution2dLayer(5, 60)
    reluLayer
    maxPooling2dLayer(3, 'Stride', 2)
    fullyConnectedLayer(8)
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm', ...
    'MaxEpochs', 1, ...
    'InitialLearnRate', .001, ...
    'Verbose', false, ...
    'Plots', 'training-progress');
net = trainNetwork(imdsTrain, layers, options);

predictor = classify(net, imdsTest);
tester = imdsTest.Labels;

correct=0.0;
for i=1:size(predictor, 1)
    if (predictor(i)==tester(i))
        correct=correct+1;
    end
end
ratio = correct/size(predictor, 1) * 100
