% function computes the divided difference table from the given data stored
% in x and y, where elements in x are distinct, and the derivative values
% in yp. The function returns a vector of divdiffs f[z_0,...,z_j],
% j = 0,1,...,2n+1, where n is the length of both x and y.

function c = hermdivdiffs(x, y, yp)

n = length(x);
new_x = ones(1,2*n); % to be used in div diff table calculation

% the following loop checks to see if all values in x are unique first
for i=1:n
    for j=1:n-i
        if x(i) == x(i+j)
            error('The vector x must have only distinct values!');
        end
    end
end

% this loop will fill out the x-vector to be used in our divdiff table calculation
for p=1:2:2*n
    new_x(p) = x((p+1)/2); % x_(2i-1) for i=0,1,...
    new_x(p+1) = x((p+1)/2); % x_(2i)
end

d_table = ones(2*n,2*n); % creates and preallocates d_table to be filled
d_table(1:2:((2*n)-1),1) = y(1:n);  % first column's odd elements filled w/ y-values
d_table(2:2:2*n,1) = y(1:n);    % first column's even elements filled w/ same y-values
d_table(2:2:2*n,2) = yp(1:n);   % second column's even elements filled w/ 1st derivatives

% fills 2nd column's div diffs the same way as typical Newton coefficients
for m=3:2:2*n
    d_table(m,2) = (d_table(m,1)-d_table(m-1,1))/(new_x(m)-new_x(m-1));
end

for j=3:2*n % iterates through each column > 2 
    for k=j:2*n % iterates through row to traverse each column j
        d_table(k,j) = (d_table(k,j-1)-d_table(k-1,j-1))/(new_x(k)-new_x(k-j+1));
    end
end
    
c = diag(d_table).';