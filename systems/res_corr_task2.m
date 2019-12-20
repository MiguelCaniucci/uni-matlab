%Residual correction of error r = Ax - b

n=10;

%MATRIX 2A

% initialize matrix Aa with zeros
Aa = zeros(n,n); 
% initialize matrix ba with zeros 
ba = zeros(n,1); 

% fill matrix A
i = 1;
j = 1; 
while(i<=n)      
    while(j<=n)
        
        if(i == j)
           Aa(i,j) = 9;
        elseif(i==j-1||i == j+1)
           Aa(i,j) = 3;
        else
           Aa(i,j) = 0;
        end
        j = j + 1;
    
    end
    
    j = 1;
    i = i + 1;
    
end

i = 1;
%fill matrix b
while(i<=n)
   
    ba(i) = 1.5 + 0.5*i;
    i = i+1;
    
end

ra = zeros(100,1);
disp("Correction 2A");
for i = 1 : 30
    if(i==1)
        %calculationg first correction
        [x1,err1] = gauss_piv(Aa, ba);
        r1 = Aa*x1 - ba;
        [deltx,err2] = gauss_piv(Aa, r1);
        x2 = x1 - deltx;
        r2 = Aa*x2 - ba;
        ra(i) = norm(r2);
    
    else
        %calculationg next corrections
        [r,~] = gauss_piv(Aa, ba);%calculating Ax = b
        ba = Ab*r - bb;%substituting to obtain equation Ax = r
        ra(i,1) = norm(Aa*r - ba);%adding error 
   
    end
    disp("r"+i+"= "+ra(i));
end

% initialize matrix A with zeros
Ab = zeros(n,n); 
% initialize matrix b with zeros 
bb = zeros(n,1); 

% fill matrix A
i = 1;
j = 1; 
while(i<=n)      
    while(j<=n)
        
       Ab(i,j) = 2/(3*(j+i-1));
       j = j + 1;
       
    end
    
    j = 1;
    i = i + 1;

end

i = 1;
%fill matrix b
while(i<=n)
   
    if(mod(i,2)==0)
        bb(i) = 1/i;
    else
        bb(i) = 0;
    end  
    i = i + 1;
end

rb = zeros(100,1);
disp("Correction 2B");
for i = 1 : 30
    if(i==1)
        %calculating first correction 
        [x1,err1] = gauss_piv(Ab, bb);
        r1 = Ab*x1 - bb;
        [deltx,err2] = gauss_piv(Ab, r1);
        x2 = x1 - deltx;
        r2 = Aa*x2 - bb;
        rb(i) = norm(r2);
    else
        [r,~] = gauss_piv(Ab, bb); 
        bb = Ab*r - bb; %substituting to obtain Ax = r
        rb(i,1) = norm(Ab*r - bb); %adding error
    end
    disp("r"+i+"= "+rb(i,1));
end


