function [x y] = makeAtomsLine(P1, P2)

xmin = min([P1(1) P2(2)]);
xmax = max([P1(1) P2(2)]);

x = xmin:.01:xmax;

m = (P2(2) - P1(2))/(P2(1) - P1(1));

y = m*(x - P1(1)) + P1(2); 


