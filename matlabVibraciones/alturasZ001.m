function alturasZ001

close all
clear all
filename = 'frame1-alturas.dat';

XYZFile = importdata(filename);
format short e

X = XYZFile(:,1);
Y = XYZFile(:,2);
Z = XYZFile(:,3);



fs = 10;
X = floor(X*fs)/fs;
Y = floor(Y*fs)/fs;

MA = XYZFile;
A = importdata('nMA');
atoms = importdata('char-GP.dat');
filename1 = 'gridAlineado.dat';


P = H15;
Q = H14;
R = H04;
PQ = P - Q;
PR = P - R;
normal = cross(PQ, PR);

xp = limitXIzq:01:limitXDer;
yp = limitYAbj:01:limitYArr;

Zd = distanciaPuntoPlano(P, normal);






