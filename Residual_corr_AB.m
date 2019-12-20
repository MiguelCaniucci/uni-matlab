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
A
b
A_orig = A;
x = size(A,1);
%Gaussian elimination
for j = 1:(x-1)

pivot = A(1,j);
index = 1;

    %finding pivot     
    for i=j:x
       if(pivot<A(i,j))
           pivot = A(i,j);
           index = i;
       end
    end
        
    %switching rows
    for n = j:x
        temp = A(j,n);
        A(j,n) = A(index,n);
        A(index,n) = temp;
    end
  
%eliminating

for n = j:x-1
    
    value = A(n+1,j)/A(j,j);
    for i = 1:x

        A(n+1,i) = A(n+1,i) - A(j,i)*value;

    end
    
    b(n+1,1) = b(n+1,1) - b(j,1)*value;

end
end

%getting values
solution = zeros(x,1);
%backward substitution
for j=x:-1:1
    sum = 0;
    if(A(j,j) ~= 0)
        for k = x : -1 : j
           sum = sum + A(j,k)*solution(k,1); 
        end
        solution(j) = (b(j)-sum) / A(j,j);        
    end
end

disp(norm(A*solution-b));

r = A*solution - b;

solution = solution - r;

disp(norm(A*solution-b));


