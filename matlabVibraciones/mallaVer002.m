filename = 'frame-500-002.dat';
filename2 = 'frame-500-003.dat';
A = importdata(filename);
B = importdata(filename2);

format short e

fs = 10;


Z1 = A(:,3);
X1 = A(:, 1);
Y1 = A(:, 2);
At = B(:, 1);

X1 = floor(X1*fs)/fs;
Y1 = floor(Y1*fs)/fs;

xmax = max(X1);
xmin= min(X1);
x = xmin:1/fs:xmax;

ymax = max(Y1);
ymin= min(Y1);
y = ymin:1/fs:ymax;



n = 1;
p = 1;



fileIDX = fopen('verX2.dat', 'w');
fileIDY = fopen('verY2.dat', 'w');

Z = zeros(length(x), length(y));
for i=1:length(x)
   for j=1:length(y)

      Z(i,j) = NaN;

   end
end

for i=1:length(X1)
   
   fprintf(fileIDX, '\nVERIFICANDO %f\n', X1(i));

   xCheck = abs(x - X1(i));
   [xx I(i)] = min(xCheck);
     
   fprintf(fileIDX, '%f\t%f\n\n', X1(i), x(I(i)));
   
   yCheck = abs(y - Y1(i));
   [yy J(i)] = min(yCheck);

   fprintf(fileIDY, '\nVERIFICANDO %f\n', Y1(i));
   fprintf(fileIDY, '%f\t%f\n\n', Y1(i), y(J(i)));

   Z(I(i), J(i)) = Z1(i);
   z2(i,3) = Z(I(i), J(i));
   z2(i,1) = x(I(i));
   z2(i,2) = y(J(i));

end
fclose(fileIDX);
fclose(fileIDY);



r = 0.5;
Zr = zeros(length(x), length(y));

for i=1:length(x)
   for j=1:length(y)

      ZrC(i,j) = NaN;

   end
end



for l=1:length(X1)
   for i=1:length(x)
      for j=1:length(y)

         ecC = (x(i) - x(I(l)))^2 + (y(j) - y(J(l)))^2;

         if (ecC <= r^2)
        
            Zr(i,j,l) = sqrt(r^2 - ecC);
            ZrC(i,j)= sqrt(r^2 - ecC) + Z(I(l),J(l)); 

         else

            Zr(i,j,l) = NaN;

         end

      end
   end
end





   


[X Y] = meshgrid(x, y);
figure('Name', 'surface')
surface(X', Y', Z, 'EdgeColor', 'none'), view(3)
   
figure('Name', 'mesh')
mesh(X', Y', Z*6)
hold on
surface(X', Y', ZrC, 'EdgeColor', 'none'), view(3)
axis([-inf inf -inf inf -5 5])


%figure('Name', 'atomos')
%hold on
%for l=1:length(X1)
%  
%   surface(X', Y', Zr(:,:,l), 'EdgeColor', 'none'), view(3)
%
%end
%axis([-inf inf -inf inf -5 5])
 
figure('Name', 'atomos2')
surface(X', Y', ZrC, 'EdgeColor', 'none'), view(3)
axis([-inf inf -inf inf -5 5])

for i=1:length(X1)
%   disp(Z(I(i),J(i)));
   fprintf('%i\t%f\n', i, Z(I(i),J(i)));
end

 


