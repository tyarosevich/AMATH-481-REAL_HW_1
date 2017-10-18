clc; clear all;close all;
delta = .1;
E_start = 1;
xspan = -4:delta:4;
Edelta = .1;
tol = 10^(-6);
solution_values = zeros(2,5);
solution_eigs = zeros(1,5);
for modes = 1:5
    E = E_start;
    Edelta = .1;
    for n = 1:1000

        y1 = .5; y2 = left_boundary(y1, E);
        y = [y1;y2];
        y_list = heun_step(y, xspan, E, delta);
        error = y_list(2,end) + sqrt(16 - E)*y_list(1,end);
        if abs(error) < tol
            solution_values(:,modes) = y_list(:,end);
            solution_eigs(1,modes) = E;
            break
        end
        if (-1)^(modes + 1) * error > 0
            E = E + Edelta;
        else
            E = E - Edelta/2;
            Edelta = Edelta/2;
        end
    end
    E_start = E + Edelta;
end