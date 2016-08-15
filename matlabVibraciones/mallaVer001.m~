filename = 'frame500-001.dat';
A = importdata(filename);


Z1 = A(:,3);
X1 = A(:, 1);
Y1 = A(:, 2);

xmax = max(X1);
xmin= min(X1);
x = xmin:1/10000:xmax;

ymax = max(Y1);
ymin= min(Y1);
y = ymin:1/10000:ymax;

Z = zeros(length(x), length(y));
for i=1:length(x)
   for j=1:length(X1)
      if (x(i) == X1(j))
         for l=1:length(y)
            for m=1:length(Y1)
               if (y(l) == Y1(m))
                  Z(i,l) = Z(m);
               end
            end
         end
      end
   end
end




%[X Y] = meshgrid(x, y);

%surface(X, Y, Z1)


%surface(X2, Y2, Z1Pk,'EdgeColor', 'none'), view(3)

%Sms = strcat('Zms-', S);
%figure('Name', Sms)
%mesh(X2, Y2, Z1Pk)
%


