function [root, x_arr, y_arr] = bisection(y,a,b,it,accuracy)
%Calculating root of function y on interval [a,b]
%using bisection method
%it - max number of iterations
%accuracy - expected accuracy of the result 

i = 1;
value = 1;
x_arr = zeros(it,1);
y_arr = zeros(it,1);

%bisection iterative method
while((abs(value)>accuracy) && (abs(a-b)>accuracy) && i <= it)
    
    c = (a+b)/2;
    value = y(c);
    x_arr(i) = c;
    y_arr(i) = value;
    prod1 = y(a)*y(c);
    prod2 = y(b)*y(c);
    
    if(prod1<0)
       b = c;
    elseif(prod2<0)
       a = c;
    end
    
    i = i + 1;
end
%assigning solution
root = c;
end
