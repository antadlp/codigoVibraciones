function lista = crossLine2dAtom(Atoms, xline, yline, radii, ep)

dx = abs(radii/ep);
xmin = min(xline);
xmax = max(xline);

x = xmin:dx:xmax;
m = (yline(length(yline)) - yline(1))/(xline(length(xline)) - xline(1));

y = m*(x - xline(1)) + 

y = m*(x - P1(1)) + P1(2); 



