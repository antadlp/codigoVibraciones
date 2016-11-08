function alturasZ001

close all
clear all
filename = 'frame1-mil.dat';

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



nAtoms = 142;
for i=1:nAtoms
   
   Zp = MA(i,3);
   Zd(i) = distanciaPuntoPlano(Zp, normal);

end

atoms = importdata('char-GP.dat');
aGrid = importdata('mallanMA.dat');

fileID = 'f1-alturas-mil.xyz';
fileID2 = 'f1-alturas-mil.dat';

for i=1:(nAtoms)

   if (atoms{i}=='H')
      
      fprintf(fileID, '%c  %f  %f  %f\n', atoms{i}, C(i,1), C(i,2), 0.00);
      fprintf(fileID2, '%f  %f  %f\n', C(i,1), C(i,2), 0.00);
   
   else
      
      j = i - 28; % !!Suponiendo que todos los movies tienen 1-28 atomos H !!
      fprintf(fileID, '%c  %f  %f  %f\n', atoms{i}, aGrid(i,1), aGrid(i,2),...
      Zd(i));

      fprintf(fileID2, '%f  %f  %f\n', aGrid(i,1), aGrid(i,2), Zd(i));
   end

end

fclose(fileID);
fclose(fileID2);







   






