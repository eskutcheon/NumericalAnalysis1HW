% This function takes an input vector p and returns a vector c of 
% coefficients of a finite-difference approximation of f'(x_0) using 
% textbook formula where the indices -j,...,k are in p. The function also
% returns a second output err, the constant coefficient of the error term
% of the approximation

function [c, err] = makediff_Lagrange(p)

n = length(p); % k+j+1 if j>=0 and k-j+1 if j<0
% coefficients of Lagrange polynomial from p given in L using makelagrange.m
L = makelagrange(p);

c = L(:,n-1); % The coefficients are then simply the penultimate column, 
    % since this column would be only the constant terms after applying the 
    % derivative at x0. Substituting x0 in the derivative eliminates all 
    % terms except those in this column.
    
err = (((-1)^(n-1))*factorial(abs(p(1)))*factorial(p(end)))/factorial(n);
% The error term now comes from the formula derived in 9.1.4, where err is
% ((1)^n)(j!)(k!)/(n+1), 