A = importdata('nMA');
B = importdata('char-GP.dat');

fileID = fopen('mallanMA.xyz','w');
nAtoms = 142;

fprintf(fileID, '%s\n', int2str(nAtoms));
fprintf(fileID, '%s%t%d\n', 'frame', 1);

for i=1:nAtoms
   fprintf(fileID, )

   

