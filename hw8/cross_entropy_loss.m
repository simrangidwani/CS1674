%to compute the Li loss for an individual sample
function [loss] = cross_entropy_loss(scores, correct_class)
    
    %compute ground truth 
    groundTruthScore = scores(correct_class);
    numerator = exp(groundTruthScore);
    
    if correct_class == 1
        denominator1 = exp(scores(2));
        denominator2 = exp(scores(3));
        denominator3 = exp(scores(4));
        
    elseif correct_class == 2
        denominator1 = exp(scores(1));
        denominator2 = exp(scores(3));
        denominator3 = exp(scores(4));
        
    elseif correct_class == 3
        denominator1 = exp(scores(1));
        denominator2 = exp(scores(2));
        denominator3 = exp(scores(4));
        
    elseif correct_class == 4
        denominator1 = exp(scores(1));
        denominator2 = exp(scores(2));
        denominator3 = exp(scores(3));
        
    end
    
    %summation of demoniators
    denominator = denominator1 + denominator2 + denominator3;
    
    %total probability
    probability = numerator / denominator;
    loss = -log10(probability);

end