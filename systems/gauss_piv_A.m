function [solution, error] = gauss_piv_A(n)
%Function solving system of linear equations
%for n x n matrix from task 2A
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
        
        if(i == j)
           A(i,j) = 9;
        elseif(i==j-1||i == j+1)
           A(i,j) = 3;
        else
           A(i,j) = 0;
        end
        j = j + 1;
    
    end
    
    j = 1;
    i = i + 1;
    
end

i = 1;
%fill matrix b
while(i<=x)
   
    b(i) = 1.5 + 0.5*i;
    i = i+1;
    
end
disp("cond(Aa) = " + cond(A));
[solution, error] = gauss_piv(A,b);
