%Implement a function function [N] = my_unique(M) that takes in a matrix M, 
% removes duplicate rows from that input matrix and outputs the result as matrix N. 
% You cannot call Matlab's unique function. Loops are allowed.

function [N] = my_unique(M)
    dupMatrix = zeros(size(M,1), 1);
    for i = 1:size(M, 1)
        row = M(i,:);
        for j = 1:size(M, 1)
            if j~=i
                if M(i,:) == M(j,:)
                    for dup = 1:size(dupMatrix, 1)
                        if dup == 0
                            dupMatrix(dup, 1) = j;
                        end
                    end
                end
            end
        end
    end


end