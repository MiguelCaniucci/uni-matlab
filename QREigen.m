%TASK 4
%Finding eigenvalues of 5x5 matrices
%Using QR method of factorization 
%with and without shifts


A = [6 4 2 3 1;
     4 1 2 1 3;
     2 2 6 1 2;
     3 1 1 2 4;
     1 3 2 4 6];

%Checking if matrix A is symmetric 
s = issymmetric(A);

if(s==1)
    disp("symetric matrix");
else
    error("matrix not symetric");
end

A_copy = A;

%calculating eigenvalues using methods with and without shifts
eigenvalues_noshifts = QR_eigen_no_shifts(A_copy, 1e-6, 1000);
eigenvalues_shifts = QR_eigen_shifts(A_copy, 1e-6, 1000);

disp("Eigenvalues_no_shifts = ");
disp(eigenvalues_noshifts);
disp("Eigenvalues_shifts = ");
disp(eigenvalues_shifts);
disp("MATLAB eig = ");
disp(eig(A));

