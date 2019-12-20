function [solution, x_arr, y_arr] = newton(y, dy, a, it, accuracy)
%Calculating root of y function on interval [a,b]
%using Newton's method 
%dy - derivative of function y 
%it - max number of iterations
%accuracy - expected accuracy of the result 

value = 1;
x1 = a;
i = 1;
x_arr = zeros(it, 1);
y_arr = zeros(it, 1);

%Newton iterative method
while(abs(value)>accuracy && i <= it)
    xn = x1 - y(x1)/dy(x1);
    x1 = xn;
    value = y(xn);
    x_arr(i) = xn;
    y_arr(i) = value;
    i = i + 1;
end
%assigning solution
solution = xn;
end