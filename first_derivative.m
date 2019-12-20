function coefficients = first_derivative(a)

coe = zeros(5,1);

coe(1) = 0;
coe(2) = a(1)*4;
coe(3) = a(2)*3;
coe(4) = a(3)*2;
coe(5) = a(4)*1;

coefficients = coe;
end