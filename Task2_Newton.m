%TASK 2 NEWTON'S METHOD

a = [-2, 6, 3, 7, 1];

ad = first_derivative(a);
%function f(x)
f = @(x) a(1)*x^4 + a(2)*x^3 + a(3)*x^2 + a(4)*x + a(5);
%function f'(x)
fd = @(x) ad(1)*x^4 + ad(2)*x^3 + ad(3)*x^2 + ad(4)*x + ad(5);

x1 = 1;
x2 = 4;

[r1, x_arr1, y_arr1] = newton(f, fd, x1, 10, 1e-6);
[r2, x_arr2, y_arr2] = newton(f, fd, x2, 10, 1e-6);

disp("x1 = ");
for j = 1 : 10
       disp(x_arr1(j,1));
end 
disp("y1 = ");
for j = 1 : 10
       disp(y_arr1(j,1));
end 

disp("x2 = ");
for j = 1 : 10
       disp(x_arr2(j,1));
end
disp("y2 = ");
for j = 1 : 10
       disp(y_arr2(j,1));
end

r1
r2
