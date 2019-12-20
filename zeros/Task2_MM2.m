%TASK2
%Finding roots of polynomial f
%using Muller's method

%polynomial coefficients
a = [-2, 6, 3, 7, 1];
x_ex = zeros(4,1);
sol = zeros(4,1);
rootsf = roots(a);
loop = 0;
f_test = @(x) a(1)*x^4 + a(2)*x^3 + a(3)*x^2 + a(4)*x + a(5);
j = 1;
n = 4;
x_arr = zeros(4,8);
y_arr = zeros(4,8);

while(loop<4)

ad = first_derivative(a);
add = second_derivative(a);
%function f(x)
f = @(x) a(1)*x^4 + a(2)*x^3 + a(3)*x^2 + a(4)*x + a(5);
%function f'(x)
fd = @(x) ad(1)*x^4 + ad(2)*x^3 + ad(3)*x^2 + ad(4)*x + ad(5);
%function f''(x)
fdd = @(x) add(1)*x^4 + add(2)*x^3 + add(3)*x^2 + add(4)*x + add(5);
x = 1;
i = 1;
it = 8;

while(i<it)

    %roots
    zp = (-2*f(x))/(fd(x)+sqrt((fd(x))^2 - 2*f(x)*fdd(x)));
    zm = (-2*f(x))/(fd(x)-sqrt((fd(x))^2 - 2*f(x)*fdd(x)));
   
    %pick smaller root
    if(abs(zp)<abs(zm))
        x = x + zp;
    else
        x = x + zm;
    end
    
    x_arr(loop+1, i) = x;
    y_arr(loop+1, i) = f_test(x);
    
    %element has been found
    if(abs(f_test(x))<1e-6)
        x_ex(j) = x;
        sol(j) = f_test(x);
        j = j + 1;
        i = it; %stop iteration
        
        %Horner division
        q = zeros(n+1, 1);
        for k = n : -1 : 1
            q(k) = a(n-k+1) + q(k+1)*x;
        end

        a(1:loop+1) = 0;
        for k = loop + 2 : n + 1 
            a(k) = q(n-k+2);
        end
 
    end
    i = i + 1;
end
loop = loop + 1;
end

plot(x_ex);
figure
plot(sol);
figure
fplot(f_test);
hold on
plot(x_ex(1), sol(1), 'r.');
plot(x_ex(2), sol(2), 'r.');
plot(x_ex(3), sol(3), 'r.');
plot(x_ex(4), sol(4), 'r.');
plot(1, 0, 'b*');

for i = 1 : 4
   disp("x" + i + " = ");
   for j = 1 : 8
       disp(x_arr(i,j));
   end 
   disp("y" + i + " = ");
   for j = 1 : 8
       disp(y_arr(i,j));
   end 
end

sol
i
x_ex
rootsf

