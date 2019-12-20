function coefficients = second_derivative(a)

coe = zeros(5,1);

coe(1) = 0;
coe(2) = 0;
coe(3) = a(1)*4*3;
coe(4) = a(2)*3*2;
coe(5) = a(3)*2;

coefficients = coe;
end
