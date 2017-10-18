function y2 = left_boundary(y1, E)

y2 = (sqrt(16 - E)) * y1 * e^(sqrt(1 - E)*y1);
% Note the thing you were hung up on here is that y1 is technically phi of
% x, phi(x) which in the case of the BC is phi of -L, phi(-L) or in this
% case phi(-4) = y1. y2, or phi', then is defined by this above
% relationship.