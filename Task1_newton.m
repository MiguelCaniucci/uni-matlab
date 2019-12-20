%TASK 1
%Newton's method 
%Finding roots of function y

y = @(x) (2.1 - 2*x - exp(-x));

%interval[a,b]
a = -5;
b = 10;

%derivative of function y
dy = @(x) (-2 + exp(-x));

%calculating roots
[r1, x_arr1, y_arr1] = newton(y, dy, a, 20, 1e-8);
[r2, x_arr2, y_arr2] = newton(y, dy, b, 20, 1e-8);

%function graph
figure
fplot(y, [-5,10]);
hold on
plot(r1, y(r1), 'r.');
plot(r2, y(r2), 'r.');
plot(-5, 0, 'b*');
plot(10, 0, 'b*');

%results
disp("x1 = ");
for j = 1 : 20
       disp(x_arr1(j,1));
end 
disp("y1 = ");
for j = 1 : 20
       disp(y_arr1(j,1));
end 

disp("x2 = ");
for j = 1 : 20
       disp(x_arr2(j,1));
end 
disp("y2 = ");
for j = 1 : 20
       disp(y_arr2(j,1));
end 

disp("x1 = " + fzero(y,-11));
disp("x2 = " + fzero(y, 5));

