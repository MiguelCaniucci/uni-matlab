function eigenvalues =  QR_eigen_no_shifts(A, tol, imax)

%Function finding eigenvalues of matrix A
%performed without shifts
%tol - tolerance of error
%imax - max number of iterations 

i = 1;
while (i <= imax) && (max(max(A-diag(diag(A)))) > tol)
    [Q1,R1]=qrfac(A);
    A=R1*Q1; %transformed matrix 
    i=i+1;
end
if(i>imax)
    error('excceded');
end
disp("Matrix A after QR without shifts =");
disp(A);
disp("Number of iterations = " + i);
eigenvalues = diag(A);
