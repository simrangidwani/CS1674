file = fullfile('scenes_all', 'scenes_all');
imds = imageDatastore(file, 'IncludeSubfolders',true, 'LabelSource', 'foldernames')
numImages = 100;
[imdsTrain, imdsTest] = splitEachLabel(imds, numImages, 'randomize');

net = alexnet;
net.Layers;
freezed_layers=net.Layers(1:16);
layers=[
    freezed_layers;
    fullyConnectedLayer(8);
    softmaxLayer;
    classificationLayer];

options = trainingOptions('sgdm', ...
    'MaxEpochs', 1, ...
    'InitialLearnRate', .001, ...
    'Verbose', false, ...
    'Plots', 'training-progress');

newNet= trainNetwork(imdsTrain, layers, options);
predictor = classify(newNet, imdsTest);
tester=imdsTest.Labels;

correct=0.0;
for i=1:size(predictor, 1)
    if (predictor(i)==tester(i))
        correct=correct+1;
    end
end
ratio = correct/size(predictor, 1)


