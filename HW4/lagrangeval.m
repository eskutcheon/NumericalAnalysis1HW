% function accepts input vectors x and y of length n+1 with the data to be
    % fit, and a vector xx of x-values
% The function uses rhe barycentric weights to compute the value of the
    % Lagrange interpolating polynomial for the given data points at each
    % x-value in xx. 
% The corresponding y-values will be returned in yy, with the same
    % dimensions as xx.

function yy=lagrangeval(x,y,xx)

w = baryweights(x); % calls the function for the barycentric weights of x

if(length(x) ~= length(y)) % checks to make sure lengths are correct
    disp("x and y vectors must be the same length!")
end

temp_yy = ones(1, length(xx)); % preallocates variable that will be used 
                                % for the storage of y-values
for i=1:length(x) % outer loop handles each value of xx
    % initializes sum variables for inner loop and resets with each new xx
    sum1 = 0; 
    sum2 = 0;
    % inner loop handles the iterations for x, y, and w relative to the xx_i
    for j=1:length(x)
        if(xx(j) ~= x(j)) % ensures nothing is undefined
        % The following is the formula of P_n(xx_i)
            sum1 = sum1 + ((y(j)*w(j)/(xx(i) - x(j))));
            sum2 = sum2 + (w(j)/(xx(i) - x(j)));
        end
    end
    temp_yy(i) = sum1/sum2; % saves each result of P_n(xx_i) to this vector
end
yy = temp_yy; % returns the y-values.