%Only for 2A, case 2B does not stop 
n=10;
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

L = tril(A);
D = diag(diag(A));
U = triu(A);

%convergence conditions
M = -U/(D+L);
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

r = zeros(28,1);

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
disp(it);
it = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28];
plot(it, r);

