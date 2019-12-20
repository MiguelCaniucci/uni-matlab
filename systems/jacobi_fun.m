function solution = jacobi_fun(A, b)

L = tril(A);
D = diag(diag(A));
U = triu(A);

%Convergence conditions
M = -(L+U)\D;

if(max(abs(eig(M)))<1)
    disp("necessary convergence condition fulfilled");
else
    disp("necessary convergence condition not fulfilled");
end

sum = 0;
conv_suf1 = true;
for i = 1 : size(A,1)
    for j = 1 : size(A,1)
        if(i~=j)
            sum = sum + abs(A(i,j));
        end
    end
    if(abs(A(i,i))>sum)
            conv_suf1 = false;
    end
end

sum = 0;
conv_suf2 = true;
for j = 1 : size(A,1)
    for i = 1 : size(A,1)
        if(i~=j)
            sum = sum + abs(A(i,j));
        end
    end
    if(abs(A(j,j))>sum)
            conv_suf2 = false;
    end
end
if(conv_suf1==conv_suf2)
    disp("Sufficient condition not fulfilled");
elseif(conv_suf1)
    disp("Sufficient condition fulfilled, row strong dominance");
elseif(conv_suf2)
    disp("Sufficient condition fulfilled, column strong dominance");
end

%Initialization of solution matrix
solution = zeros(size(A,1),1);
%Jacobi method
it = 0;
conv = inf;
border = 1e-10; 

while(conv>border&&it<=10000)
    prev = solution;
    
    for i = 1 : size(A,1)
        sum = 0;

        for k = 1 : size(A,1)
            if(i~=k)
                sum = sum + (L(i,k) + U(i,k))*prev(k,1);
            end
        end
            solution(i,1) = -(1/D(i,i))*(sum - b(i,1));    
    end
    
    it = it+1;
    conv=norm(A*solution-b);    
end
if(it>=10000)
    error('too many iterations');
end
