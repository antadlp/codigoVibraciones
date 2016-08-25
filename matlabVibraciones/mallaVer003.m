filename = 'frame-500-000.dat';
XYZFile = importdata(filename);
format short e

MA = XYZFile;

%A = XYZFile(:,1);
X = XYZFile(:,1);
Y = XYZFile(:,2);
Z = XYZFile(:,3);

H11 = [MA(11, 1) MA(11, 2)];
H07 = [MA(7, 1) MA(7, 2)];

[xY01 lineY01 ] = makeAtomsLine(H11, H07);

plot(xY01, lineY01);

axis([H11(1)])


