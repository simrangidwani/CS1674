%Now write a function function [B] = normalize_columns(A) which instead ensures 
% that the sum in each column is 1.

function [B] = normalize_columns(A)
    B = A./sum(A);
end