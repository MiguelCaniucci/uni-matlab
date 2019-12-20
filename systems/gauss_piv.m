function [solution, error] = gauss_piv(A, b)
%General function for solving systems of lienar equatios 
%using Gaussian elimination with partial pivoting
x = size(A,1);

for j = 1:(x-1)

pivot = A(1,j);
index = 1;

    %finding pivot     
    for i=j:x
       if(pivot<abs(A(i,j)))
           pivot = A(i,j);
           index = i;
       end
    end
        
    %switching rows
    for n = j:x
        temp = A(j,n);
        A(j,n) = A(index,n);
        A(index,n) = temp;
        tempb = b(j,1);
        b(j,1) = b(index,1);
        b(index,1) = tempb;
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
%disp(norm(A*solution-b));
error = norm(A*solution-b);
