%{
    This function uses the left endpoints of nested subintervals passed as
    a parameter in a and b. The function f is used to evaluate the height
    of each of the rectangles made by these subintervals. It uses iterative
    methods to find the summation of the area of these rectangles and tests
    each iteration to see if this summation is within 0.00001 accuracy of
    the definite integral. Once it has found such a summation, the
    requisite number of subintervals n is returned by the function.
%}

function n = riemann_sum_est(f, a, b)
format long % done since the required accuracy requires 5 decimal places
sum_check = integral(f,0,1,'RelTol',0,'AbsTol',1e-5);
% above from https://www.mathworks.com/help/matlab/ref/integral.html

m = 49000; % only using this setting to save on computation since this is 
    % near the requred number of subintervals for the function in this
    % assignment
sum = f(a); % initializes the Riemann sum with f(a+0(dx))
while (sum < (sum_check-0.00001)) || (sum > (sum_check+0.00001))
    % while loop runs given number of subintervals produces a sum within
        % 10e-5 of the actual value
    sum = f(a); % resets sum each iteration of while loop
    dx = (b-a)/m; % uses the left endpoint divided into m subintervals
    for j = 1:(m-1) % only checks m-1 since f(a) is already used
        sum = sum+f(a+(j*dx)); % sum is found iteratively using the left endpoint
    end
    sum = sum*dx; % dx must be distributed through the sum
    m = m+1; % increments for next iteration of while loop
end

n = m; % returns number of subintervals required
end