%{
This function computes the integral of f over the interval [a,b] using an
    n-node closed Newton-Cotes rule.
The function interpquad is used to compute the sum with a variable number
    of nodes
%}

function I = quadnewtoncotes(f, a, b, n)
x = linspace(a, b, n);  % creates a vector of n evenly-spaced nodes 
    % equivalent to (a+(i*((b-a)/n))) for i = 0 to n
I = interpquad(f, a, b, x);
    % computes the sum using the vector of nodes, x, and its weights
end