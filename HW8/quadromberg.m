%{
This function uses Romberg integration to compute the integral of f on
    [a,b] using Richardson Extrapolation
- Uses function quadcomptrap to perform composite midpoint rule
    for the first entry of each row in the Romberg table using n = 2^(j-1).
-Uses the Romberg integration algorithm exactly
%}

function I = quadromberg(f, a, b, J)

h = b-a; % the length of the first subinterval is the whole interval

T = ones(J,J); % table initialized as JxJ

for j = 1:J
    T(j,1) = quadcomptrap(f,a,b,2^(j-1));
    
    for k = 2:j
        % Using Romberg integration algorithm
        T(j,k) = T(j,k-1)+((T(j,k-1)-T(j-1,k-1))/(4^(k-1)-1));
    end
    h = h/2; % divides subinterval in half for each row iteration
end

I = T(J,J);