%filename = 'zzout2.dat';
filename = 'frame-500-000.dat';
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


figure('Name', 'xy')
plot(xY01, lineY01)
hold on
plot(xY02, lineY02)
%plot([H11(1)], [H11(2)], 'o')
plot(X', Y', 'o')
axis([limitXIzq limitXDer limitYAbj limitYArr]);
grid on

X0 = X;
Y0 = Y;

[xX01 lineaX01] = makeAtomsLine(H11, H04);
