% Function calculates definite integral of function given by vector of 
    % polynomal coefficients of p, evaluated on [a,b]

function I = polydefint(p, a, b)

q = polyint(p); % finds the indefinite integral of the polynomial given in
    % p while assuming constant of integration C = 0

upper = polyval(q,b); % evaluates the polynomial q with b for F(b)
lower = polyval(q,a); % evaluates the polynomial q with a for F(a)
I = upper-lower; % finds difference by Fundamental Theorem of Calculus

end