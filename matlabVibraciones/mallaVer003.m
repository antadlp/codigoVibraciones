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
H22 = [MA(22, 1) MA(22, 2)];
H04 = [MA(4, 1) MA(4, 2)];
H15 = [MA(15, 1) MA(15, 2)];
H14 = [MA(14, 1) MA(14, 2)];



[xY01 lineY01 ] = makeAtomsLine(H11, H07);
[xY02 lineY02 ] = makeAtomsLine(H15, H14);


extraLimit = abs(H11(1) - H22(1));
extraLimit2 = extraLimit/2;

limitXIzq = H11(1) - extraLimit;
limitXDer = H22(1) + extraLimit;

limitYArr = H04(2) + extraLimit2;
limitYAbj= H15(2) - extraLimit2;




figure(1)
plot(xY01, lineY01)
hold on
plot(xY02, lineY02)
%plot([H11(1)], [H11(2)], 'o')
plot(X', Y', 'o')
axis([limitXIzq limitXDer limitYAbj limitYArr]);
grid on

figure(2)
surface(X', Y', Z', 'EdgeColor', 'none'), view(3)
axis([-inf inf -inf inf -5 5])




