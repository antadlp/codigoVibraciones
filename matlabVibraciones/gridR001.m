function frames = gridR001

filename = 'outRotadosGridR';
datosAll = importdata(filename);


for i=1:1000

   frames(:,i) = datosAll((((i-1)*8*23) + 1):(i*8*23),1);

end

namefile = 'allFFT2.dat';
fileID = fopen(namefile, 'w');
for i=1:1000

   s = strcat('  FRAME_',int2str(i));
   fprintf(fileID, s);
   fprintf(fileID, '\n');

   matrizFrames(:,:,i) = reshape(frames(:,i), [23, 8]);
   F = fft2(matrizFrames(:,:,i));

      for j=1:23
         fprintf(fileID, '%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f', ...
         F(j,1),F(j,2),F(j,3),F(j,4),F(j,5),F(j,6),F(j,7),F(j,8));
         fprintf(fileID, '\n');
      end
   
   fprintf(fileID, '\n');

end


%
%
%namefile = strcat('verticales', '21');
%fileID = fopen(namefile, 'w');
%for i=1:length(listaVert21)
%   fprintf(fileID, '%f\t %f\t %f\t\n', ...
%   arrVert21(i,1), arrVert21(i, 2), MA(listaVert21(i), 3));
%end
%fprintf(fileID, '\n');
%fclose(fileID);
%v
%
%

   


%figure
%Z = peaks;
%surf(Z)
%axis tight manual
%ax = gca;
%ax.NextPlot = 'replaceChildren';
%loops = 40;
%F(loops) = struct('cdata',[],'colormap',[]);
%for j = 1:loops
%    X = sin(j*pi/10)*Z;
%    surf(X,Z)
%    drawnow
%    F(j) = getframe;
%end
%



