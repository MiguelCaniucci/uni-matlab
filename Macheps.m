%TASK 1
%Program for finding machine epsilon
%In MATLAB environment

it = 0; %iterator
macheps = 1.0; %starting epsilon value
while(macheps/2 + 1.0 ~= 1.0)
    macheps = macheps/2;
    it = it + 1;
end
disp("Number of iterations : " + it);
disp("Machine epsilon = " +macheps);
disp("MATLAB eps = " + eps);