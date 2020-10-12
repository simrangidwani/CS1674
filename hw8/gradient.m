%Use h = 0.0001
W1Original = W1;
[W1X, W1Y] = size(W1);
numElements = W1X*W1Y;

%initialize previous loss and ouput 
currentLoss = 0;
previousLoss = 2.6194;
output1 = zeros(100,1);

i = 1;
while i <= numElements
    %reset weight vector to original version each time you loop
    W1 = W1Original;
    %used to convert W1 to a vector
    W1 = W1(:);
    %adding h to every element
    W1(i) = W1(i)+0.0001;
    %used to compute a derivative back to 4X25 matrix
    W1 = reshape(W1,[4,25]);
    %compute current loss
    score = W1*x1;
    currentLoss = hinge_loss(score, 1);
    newDerivative = (currentLoss - previousLoss)/0.0001;
    output1(i) = newDerivative;
    previousLoss = currentLoss;
    i = i + 1;
    
end

disp("Results with learning rate h=0.0001: ");
disp(output1);

%use h=0.001
W1Original = W1;
[W1X, W1Y] = size(W1);
numElements = W1X*W1Y;

currentLoss = 0;
previousLoss = 2.6194;
output2 = zeros(100,1);

i = 1;
while i <= numElements
    %reset weight vector to original version each time you loop
    W1 = W1Original;
    %used to convert W1 to a vector
    W1 = W1(:);
    %adding h to every element
    W1(i) = W1(i)+0.001;
    %used to compute a derivative back to 4X25 matrix
    W1 = reshape(W1,[4,25]);
    %compute current loss
    score = W1*x1;
    currentLoss = hinge_loss(score, 1);
    newDerivative = (currentLoss - previousLoss)/0.001;
    output2(i) = newDerivative;
    previousLoss = currentLoss;
    i = i + 1;
    
end

disp("Results with learning rate h=0.001: ");
disp(output2);