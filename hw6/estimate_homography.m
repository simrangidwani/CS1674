function[H] = estimate_homography(PA, PB)
    A = [];
    
    % compute homography
    for i=1:size(PA,1)
        x = PA(i,1);
        y = PA(i,1);
        xt = PB(i,1);
        yt = PB(i,1);
        matrix = [-x,-y,-1,0,0,0,x*xt,y*xt,xt; 0,0,0,-x,-y,-1,x*yt,y*yt,yt];
        A = [A;matrix];
    end
    
    % solving for H
    [~, ~, V] = svd(A); 
    h = V(:, end); 
    H = reshape(h, 3, 3)';
    
end