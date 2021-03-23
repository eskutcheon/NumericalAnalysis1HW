function I = quadcompsimp(f, a, b, n)

if mod(n,2) ~= 0 % checks to see if n is even
    error('The number of nodes in a midpoint rule must be even')
end

h = (b-a)/n; % length of subinterval
sumf = f(a)+f(b); %initializes sum with endpoints of [a,b]
for i=1:(n-1) % for x_1 to x_(n-1)
    if (mod(i,2) == 1) % for every odd iteration 
        sumf = sumf+(4*f(a+(i*h))); % multiplies f(x_i) by 4
    else % even iterations
        sumf = sumf+(2*f(a+(i*h))); % multiplies f(x_i) by 2
    end
end

I = (h/3)*sumf;
end