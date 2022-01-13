function [U,V] = compute_UV(C,alpha_i,alpha_j,yi,yj)
%COMPUTE_LH Summary of this function goes here
%   Detailed explanation goes here
if yi~=yj
    U = max(0,alpha_j - alpha_i);
    V = min(C,C - alpha_i + alpha_j);
    
elseif yi == yj
    U = max(0,alpha_i + alpha_j - C);
    V = min(C,alpha_i + alpha_j);
else
    display("yi,yj get error")
end

end

