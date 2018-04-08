% initiallize x, y as syms
syms x y;

% system of equations to solve
f1(x, y) = x + y - 20;
f2(x, y) = (x + x^0.5)*(y + y^0.5) - 155.55;

% derivative of f1, f2 w.r.t x and y
f1x(x, y) = diff(f1, x);
f1y(x, y) = diff(f1, y);

f2x(x, y) = diff(f2, x);
f2y(x, y) = diff(f2, y);

% Solving Ax = b
x_i = 4;
y_i = 10;
count = 0;
TOL = 1e-4;
x_j = x_i;
y_j = y_i;
while true
    A = [subs(f1x, [x, y], [x_j, y_j]) subs(f1y, [x, y], [x_j, y_j]); subs(f2x, [x, y], [x_j, y_j]) subs(f2y, [x, y], [x_j, y_j])];
    A = eval(A)
    b = [-subs(f1, [x, y], [x_j, y_j]); -subs(f2, [x, y], [x_j, y_j])];
    b = eval(b)
    h = A\b
    x_i = x_j;
    y_i = y_j;
    x_j = x_i + h(1);
    y_j = y_i + h(2);
    count = count + 1;
    errorx(count) = abs(x_j - x_i);
    errory(count) = abs(y_j - y_i);
    if abs(x_j - x_i) < TOL && abs(y_j - y_i) < TOL, break ; end
end

% plotting charts
figure
subplot(1, 2, 1)
plot(errorx, 'color','b');
xlabel('Iterations');
ylabel('Error');
title('X error')

subplot(1, 2, 2);
plot(errory, 'color', 'r');
xlabel('Iterations');
ylabel('Error');
title('Y error');

 
