%Create a function function [val] = fib(n) that returns the n-th number (n >= 1) 
% in the Fibonacci sequence 1, 1, 2, 3, 5, 8, 13...

function [val] = fib(n)
    fibVec = zeros(n, 1);
    fibVec(1) = 1;
    fibVec(2) = 1;
    
    for i=3:n
        fibVec(i) = fibVec(i-2) + fibVec(i-1);
    end
    
    val = fibVec(n);
end