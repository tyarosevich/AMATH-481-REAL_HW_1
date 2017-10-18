function y = heuns(y0, xspan, E, delta)
for n = length(xspan)
    
    y_prime = shoot(y0,xspan(n),E)
    y_step = y0 + delta * y_prime;
    y = y0 + delta/2 * (shoot(y_prime,xspan(n+1),E) + y0);
    y = y0

end
% work in progress. THis has to run the entire stepping scheme to L.
