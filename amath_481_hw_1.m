clc; clear all;close all;
L = 4;
delta = .1;
E_start = 1;
xspan = -L:delta:L;
Edelta = .1;
tol = 10^(-6);
solution_values = zeros(2,5);
solution_eigs = zeros(1,5);
for modes = 1:5
    E = E_start;
    Edelta = .1;
    for n = 1:1000

        y1 = .5; y2 = left_boundary(y1, E, L);
        y = [y1;y2];
        y_list = heun_step(y, xspan, E, delta);
        error = y_list(2,end) + sqrt(L^2 - E)*y_list(1,end);
        if abs(error) < tol
            norm = trapz(xspan, y_list(1,:).*y_list(1,:));
            solution_values(:,modes) = y_list(:,end)/norm;
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
A1 = abs(solution_values(1,:))';
A2 = solution_eigs;
save A1.dat A1 -ascii
save A2.dat A2 -ascii
%% HW 1 Part 2 a.)
clc; clear all; close all;
L = 4;
delta_list = [.2 .1 .05 .02 .01 .005 .001];
solution_eigs = zeros(7,5);

for index = 1:length(delta_list)
    delta = delta_list(index);
    E_start = 1;
    xspan = -L:delta:L;
    Edelta = .1;
    tol = 10^(-6);
    for modes = 1:5
        E = E_start;
        Edelta = .1;
        for n = 1:1000

            y1 = .5; y2 = left_boundary(y1, E, L);
            y = [y1;y2];
            y_list = heun_step(y, xspan, E, delta);
            error = y_list(2,end) + sqrt(L^2 - E)*y_list(1,end);
            if abs(error) < tol
                solution_eigs(index,modes) = E;
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
end
A3 = solution_eigs(:,3);
save A3.dat A3 -ascii
%% HW1 Part 2 b.)
clc; clear all; close all;
L_list = [2.5 3 3.5 4 5];
delta = .02;
solution_eigs = zeros(5,3);

for index = 1:length(L_list)
    E_start = 1;
    L = L_list(index);
    xspan = -L:delta:L;
    Edelta = .1;
    tol = 10^(-5);
    for modes = 1:3
        E = E_start;
        Edelta = .1;
        for n = 1:1000

            y1 = .5; y2 = left_boundary(y1, E, L);
            y = [y1;y2];
            y_list = heun_step(y, xspan, E, delta);
            error = y_list(2,end) + sqrt(L^2 - E)*y_list(1,end);
            if abs(error) < tol
                solution_eigs(index,modes) = E;
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
end
A4 = solution_eigs(:,3);
save A4.dat A4 -ascii
%% HW 1 Part 3


