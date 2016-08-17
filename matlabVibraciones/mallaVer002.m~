filename = 'frame-500-002.dat';
A = importdata(filename);

format short e

fs = 10;


Z1 = A(:,3);
X1 = A(:, 1);
Y1 = A(:, 2);

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
Z = zeros(length(x), length(y));

fileIDX = fopen('verX2.dat', 'w');
fileIDY = fopen('verY2.dat', 'w');

for i=1:length(X1)
   
   fprintf(fileID, '\nVERIFICANDO %f\n', X1(i));

   xCheck = abs(x - X1(i));
   [xx I(i)] = min(xCheck);
     
   fprintf(fileID, '%f\t%f\n\n', X1(i), x(I(i)));
   
   yCheck = abs(y - Y1(i));
   [yy J(i)] = min(yCheck);

   fprintf(fileIDY, '\nVERIFICANDO %f\n', Y1(i));
   fprintf(fileIDY, '%f\t%f\n\n', Y1(i), y(J(i)));

   Z(I(i), J(i)) = Z1(i);
   z2(i,3) = z(I(i), J(i));
   z2(i,1) = x(I(i));
   z2(i,2) = y(J(i));

end

fclose(fileIDX);
fclose(fileIDY);

r = 1.0;
Zr = zeros(length(x), length(y));


l = 1;
for i=1:length(x)
   for j=1:length(y)

      if ( (abs(x(i) - x(I(l))) <= r) & (abs(y(j) - y(J(l))) <= r))

         sg = ((x(i)*y(i))/abs((x(i)*y(i))));
         Zr(i,j) = sg*sqrt(r^2 - (x(i) - x(I(l)))^2 ...
         - (y(j) - y(J(l)))^2);
         l = l+1;

      else 

         Zr(i,j) = NaN;

      end

   end
end





   


[X Y] = meshgrid(x, y);
figure('Name', 'surface')
surface(X', Y', Z, 'EdgeColor', 'none'), view(3)
   
figure('Name', 'mesh')
mesh(X', Y', Z)

figure('Name', 'atomos')
surface(X', Y', Zr, 'EdgeColor', 'none'), view(3)
 



