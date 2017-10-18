%% HW 1 Part 1

clc; clear all;close all;
delta = .1;
E_start = 1;
xspan = -4:delta:4;
Edelta = E_start/100;
E = E_start;
tol = 10^(-4);
for n = 1:1000
    
    y1 = 1; y2 = left_boundary(y1, E);
    y = [y1;y2];
    y_list = heun_step(y, xspan, E, delta);
    test = y_list(2,end) + right_boundary(y_list(1,end), E);
    if abs(test) < tol
        break
    end
    if y_list(1, end) > 0
        E = E - Edelta;
    else
        E = E + Edelta/2;
    end
end

    
    
plot(xspan, y_list(1,:))