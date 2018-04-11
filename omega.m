% defining the function
fs = '-32.17/(2*x^2)*((exp(x)-exp(-x))/2 -sin(x))-1.7';

% defining the error, TOL
a = -1;
b = -0.1;
TOL = 1e-5;
error = inf;

% applying bisection
f = inline(fs);
A = f(a);
iter = 1;
while ( error > TOL )
    c = (a+b)/2;
    C = f(c);
    error(iter) = (b-a)/2;
    
    if( A*C > 0 )
        a = c;
        A = C;
    else
        b = c;
    end
    
    iter = iter+1;
end


