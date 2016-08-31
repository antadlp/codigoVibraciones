close all
clear all
filename = 'zzout2.dat';
%filename = 'frame-500-000.dat';
XYZFile = importdata(filename);
format short e

MA = XYZFile;

%A = XYZFile(:,1);
X = XYZFile(:,1);
Y = XYZFile(:,2);
Z = XYZFile(:,3);


fs = 10;

X = floor(X*fs)/fs;
Y = floor(Y*fs)/fs;

xmax = max(X);
xmin= min(X);
x = xmin:1/fs:xmax;

ymax = max(Y);
ymin= min(Y);
y = ymin:1/fs:ymax;

fileIDX = fopen('verX2.dat', 'w');
fileIDY = fopen('verY2.dat', 'w');

Zl = zeros(length(x), length(y));
for i=1:length(x)
   for j=1:length(y)

      Zl(i,j) = NaN;

   end
end

for i=1:length(X)
   
   fprintf(fileIDX, '\nVERIFICANDO %f\n', X(i));

   xCheck = abs(x - X(i));
   [xx I(i)] = min(xCheck);
     
   fprintf(fileIDX, '%f\t%f\n\n', X(i), x(I(i)));
   
   yCheck = abs(y - Y(i));
   [yy J(i)] = min(yCheck);

   fprintf(fileIDY, '\nVERIFICANDO %f\n', Y(i));
   fprintf(fileIDY, '%f\t%f\n\n', Y(i), y(J(i)));

   Zl(I(i), J(i)) = Z(i);
   z2(i,3) = Zl(I(i), J(i));
   z2(i,1) = x(I(i));
   z2(i,2) = y(J(i));

end
fclose(fileIDX);
fclose(fileIDY);



r = 0.3;
ZrC = zeros(length(x), length(y));
for i=1:length(x)
   for j=1:length(y)

      ZrC(i,j) = NaN;

   end
end



for l=1:length(X)
   for i=1:length(x)
      for j=1:length(y)

         ecC = (x(i) - x(I(l)))^2 + (y(j) - y(J(l)))^2;

         if (ecC <= r^2)
        
            Zr(i,j,l) = sqrt(r^2 - ecC);
            ZrC(i,j)= sqrt(r^2 - ecC) + Zl(I(l),J(l)); 

         else

            Zr(i,j,l) = NaN;

         end

      end
   end
end













H11 = [MA(11, 1) MA(11, 2) MA(11, 3)];
H07 = [MA(7, 1) MA(7, 2) MA(7, 3)];
H22 = [MA(22, 1) MA(22, 2) MA(22, 3)];
H04 = [MA(4, 1) MA(4, 2) MA(4, 3)];
H15 = [MA(15, 1) MA(15, 2) MA(15, 3)];
H14 = [MA(14, 1) MA(14, 2) MA(14, 3)];
H01 = [MA(1, 1) MA(1, 2) MA(1, 3)];
H05 = [MA(5, 1) MA(5, 2) MA(5, 3)];
H69 = [MA(69, 1) MA(69, 2) MA(69, 3)];
H47 = [MA(47, 1) MA(47, 2) MA(47, 3)];
H91 = [MA(91, 1) MA(91, 2) MA(91, 3)];
H48 = [MA(48, 1) MA(48, 2) MA(48, 3)];
C88 = [MA(88, 1) MA(88, 2) MA(88, 3)];
C42 = [MA(42, 1) MA(42, 2) MA(42, 3)];
C111 = [MA(111, 1) MA(111, 2) MA(111, 3)];
C43 = [MA(43, 1) MA(43, 2) MA(43, 3)];
C108 = [MA(108, 1) MA(108, 2) MA(108, 3)];
C44 = [MA(44, 1) MA(44, 2) MA(44, 3)];
C124 = [MA(124, 1) MA(124, 2) MA(124, 3)];
C45 = [MA(45, 1) MA(45, 2) MA(45, 3)];
C122 = [MA(122, 1) MA(122, 2) MA(122, 3)];
C46 = [MA(46, 1) MA(46, 2) MA(46, 3)];
C120 = [MA(120, 1) MA(120, 2) MA(120, 3)];
C40 = [MA(40, 1) MA(40, 2) MA(40, 3)];
C117 = [MA(117, 1) MA(117, 2) MA(117, 3)];
C41 = [MA(41, 1) MA(41, 2) MA(41, 3)];
C114 = [MA(114, 1) MA(114, 2) MA(114, 3)];
C34 = [MA(34, 1) MA(34, 2) MA(34, 3)];
C134 = [MA(134, 1) MA(134, 2) MA(134, 3)];
C35 = [MA(35, 1) MA(35, 2) MA(35, 3)];
C31 = [MA(31, 1) MA(31, 2) MA(31, 3)];
C132 = [MA(132, 1) MA(132, 2) MA(132, 3)];


