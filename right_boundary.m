function y2 = right_boundary(y1, E)

y2 = -(sqrt(16 - E)) * y1 * e^(-sqrt(1 - E)*y1);