% The following function takes an array x and returns an array of
% barycentric weights based on those interpolation points in x.

function w=baryweights(x)
% x is the vector of length n+1 of distinct interpolation points x_0, x_1, ... x_n

weights = ones(1,length(x)); % preallocates for speed
for j=1:(length(x)) % each iteration of j will have a weight in w
    temp = 1;   % temp variable for computing each weight in inner loop
    for i=1:(length(x)) % inner loop handles each iteration of product series
        if(i ~= j) % ensures below fraction is not undefined anywhere
            temp = temp * (1/(x(j) - x(i))); % w_j formula
        end
    end
    weights(j) = temp; % after conclusion of inner loop, weight is assigned
end

w = weights; % return w