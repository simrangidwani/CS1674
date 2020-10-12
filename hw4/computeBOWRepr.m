% Part II: Image Description with SIFT Bag-of-Words (10 points)
function [bow_repr] = computeBOWRepr(features, means)
    k=size(means, 1);
    bow_repr = zeros(1, k);
    
    dist_mat = pdist2(features, means);
    [~, vocab] = min(dist_mat, [], 2);
    
    for i = 1:k
        bow_repr(i) = sum(vocab == i);
    end
    
    bow_repr = bow_repr / sum(bow_repr);
    

