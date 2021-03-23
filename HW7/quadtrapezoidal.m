function I = quadtrapezoidal(f,a,b)
% This function uses the trapezoidal rule to approximate I[f] on [a,b]
I = ((b-a)/2)*(f(a)+f(b));
end