%TASK 3
%Solving system of equations 
%using Gauss - Seidel iterative method
%Errors should be calculated 

A = [6 2 1 -1;
     4 -10 2 -1;
     2 -1 8 -1;
     5 -2 1 -8];
 
b = [6; -8; 0; 2];

L = tril(A);
D = diag(diag(A));
U = triu(A);

%convergence conditions
M = -U*inv(D+L);
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

solution = zeros(size(A,1),1);
n = size(A,1);
conv = inf;
border=1e-10; 
it=0;

r = zeros(16,1);

while (conv>border&&it<=10000)
    
    prev=solution;
    for i=1:n
       
        sum=0;
        
           for j = 1 : i-1
               sum = sum - L(i,j)*solution(j,1);             
           end

           for j = 1+i : n
               sum = sum - U(i,j)*prev(j,1);            
           end
           
           solution(i,1) = (sum + b(i,1))/D(i,i);
    end
 
    it=it+1;
    conv=norm(A*solution-b);
    r(it) = norm(A*solution - b);
end
if(it>=10000)
    error('too many iterations');
end
it = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16];
plot(it, r);

