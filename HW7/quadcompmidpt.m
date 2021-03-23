
function I = quadcompmidpt(f, a, b, n)

if mod(n,2) ~= 0
    error('The number of nodes in a midpoint rule must be even')
end

h = (b-a)/n; % since we have n subintervals with n+1 nodes
midpts = a+h:2*h:b-h;
% this vector represents the midpoints between nodes, x1,x3,...,x_n-1
    % where xi = a + i*h

% initialized vector of length = number of midpoints
y = zeros(1,length(midpts));
for i=1:length(midpts)
    y(i) = f(midpts(i)); % evaluates vector of f(x_i) values
end
    
I = 2*h*sum(y); % multiplies sum of y-values and 2h

end