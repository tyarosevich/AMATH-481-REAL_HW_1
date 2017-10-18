function rhs = shoot(y,x,E)
rhs = [y(2);
       (x^2 - E) * y(1)];
   