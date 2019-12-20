%TASK 2A
%Program allows to solve system of n linear equations
%Executes untill time of solving of one system
%does not exceed given time (in seconds) 
%Errors should be calculated 

begin = tic;
n = 10;
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

%Gaussian elimination
for j = 1:(x-1)
   
max = 0;
index = 0;
    %find pivot    
    for i=1:x
       if(max<A(i,j))
           max = A(i,j);
           index = i;
       end
    end
        
%switching columns (if necessary)
     for n = 1:x
        temp = A(j,n);
        A(j,n) = A(index,n);
        A(index,n) = temp;
     end
     
%eliminating
value = A(j+1,j)/A(j,j);

for i = 1:x
    
    A(j+1,i) = A(j+1,i) - A(j,i)*value;

end
    b(j+1,1) = b(j+1,1) - b(j,1)*value;
end

%getting values
solution = zeros(x,1);
%backward substitution
for j=x:-1:1
    
    solution(j) = b(j) / A(j,j);
    b(1:j-1) = b(1:j-1) - A(1:j-1,j) * solution(j);

end

time = toc(begin);
%disp(A);
%disp(b);

%r = A*solution - b;
%disp("r = " + r);

for i = 1 : x 

    disp("X" + i + " = " + solution(i));
    
end

    disp("execution time = " + time);
