function [v w vv ww Pf] = analisisfft002(Z1, X1, Y1, S)


[M N] = size(Z1);
%S1 = strcat('Z1 ', S);
%figure('Name', S1)
%surface(X1, Y1, Z1,'EdgeColor', 'none'), view(3)
%
%Zc1 = Z1(floor(M/3), :);
%Xc1 = X1(floor(M/3), :);
%
%Sc1 = strcat('Zc1-', S);
%figure('Name', Sc1)
%plot(Xc1, Zc1)
%
%Zc2 = Z1(floor(2*M/3), :);
%Xc2 = X1(floor(2*M/3), :);
%Sc2 = strcat('Zc2-', S);
%figure('Name', Sc2)
%plot(Xc2, Zc2)
%
%Zc3 = Z1(:, floor(M/3));
%Yc3 = Y1(:, floor(M/3));
%Sc3 = strcat('Zc3-', S);
%figure('Name', Sc3)
%plot(Yc3, Zc3)
%
%Zc4 = Z1(:, floor(2*M/3));
%Yc4 = Y1(:, floor(2*M/3));
%Sc4 = strcat('Zc4-', S);
%figure('Name', Sc4)
%plot(Yc4, Zc4)

fs = 1;
Z1f = fft2(Z1);
Z1sh = fftshift(Z1f);
Z1P = Z1sh.*conj(Z1sh);
x2 = (-M/2:M/2-1)*(fs/M);
length(x2);
y2 = (-N/2:N/2-1)*(fs/N);
length(y2);
[X2 Y2] = meshgrid(x2, y2);
size(X2');
size(Y2');
size(Z1P);

X2 = X2';
Y2 = Y2';
S1P = strcat('Z1P-', S);
figure('Name', S1P)
maxP = maxValueMatrix(Z1P);
k = 1.00;
Z1Pk = Z1P/(k*maxP);
Z1Pk = Z1P;
surface(X2, Y2, Z1Pk,'EdgeColor', 'none'), view(3)

Sms = strcat('Zms-', S);
figure('Name', Sms)
mesh(X2, Y2, Z1Pk)

l = 1;
for i=1:M
   for j=1:N
      if (Z1P(i,j) >= 0.5*maxP)
%         y(l, :) = [x2(i) y2(j)];
         yx(l) = x2(i);
         yy(l) = y2(j);
         l = l + 1;
      end
   end
end

v = unique(yx);
w = unique(yy);
numFreq = 10;

if (length(v) < numFreq)

   vv = v;

else

   for i=1:numFreq 

      vv(i) = v(length(v) - (i-1));

   end

end



if (length(w) < numFreq)

   ww = w;

else

   for i=1:numFreq 

      ww(i) = w(length(w) - (i-1));

   end

end

dummie = Z1P;
for i=1:numFreq
   
   [aa bb cc] = maxValueMatrix2(dummie);
   Pf(i,:) = [x2(bb) y2(cc)];
   dummie(bb, cc) = -inf;

end













