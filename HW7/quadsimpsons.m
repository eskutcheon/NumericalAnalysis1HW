function I = quadsimpsons(f,a,b)
% function uses Simpsons Rule with 3 nodes to approximate I[f] on [a,b]
I = ((b-a)/6)*(f(a) + 4*f((a+b)/2) + f(b));
end