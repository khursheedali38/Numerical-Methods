% initialize x and y as symbolic variables
syms y ;

% function to integrate, we are integrating the first quadrant only
f(y) = ((36 - 4*y^2)/9)^0.5;
l(y) = (1 + diff(f)^2)^0.5;

% calculate n and h
b = 3
a = 0
h = sqrt((12 * 1e-6) / ((b-a) * subs(diff(l, 2), 0)));
h = eval(h)
n = (b-a) / h;
n = ceil(n);

I = 0;  
 
% calculating the points
for i = 1:n+1
    x(i) = a + (i-1)*h; 
end

% calculating the values
for i = 1:n+1
    y(i) = vpa(subs(l, x(i)));
end

% length using trapezoidal 
for i = 1:n+1
    if ( i == 1 || i == n+1) 
        I = I + y(i)./2;
    else
        I = I + y(i); 
    end
end

lengtht = vpa(I * h);

% length of the whole ellipse is 4 * length
lengtht = 4 * lengtht
 
% length using simpson 1/3
I = 0
for i = 1:n+1
    if ( i == 1 || i == n+1) 
        I = I + y(i)./3;
    elseif (mod(i, 2) == 0)
        I = I + y(i).*(2/3);
    else
        I = I + y(i).*(4/3); 
    end
end

lengths = vpa(I * h);

% length of the whole ellipse is 4 * length
lengths = 4 * lengths
 
