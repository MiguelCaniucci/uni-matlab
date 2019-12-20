%TASK 2B
%Solving systems of linear equations Ax=b
%Using Gaussian method with partial pivoting
n = 5;
i = 1;
error = zeros(8,1);%Error matrix
while (i<9)
    n = n*2;
    [solution , err]= gauss_piv_B(n);%perform elimination
    error(i,1) = err;%add error to error matrix
    i = i+1;
end

for i = 1 : 8
    disp(error(i,1));
end

n = [10,20,40,80,160,320,640,1280];

plot(n,error);
