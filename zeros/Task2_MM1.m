%TASK2
%Finding roots of polynomial f
%using Muller's method

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

%function 
f = @(x) a(1)*x^4 + a(2)*x^3 + a(3)*x^2 + a(4)*x + a(5);

%choosing three points 
x0 = -1;
x1 = 0;
x2 = 1;

it = 8;
i = 1;

while(i<it)

    %new incremental value
    z0 = x0 - x2;
    z1 = x1 - x2;

    %values of coefficients of y
    B = (f(x1)-f(x2)-((f(x0)-f(x2))/z0^2)*z1^2)/(z1-(z1^2/z0));
    A = (f(x0)-f(x2)-B*z0)/(z0^2);
    C = f(x2);
    
    %roots 
    zr1= (-2*C)/(B - sqrt(B^2 - 4*A*C));
    zr2= (-2*C)/(B + sqrt(B^2 - 4*A*C));
    
    %choosing value for the next iteration 
    if(abs(zr1)<abs(zr2))
        x_new = x2 + zr1;
    else
        x_new = x2 + zr2;
    end
    
    x_arr(loop+1,i) = x_new;
    y_arr(loop+1,i) = f_test(x_new);
    
    %element has been found
    if(abs(f(x_new))<1e-12)
        x = x_new;
        x_ex(j) = x;
        sol(j) = f_test(x);
        j = j + 1;
        i
        i = it;
        
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
    
    %choosing two values from x1, x2, x3 closest to x_new
    if(max([abs(x0-x_new),abs(x1-x_new),abs(x2-x_new)])==abs(x0-x_new))
        x0 = x1;
        x1 = x2;
        x2 = x_new;
        disp("x0");
    elseif(max([abs(x0-x_new),abs(x1-x_new),abs(x2-x_new)])==abs(x1-x_new))
        x1 = x2;
        x2 = x_new;
        disp("x1");
    elseif(max([abs(x0-x_new),abs(x1-x_new),abs(x2-x_new)])==abs(x2-x_new))        
        x2 = x_new;
        disp("x2");
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
plot(-1, 0, 'b*');
plot(0, 0, 'b*');
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
