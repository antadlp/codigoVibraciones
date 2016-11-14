function alturasZ001


%Frecuentemente al tener graficas con nombres propios (figure('Name','nombre'))
%las ventanas no se sobreponen sino que se abre una nueva, pudiendo tener N*M
%ventanas abiertas de graficas. Siendo N el numero de graficas por script y M
%el numero de veces que se ha abierto el script.

close all
clear all
filename = 'frame250-mil.dat';

XYZFile = importdata(filename);
format short e

X = XYZFile(:,1);
Y = XYZFile(:,2);
Z = XYZFile(:,3);

fs = 10;
X = floor(X*fs)/fs;
Y = floor(Y*fs)/fs;

MA = XYZFile;

P = [MA(11,1) MA(11,2) MA(11,3)];
Q = [MA(7,1) MA(7,2) MA(7,3)];
R = [MA(1,1) MA(1,2) MA(1,3)];
PQ = P - Q;
PR = P - R;
normal = cross(PQ, PR);

xmax = max(X);
xmin= min(X);
x = xmin:1/fs:xmax;

ymax = max(Y);
ymin= min(Y);
y = ymin:1/fs:ymax;

extraLimitA = abs(MA(11,1) - MA(11,1));
extraLimitB = abs(MA(15,1) - MA(15,1));

extraLimit = max([extraLimitA extraLimitB]);
extraLimit2 = extraLimit/2;

limitXIzq = xmin - extraLimit2;
limitXDer = xmax + extraLimit2;

limitYArr = ymax + extraLimit2;
limitYAbj = ymin - extraLimit2;

xp = limitXIzq:01:limitXDer;
yp = limitYAbj:01:limitYArr;

[Xp Yp] = meshgrid(xp, yp);
[Zp N] = makePlano001(Xp, Yp, P, normal');

nAtoms = 142;
for i=1:nAtoms
   
   Zp = [MA(i,1) MA(i,2) MA(i,3)];
   Zd(i) = distanciaPuntoPlano(Zp, N);

end

atoms = importdata('char-GP.dat');
aGrid = importdata('mallanMA.dat');

fileID = fopen('f250-alturas-mil.xyz', 'w');
fileID2 = fopen('f250-alturas-mil.dat', 'w');

fprintf(fileID, '%s\n', int2str(nAtoms));
fprintf(fileID, '%s\t%d\n', 'frame', 1);
for i=1:(nAtoms)

   if (atoms{i}=='H')
      
      fprintf(fileID, '%c  %f  %f  %f\n', atoms{i}, aGrid(i,1), aGrid(i,2), 0.00);
      fprintf(fileID2, '%f  %f  %f\n', aGrid(i,1), aGrid(i,2), 0.00);
   
   else
      
      j = i - 28; % !!Suponiendo que todos los movies tienen 1-28 atomos H !!
      fprintf(fileID, '%c  %f  %f  %f\n', atoms{i}, aGrid(i,1), aGrid(i,2),...
      Zd(i));

      fprintf(fileID2, '%f  %f  %f\n', aGrid(i,1), aGrid(i,2), Zd(i));
   end

end

fclose('all')







   






