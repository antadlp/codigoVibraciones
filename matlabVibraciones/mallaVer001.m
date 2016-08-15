filename = 'frame-500-002.dat';
A = importdata(filename);


Z1 = A(:,3);
X1 = A(:, 1);
Y1 = A(:, 2);

X1 = floor(X1*10)/10;
Y1 = floor(Y1*10)/10;

xmax = max(X1);
xmin= min(X1);
x = xmin:1/10:xmax;

ymax = max(Y1);
ymin= min(Y1);
y = ymin:1/10:ymax;

Z = zeros(length(x), length(y));
for i=1:length(x)
   for j=1:length(X1)
      if (x(i) == X1(j))
         for l=1:length(y)
            for m=1:length(Y1)
               if (y(l) == Y1(m))
                  Z(i,l) = Z1(m);
                  Z2(n,3) = Z(i,l);
                  Z2(n,1) = x(i);
                  Z2(n,2) = y(j);
                  n = n + 1;
               end
            end
         end
      end
   end
end


%Z2 = zeros(length(X1), 3);
%n = 1;
%for i=1:length(x)
%   for j=1:length(y)
%      if (Z(i,j) ~= 0)
%         Z2(n,3) = Z(i,j);
%         Z2(n,1) = x(i);
%         Z2(n,2) = y(j);
%         n = n + 1;
%      end
%   end
%end

fileID = fopen('frameCheck.dat','w');
fprintf(fileID, '%f %f %f\n', Z2);
fclose(fileID);

[X Y] = meshgrid(x, y);
figure('Name', 'surface')
surface(X', Y', Z, 'EdgeColor', 'none'), view(3)
   
figure('Name', 'mesh')
mesh(X', Y', Z)



