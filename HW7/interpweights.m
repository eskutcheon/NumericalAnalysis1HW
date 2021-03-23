%{
 Function returns a vector of weights w for an interpolatory quadrature
 rule for the interval [a,b] with nodes stored in x. It makes use of the
 function that returns the Lagrange polynomial L_n-1,i in a matrix with i
 rows and the function polydefint that evaluates a function as a definite
 integral.
%}

function w = interpweights(x, a, b)

n = length(x); % number of nodes
% uses makelagrange function to make a Lagrange interpolating polynomial
Lagrange = (makelagrange(x)); 
weights = ones(1,n);

for i = 1:n
    % integrates each row of Lagrange as a polynomial from a to b and
        % stores this as an entry in weights
    weights(i) = polydefint(Lagrange(i,:), a, b);
end

w = weights;
end