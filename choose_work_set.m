function [i] = choose_work_set(X,y,alpha,C,kernel_type)
%CHOOSE_WORK_SET Summary of this function goes here
%   Detailed explanation goes here
tolerate = 1e-5;
inside_idx = find((alpha > tolerate) & (alpha  < 0.6*C - tolerate));

if isempty(inside_idx)
    i = 1;
else
    X = X(inside_idx,:);
    y = y(inside_idx);
    alpha = alpha(inside_idx);
    
    w = sum(y.*alpha.*X);
    b = mean(y - X*w');
    
    distance = abs(y.*alpha.*K(X,w,kernel_type) + y.*b);
    max_break_kkt_idx = find(distance == max(distance));
    i = max_break_kkt_idx(1); 
end

end

