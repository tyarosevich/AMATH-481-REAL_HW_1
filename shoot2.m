function rhs = shoot2(t,y)
rhs = [y(2);
       (t^2 - 1) * y(1)];
   