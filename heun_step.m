function y = heuns(y0, xspan, E, delta)
y = zeros(2,81);
y(:,1) = y0;

for n = 1:(length(xspan)-1)
    y_prime = shoot(y(:,n),xspan(n),E);
    y_step = y(:,n) + delta * y_prime;
    y(:,n+1) = y(:,n) + delta/2 * (shoot(y_step,xspan(n) + delta,E) + y_prime);

end
