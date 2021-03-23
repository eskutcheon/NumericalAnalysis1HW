% based on divided differences table found in Algorithm 7.3.3 of book
% computes the divided difference table from data stored in input
    % vectors x and y and returns vector c of divdiff f[x_0,...,x_j],
    % j = {0,1,...,n} where n+1 is the length of both x and y.
    
function c = divdiffs(x,y)

if(length(x) ~= length(y)) % checks to make sure lengths are correct
    disp("x and y vectors must be the same length!")
    return
end


%algorithm from book-doesn't work because of index 0 being inevitable with
    %some iterations
n = length(x);
d_table = ones(n,n);
d_table(:,1) = y';

% iterates through d_table(k,j) for k,j on and below the main diagonal
for j=2:n % iterates through each column >=2 
    for k=j:n % iterates through row to traverse each column j
        d_table(k,j) = (d_table(k-1,j-1)-d_table(k,j-1))/(x(k-j+1)-x(k));
    end
end
% algorithm stores difference between f(x) to the left and f(x) to the left
        % and above and divides its range of x
c = diag(d_table).'; % took transpose since it outputs a column vector

% This took several times as long as it should have doing trial and error
% on the indices because MATLAB indices are ridiculous.