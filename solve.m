% system of equations to evaluate, ensure diagonally dominant
A = [-1 0 0 sqrt(2)/2 1 0 0 0; ...
      0 -1 0 sqrt(2)/2 0 0 0 0; ...
      0 0 -1 0 0 0 1/2 0;  ...
      0 0 0 -sqrt(2)/2 0 -1 -1/2 0; ...
      0 0 0 0 -1 0 0 1; ...
      0 0 0 0 0 1 0 0; ...
      0 0 0 -sqrt(2)/2 0 0 sqrt(3)/2 0; ...
      0 0 0 0 0 0 -sqrt(3)/2 -1] ;
  
b = [0;
     0;
     0;
     0;
     0;
     10000;
     0;
     0];
  
U = triu(A, 1) .* -1;
L = tril(A, -1) .* -1;
D = diag(diag(A));
TOL = 1e-3;

% Jacobi
G = D\(L + U);
c = D\b;
error = inf;
x_i = b;
x = x_i;
iter = 1;
while error > TOL
    x_i = x;
    x = G * x_i + c;
    error(iter) = abs(norm(x, inf) - norm(x_i, inf));
    iter = iter + 1;
end

% Gaauss - Siedel
G = (D - L)\U;
c = (D - L)\b;
error = inf;
x_i = ones(8, 1);
x = x_i;
iter = 1;
while error > TOL
    x_i = x;
    x = G * x_i + c;
    error(iter) = abs(norm(x, inf) - norm(x_i, inf));
    iter = iter + 1;
end

% SOR
w = 1.25;
G = (D - w*L)\((1 - w)*D + w*U);
c = w * ((D - w*L)\b);
error = inf;
x_i = ones(8, 1);
x = x_i;
iter = 1
while error > TOL
    x_i = x;
    x = G * x_i + c;
    error(iter) = abs(norm(x, inf) - norm(x_i, inf));
    iter = iter + 1;
end



    
    

      
