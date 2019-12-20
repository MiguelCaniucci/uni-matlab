function [Q,R] = qrfac(A)

%function for QR factorization
%using modified Graham-Shmidt algorithm
%performed on matrix A

[m n]=size(A);
Q = zeros(m,n);
R = zeros(n,n);
d = zeros(1,n);
%factorization with orthogonal columns of Q 
for i = 1 : size(A,1)
    Q(:,i)=A(:,i);
    R(i,i)=1;
    d(i)=Q(:,i)'*Q(:,i);
    for j = i + 1 : size(A,1)
        R(i,j)=(Q(:,i)'*A(:,j))/d(i);        
        A(:,j)=A(:,j)-R(i,j)*Q(:,i);
    end
end
%columns of Q orthonormal
for i = 1 : size(A,1)
    dd=norm(Q(:,i));
    Q(:,i)=Q(:,i)/dd;
    R(i,i:size(A,1))=R(i,i:size(A,1))*dd;
end
