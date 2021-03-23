% function accepts as input vectors x and y, both of length n+1,
    % representing the data points (x_0,y_0),(x_1,y_1),...,(x_n,y_n), and a
    % vector of x values xx.
% uses Algorithm 7.3.5 as well as function divdiffs(x,y)
% computes the value of the Newton interpolating polynomial for the given
    % data points at each x-value in corresponding y-values must be 
    % returned in yy with same dimensions as xx

function yy = newtonval(x,y,xx)

n = length(x); % used as bound on x_n for MATLAB's index 1

% calls script divdiffs to store row vector of divided differences
coef = divdiffs(x,y);
% temporary array (y-values) initialized with the last element of coef
basis = coef(n)*ones(1,length(xx));

%{
    From book: P_n(x) = \sum[coef(j)*N(j)] where coef are the divided
    difference coefficients and N is the product (xx-x(i)) for i=0:j-1
    Since we have the divided differences already, we begin with an index
    of n-1 in the for loop, since the product sequence goes from 1:j-1 for
    j in the summation. Since xx is a collection of x-values, the operation
    is applied to each element in xx simultaneously. The basis is updated
    every iteration of the loop by doing element-wise multiplication (since
    length(xx)==length(basis)) with the difference of each xx term and x(i)
    and the previous incarnation of the basis and adding coef(i).
%}

for i=n-1:-1:1
    basis = coef(i)+(basis.*(xx-x(i)));
end

yy = basis; % returns the y-values stored in basis