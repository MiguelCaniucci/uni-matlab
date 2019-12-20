function [solution, error] = gauss_piv_B(n)
%Function solving system of linear equations
%for n x n matrix from task 2B
x = n;
y = x;

% initialize matrix A with zeros
A = zeros(x,y); 
% initialize matrix b with zeros 
b = zeros(x,1); 

% fill matrix A
i = 1;
j = 1; 
while(i<=x)      
    while(j<=y)
        
       A(i,j) = 2/(3*(i+j-1));
       j = j + 1;
       
    end
    
    j = 1;
    i = i + 1;

end

i = 1;
%fill matrix b
while(i<=x)
   
    if(mod(i,2)==0)
        b(i) = 1/i;
    else
        b(i) = 0;
    end  
    i = i + 1;
end

disp("cond(A) = " + cond(A));
[solution, error] = gauss_piv(A,b);

