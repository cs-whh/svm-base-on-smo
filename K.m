function ker=K(X,x_i,k)
switch k
    case 'linear'
        ker = X*x_i';
    case 'gauss'
        delta = 0.5;   
        H = sum((X - x_i).^2,2);
    	ker = exp(-H/(delta^2));
end
end