function I = quadmidpoint(f,a,b)
% uses the midpoint quadrature rule to estimate the integral I[f] on [a,b]
I = (b-a)*f((a+b)/2);
end