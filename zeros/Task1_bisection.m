%TASK 1
%Bisection method 
%Finding roots of function y

y = @(x) (2.1 - 2*x - exp(-x));

%interval [a,b]
a = -5;
b = 10;

%division into two subintervals
a_temp = a;
b_temp = b;
divided = false;
c = 0;
while(divided==false)
    if(y(a_temp)*y(b_temp)>=0)
        c = (a_temp+b_temp)/2;
        b_temp = c;
    else
        divided = true;
    end
end
c
%new intervals [a1,b1] and [a2,b2]
a1 = a;
b1 = c;
a2 = c;
b2 = b;

%calculating roots
[r1, x_arr1, y_arr1] = bisection(y, a1, b1, 40, 1e-8);
[r2, x_arr2, y_arr2] = bisection(y, a2, b2, 40, 1e-8);

%function graph
figure
fplot(y,[a,b]);
hold on
plot(r1, y(r1), 'r.');
plot(r2, y(r2), 'r.');
plot(-5, 0, 'b*');
plot(10, 0, 'b*');
plot(c, 0, 'b*');

%results 
disp("x1 = ");
for j = 1 : 40
       disp(x_arr1(j,1));
end 
disp("y1 = ");
for j = 1 : 40
       disp(y_arr1(j,1));
end 

disp("x2 = ");
for j = 1 : 40
       disp(x_arr2(j,1));
end 
disp("y2 = ");
for j = 1 : 40
       disp(y_arr2(j,1));
end 
 
