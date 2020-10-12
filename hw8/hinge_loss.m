%to compute the Li loss for an individual sample
function [loss] = hinge_loss(scores, correct_class)

    if correct_class == 1
        score1 = max(0, (scores(2)-scores(1)+1));
        score2 = max(0, (scores(3)-scores(1)+1));
        score3 = max(0, (scores(4)-scores(1)+1));
        
    elseif correct_class == 2
        score1 = max(0, (scores(1)-scores(2)+1));
        score2 = max(0, (scores(3)-scores(2)+1));
        score3 = max(0, (scores(4)-scores(2)+1));
        
    elseif correct_class == 3
        score1 = max(0, (scores(1)-scores(3)+1));
        score2 = max(0, (scores(2)-scores(3)+1));
        score3 = max(0, (scores(4)-scores(3)+1));
        
    elseif correct_class == 4
        score1 = max(0, (scores(1)-scores(4)+1));
        score2 = max(0, (scores(2)-scores(4)+1));
        score3 = max(0, (scores(3)-scores(4)+1));
        
    end
    
    loss = score1+score2+score3;

end