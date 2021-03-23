function I = quadcomptrap(f, a, b, n)

h = (b-a)/n;
sumf = f(a) + f(b);

for i=1:(n-1) % since f(x_0)=f(a) and f(x_n)=f(b)
    sumf = sumf+(2*f(a+(i*h)));
end

I = (h/2)*sumf;