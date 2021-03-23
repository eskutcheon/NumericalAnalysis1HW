function [x, niter] = bisection(f, a, b, tol)

interv = a:0.0001:b; % probably good enough for small intervals
test = f(interv); % evaluates all these values at f to see if they change sign

% The following line taken from here: 
% https://www.mathworks.com/matlabcentral/answers/403409-check-if-all-vector-elements-have-same-sign
if ~any(diff(sign(test(test~=0)))) % checks to see if sign stays the same
    error("The function must change sign on the given interval!")
end
x=[]; % initialized empty vector x for while loop condition
n = 0; % initializes number of iterations to 0 
while isempty(x) % loops until converging to the midpoint
   m = (a+b)/2; 
   if (f(m) == 0) || ((b-a) < (2*tol))
       x = m;
   end
   if (f(a)*f(m) < 0)
       b = m;
   else
       a = m;
   end
   n = n+1;
end
niter = n


end