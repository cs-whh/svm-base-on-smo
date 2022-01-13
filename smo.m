function alpha = smo(X,y,C,kernel_type,max_iter,epsilon,tolerate)
%SMO Summary of this function goes here
%   Detailed explanation goes here

if (nargin<4)
    kernel_type = 'linear';
end
if (nargin<5)
    max_iter = 20;
end
if (nargin<6)
    epsilon = 1e-3;
end
if (nargin<7)
    tolerate = 1e-5;
end

N = size(y,1);
iter_counts = 0;
alpha_change = 100; % a large number
alpha = C*rand(N,1);

while (iter_counts < max_iter && alpha_change>epsilon)
   iter_counts  = iter_counts +  1;
   i = choose_work_set(X,y,alpha,C,kernel_type);
   alpha_prev = alpha; % use in check convergence 
   for j=1:size(alpha,1) % second index
       if j==i
           continue
       end
       xi = X(i,:);
       xj = X(j,:);
       yi = y(i);
       yj = y(j);
       
       kappa = K(xi,xi,kernel_type) + K(xj,xj,kernel_type) - 2*K(xi,xj,kernel_type);
       if kappa == 0
           continue
       end
       
       [U,V] = compute_UV(C,alpha(i),alpha(j),yi,yj);
       
       idx = find(alpha>0 & alpha<C);
       if isempty(idx)
           idx = 1;
       else
           idx = idx(1);
       end
       
       b = y(idx) - sum(alpha.*y.*K(X,X(idx,:),kernel_type));
       
       Ei = sum(alpha.*y.*K(X,xi,kernel_type)) + b - yi;
       Ej = sum(alpha.*y.*K(X,xj,kernel_type)) + b - yj;
      
       alpha_j_unc = alpha(j) + (yj*(Ei - Ej))/kappa;
       
       % Fix
       if alpha_j_unc > V
           alpha_j_new = V;
       elseif alpha_j_unc < U
           alpha_j_new = U;
       else
           alpha_j_new = alpha_j_unc;
       end
       
       alpha_i_new = alpha(i) + yi*yj*(alpha(j) - alpha_j_new);    
       
       alpha(i) = alpha_i_new;
       alpha(j) = alpha_j_new;
   end
% Check convergence
alpha_change = norm(alpha - alpha_prev);
end
end




