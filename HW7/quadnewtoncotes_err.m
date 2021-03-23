function quadnewtoncotes_err(f, a, b)
format long
actual = integral(f,a,b);
n = 1;
err = zeros(1,1);
while true
    lastwarn('');
    estimate = quadnewtoncotes(f, a, b, n);
    if n > 1
        err = [err (abs(actual-estimate))];
    end
    [warnmsg, msgid] = lastwarn;
    if strcmp(msgid,'MATLAB:polyfit:RepeatedPointsOrRescale')
        break
    end
    n = n+1;
end
output = sprintf('As the number of nodes increases up to %d, when it becomes ill-conditioned, the error between the actual value of the integral and the approximation for n=1,...,%d is', n, n);
disp(output);
disp(err);
end