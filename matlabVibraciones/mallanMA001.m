A = importdata('nMA');
B = importdata('char-GP.dat');

fileID = fopen('mallanMA.xyz','w');
nAtoms = 142;

[A1 A2] = unique(A(:,1));

fprintf(fileID, '%s\n', int2str(nAtoms));
fprintf(fileID, '%s%t%d\n', 'frame', 1);

for i=1:(nAtoms-1)

   if (B{i}=='H')
      
      fprintf(fileID, '%c  %f  %f  %f', B{i}, 0.00, 0.00, 0.00);
   
   else
      j = i - 28;

      fprintf(fileID, '%c  %f  %f  %f', B{i}, A(A2(j,2)), A(A2(j,3)));
   end

end





   

