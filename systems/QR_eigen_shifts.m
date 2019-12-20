function eigenvalues = QR_eigen_shifts(A, tol, imax)

%Function finding eigenvalues of matrix A
%performed with shifts
%tol - tolerance of error
%imax - max number of iterations 

n = size(A,1);
eigenvalues = diag(ones(n));
A_orig = A; %initial matrix
it = 0;
for k = n:-1:2
    dk = A_orig; %initial matrix to calculate single eigenvalue
    i = 0;
    while ((i < imax) && (max(abs(dk(k,1:k-1))) > tol))
        dd=dk(k-1:k,k-1:k); %2x2 bottom right corner submatrix
        poly = [1 -(dd(1,1)+dd(2,2)) (dd(2,2)*dd(1,1)-dd(2,1)*dd(1,2))];
        ev = roots(poly); %finding roots of quadratic equation
        if(abs(ev(1)-dd(2,2)) < abs(ev(2)-dd(2,2)))
            shift = ev(1); %dd eigenvalue closest to dk(k,k)
        else
            shift = ev(2);
        end
        dp = dk - eye(k)*shift; %shifted matrix
        [Q1,R1]=qrfac(dp); %QR factorization
        dk = R1*Q1 + eye(k)*shift; %transformed matrix 
        i = i+1;
        it = it + 1;
    end
    if(i>imax)
        error('excceded');
    end
    eigenvalues(k) = dk(k,k);
    if k > 2
        A_orig = dk(1:k-1,1:k-1); %deleting last row and column
    else
        eigenvalues(1) = dk(1,1); %last eigenvalue 
    end
end

disp("Matrix A after QR with shifts = ");
disp(A_orig);
disp("Number of iterations = " + it);
end