[xY01 lineY01 ] = makeAtomsLine(H11, H07);
[xY02 lineY02 ] = makeAtomsLine(H15, H14);


extraLimitA = abs(H11(1) - H22(1));
extraLimitB = abs(H04(1) - H15(1));

extraLimit = max([extraLimitA extraLimitB]);
extraLimit2 = extraLimit/2;

limitXIzq = xmin - extraLimit2;
limitXDer = xmax + extraLimit2;

limitYArr = ymax + extraLimit2;
limitYAbj = ymin - extraLimit2;

%P = H01;
%Q = H22;
%R = H11;
%PQ = P - Q;
%PR = P - R;
%normal = cross(PQ, PR);

P = H15;
Q = H14;
R = H04;
PQ = P - Q;
PR = P - R;
normal = cross(PQ, PR);

xp = limitXIzq:01:limitXDer;
yp = limitYAbj:01:limitYArr;

[Xp Yp] = meshgrid(xp, yp);
[Xl Yl] = meshgrid(x, y);
[Zp N] = makePlano001(Xp, Yp, H15, normal');
%Zd = distanciaPuntoPlano(P, N)

figure('Name', 'mesh')
%surface(Xp, Yp, Zp, 'EdgeColor', 'none'), view(3)
mesh(Xp, Yp, Zp)
axis([-inf inf -inf inf -5 5])
hold on
surface(Xl', Yl', ZrC, 'EdgeColor', 'none'), view(3)




r = .3;
ep = 20;
offset = 0;
[xX01 lineaX01] = makeAtomsLine(H11, H07);
listaHor01= crossLine2dAtom(MA, xX01, lineaX01, r, ep, 1);
arrHor01 = arrangeAtomsLine(xX01, lineaX01, MA, listaHor01, 0.001);
for i=1:length(arrHor01)

   nMA(i, :) = [listaHor01(i) arrHor01(i, 1) arrHor01(i, 2)];

end
offset = length(nMA);
figure('Name', 'arrAtoms')
A1 = [arrHor01(1, 1) arrHor01(1, 2)];
A2 = [arrHor01(length(arrHor01), 1) arrHor01(length(arrHor01), 2)];
[xX01t lineaX01t] = makeAtomsLine(A1, A2);
plot(xX01t, lineaX01t)
hold on
axis([limitXIzq limitXDer limitYAbj limitYArr]);
grid on


[xX02 lineaX02] = makeAtomsLine(H69, H47);
listaHor02 = crossLine2dAtom(MA, xX02, lineaX02, r, ep, 1);
arrHor02 = arrangeAtomsLine(xX02, lineaX02, MA, listaHor02, 0.001);
for i=1:length(arrHor02) 

   nMA(i + offset, :) = [listaHor02(i) arrHor02(i, 1) arrHor02(i, 2)];

end
offset = length(nMA);
A1 = [arrHor02(1, 1) arrHor02(1, 2)];
A2 = [arrHor02(length(arrHor02), 1) arrHor02(length(arrHor02), 2)];
[xX02t lineaX02t] = makeAtomsLine(A1, A2);
plot(xX02t, lineaX02t)
%plot(nMA(:,2), nMA(:,3), 'ro')



[xX03 lineaX03] = makeAtomsLine(H91, H48);
listaHor03 = crossLine2dAtom(MA, xX03, lineaX03, r, ep, 1);
arrHor03 = arrangeAtomsLine(xX03, lineaX03, MA, listaHor03, 0.001);
for i=1:length(arrHor03) 

   nMA(i + offset, :) = [listaHor03(i) arrHor03(i, 1) arrHor03(i, 2)];

end
offset = length(nMA);
%plot(nMA(:,2), nMA(:,3), 'ro')
A1 = [arrHor03(1, 1) arrHor03(1, 2)];
A2 = [arrHor03(length(arrHor03), 1) arrHor03(length(arrHor03), 2)];
[xX03t lineaX03t] = makeAtomsLine(A1, A2);
plot(xX03t, lineaX03t)


[xX04 lineaX04] = makeAtomsLine(C88, C42);
listaHor04 = crossLine2dAtom(MA, xX04, lineaX04, r, ep, 1);
arrHor04 = arrangeAtomsLine(xX04, lineaX04, MA, listaHor04, 0.001);
for i=1:length(arrHor04) 

   nMA(i + offset, :) = [listaHor04(i) arrHor04(i, 1) arrHor04(i, 2)];

end
offset = length(nMA);
plot(nMA(:,2), nMA(:,3), 'ro')
A1 = [arrHor04(1, 1) arrHor04(1, 2)];
A2 = [arrHor04(length(arrHor04), 1) arrHor04(length(arrHor04), 2)];
[xX04t lineaX04t] = makeAtomsLine(A1, A2);
plot(xX04t, lineaX04t)

[xX05 lineaX05] = makeAtomsLine(C111, C43);
listaHor05 = crossLine2dAtom(MA, xX05, lineaX05, r, ep, 1);
arrHor05 = arrangeAtomsLine(xX05, lineaX05, MA, listaHor05, 0.001);
for i=1:length(arrHor05) 

   nMA(i + offset, :) = [listaHor05(i) arrHor05(i, 1) arrHor05(i, 2)];

end
offset = length(nMA);
%plot(nMA(:,2), nMA(:,3), 'ro')
A1 = [arrHor05(1, 1) arrHor05(1, 2)];
A2 = [arrHor05(length(arrHor05), 1) arrHor05(length(arrHor05), 2)];
[xX05t lineaX05t] = makeAtomsLine(A1, A2);
plot(xX05t, lineaX05t)


[xX06 lineaX06] = makeAtomsLine(C108, C44);
listaHor06 = crossLine2dAtom(MA, xX06, lineaX06, r, ep, 1);
arrHor06 = arrangeAtomsLine(xX06, lineaX06, MA, listaHor06, 0.001);
for i=1:length(arrHor06) 

   nMA(i + offset, :) = [listaHor06(i) arrHor06(i, 1) arrHor06(i, 2)];

end
offset = length(nMA);
plot(nMA(:,2), nMA(:,3), 'ro')
A1 = [arrHor06(1, 1) arrHor06(1, 2)];
A2 = [arrHor06(length(arrHor06), 1) arrHor06(length(arrHor06), 2)];
[xX06t lineaX06t] = makeAtomsLine(A1, A2);
plot(xX06t, lineaX06t)


[xX07 lineaX07] = makeAtomsLine(C124, C45);
listaHor07 = crossLine2dAtom(MA, xX07, lineaX07, r, ep, 1);
arrHor07 = arrangeAtomsLine(xX07, lineaX07, MA, listaHor07, 0.001);
for i=1:length(arrHor07) 

   nMA(i + offset, :) = [listaHor07(i) arrHor07(i, 1) arrHor07(i, 2)];

end
offset = length(nMA);
%plot(nMA(:,2), nMA(:,3), 'ro')
A1 = [arrHor07(1, 1) arrHor07(1, 2)];
A2 = [arrHor07(length(arrHor07), 1) arrHor07(length(arrHor07), 2)];
[xX07t lineaX07t] = makeAtomsLine(A1, A2);
plot(xX07t, lineaX07t)


[xX08 lineaX08] = makeAtomsLine(C122, C46);
listaHor08 = crossLine2dAtom(MA, xX08, lineaX08, r, ep, 1);
arrHor08 = arrangeAtomsLine(xX08, lineaX08, MA, listaHor08, 0.001);
for i=1:length(arrHor08) 

   nMA(i + offset, :) = [listaHor08(i) arrHor08(i, 1) arrHor08(i, 2)];

end
offset = length(nMA);
%plot(nMA(:,2), nMA(:,3), 'ro')
A1 = [arrHor08(1, 1) arrHor08(1, 2)];
A2 = [arrHor08(length(arrHor08), 1) arrHor08(length(arrHor08), 2)];
[xX08t lineaX08t] = makeAtomsLine(A1, A2);
plot(xX08t, lineaX08t)



[xX09 lineaX09] = makeAtomsLine(C120, C40);
listaHor09 = crossLine2dAtom(MA, xX09, lineaX09, r, ep, 1);
arrHor09 = arrangeAtomsLine(xX09, lineaX09, MA, listaHor09, 0.001);
for i=1:length(arrHor09) 

   nMA(i + offset, :) = [listaHor09(i) arrHor09(i, 1) arrHor09(i, 2)];

end
offset = length(nMA);
%plot(nMA(:,2), nMA(:,3), 'ro')
A1 = [arrHor09(1, 1) arrHor09(1, 2)];
A2 = [arrHor09(length(arrHor09), 1) arrHor09(length(arrHor09), 2)];
[xX09t lineaX09t] = makeAtomsLine(A1, A2);
plot(xX09t, lineaX09t)



[xX10 lineaX10] = makeAtomsLine(C117, C41);
listaHor10 = crossLine2dAtom(MA, xX10, lineaX10, r, ep, 1);
arrHor10 = arrangeAtomsLine(xX10, lineaX10, MA, listaHor10, 0.001);
for i=1:length(arrHor10) 

   nMA(i + offset, :) = [listaHor10(i) arrHor10(i, 1) arrHor10(i, 2)];

end
offset = length(nMA);
%plot(nMA(:,2), nMA(:,3), 'ro')
A1 = [arrHor10(1, 1) arrHor10(1, 2)];
A2 = [arrHor10(length(arrHor10), 1) arrHor10(length(arrHor10), 2)];
[xX10t lineaX10t] = makeAtomsLine(A1, A2);
plot(xX10t, lineaX10t)


[xX11 lineaX11] = makeAtomsLine(C114, C34);
listaHor11 = crossLine2dAtom(MA, xX11, lineaX11, r, ep, 1);
arrHor11 = arrangeAtomsLine(xX11, lineaX11, MA, listaHor11, 0.001);
for i=1:length(arrHor11) 

   nMA(i + offset, :) = [listaHor11(i) arrHor11(i, 1) arrHor11(i, 2)];

end
offset = length(nMA);
%plot(nMA(:,2), nMA(:,3), 'ro')
A1 = [arrHor11(1, 1) arrHor11(1, 2)];
A2 = [arrHor11(length(arrHor11), 1) arrHor11(length(arrHor11), 2)];
[xX11t lineaX11t] = makeAtomsLine(A1, A2);
plot(xX11t, lineaX11t)


[xX12 lineaX12] = makeAtomsLine(C134, C35);
listaHor12 = crossLine2dAtom(MA, xX12, lineaX12, r, ep, 1);
arrHor12 = arrangeAtomsLine(xX12, lineaX12, MA, listaHor12, 0.001);
for i=1:length(arrHor12) 

   nMA(i + offset, :) = [listaHor12(i) arrHor12(i, 1) arrHor12(i, 2)];

end
offset = length(nMA);
%plot(nMA(:,2), nMA(:,3), 'ro')
A1 = [arrHor12(1, 1) arrHor12(1, 2)];
A2 = [arrHor12(length(arrHor12), 1) arrHor12(length(arrHor12), 2)];
[xX12t lineaX12t] = makeAtomsLine(A1, A2);
plot(xX12t, lineaX12t)



[xX13 lineaX13] = makeAtomsLine(C132, C31);
listaHor13 = crossLine2dAtom(MA, xX13, lineaX13, r, ep, 1);
arrHor13 = arrangeAtomsLine(xX13, lineaX13, MA, listaHor13, 0.001);
for i=1:length(arrHor13) 

   nMA(i + offset, :) = [listaHor13(i) arrHor13(i, 1) arrHor13(i, 2)];

end
offset = length(nMA);
plot(nMA(:,2), nMA(:,3), 'ro')
A1 = [arrHor13(1, 1) arrHor13(1, 2)];
A2 = [arrHor13(length(arrHor13), 1) arrHor13(length(arrHor13), 2)];
[xX13t lineaX13t] = makeAtomsLine(A1, A2);
plot(xX13t, lineaX13t)


%
%offset = 0;
%[xY01 lineaY01] = makeAtomsLine(C122, C124);
%listaVert01 = crossLine2dAtom(MA, xY01, lineaY01, r, ep, 2);
%arrVert01 = arrangeAtomsLine(xY01, lineaY01, MA, listaVert01, 0.001);
%for i=1:length(arrVert01) 
%
%   nMA(:,i + offset) = [listaVert01(i) arrVert01(i, 1) arrVert01(i, 2)];
%
%end
%offset = length(nMA);
%plot(nMA(:,2), nMA(:,3), 'ro')
%A1 = [arrVert01(1, 1) arrVert01(1, 2)];
%A2 = [arrVert01(length(arrVert01), 1) arrVert01(length(arrVert01), 2)];
%[xY01t lineaY01t] = makeAtomsLine(A1, A2);
%plot(xY01t, lineaY01t)
%






figure('Name', 'xy')
plot(xY01, lineY01)
hold on
plot(xY02, lineY02)
%plot([H11(1)], [H11(2)], 'o')
plot(X', Y', 'o')
plot(nMA(:,2), nMA(:,3), 'ro')
axis([limitXIzq limitXDer limitYAbj limitYArr]);
grid on


