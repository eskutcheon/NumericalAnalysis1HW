% function approximates the integral of f over [a,b] and uses interpweights
    % to find the weights of the interpolating polynomial for the sum

function I = interpquad(f, a, b, x)
% nodes in x must be in the interval [a,b]

n = length(x); % number of nodes
sum = 0;    % initialized integral's summation to 0.
% uses nodes in x to find weights of the interpolatory quadrature rule
weights = interpweights(x, a, b);

for i = 1:n
    sum = sum + (f(x(i))*weights(i)); % \sum(f(x_i)*(w_i))
end

I = sum;
disp(I); % just doing this since the terminal isn't displaying it
end