function [p2] = apply_homography(p1,H)
    % set w
    p1(3) = 1;    
    p1 = p1';
    
    % carry out formula
    % x/w, y/w to convert back'
    p_prime = H.*p1;
    r = p_prime(1)/p_prime(3);
    c = p_prime(2)/p_prime(3);
    p2 = [r c];
    
end