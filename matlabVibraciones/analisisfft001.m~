function y = analisisfft001(fs, Z1, X1, Y1, S)


Z1 = (1.3)*sin(2*pi*fr1*X1)+((1.7)*sin(2*pi*fr2*(X1-2))) ...
+ (1.3)*sin(2*pi*fr1*Y1)+((1.7)*sin(2*pi*fr2*(Y1-2)));

[M N] = size(Z1);

S1 = strcat('Z1 ', S);
figure('Name', S1)
surface(X1, Y1, Z1,'EdgeColor', 'none'), view(3)

Zc1 = Z1(floor(M/3), :);
Xc1 = X1(floor(M/3), :);

Sc1 = strcat('Zc1 ', S);
figure('Name', Sc1)
plot(Xc1, Zc1)

Zc2 = Z1(floor(2*M/3), :);
Xc2 = X1(floor(2*M/3), :);
Sc2 = strcat('Zc2 ', S);
figure('Name', Sc2)
plot(Xc2, Zc2)

Zc3 = Z1(:, floor(M/3));
Yc3 = Y1(:, floor(M/3));
Sc3 = strcat('Zc3 ', S);
figure('Name', Sc3)
plot(Yc3, Zc3)

Zc4 = Z1(:, floor(2*M/3));
Yc4 = Y1(:, floor(2*M/3));
Sc4 = strcat('Zc4 ', S);
figure('Name', Sc4)
plot(Yc4, Zc4)

Z1f = fft2(Z1);
Z1sh = fftshift(Z1f);
Z1P = Z1sh.*conj(Z1sh);
x2 = (-M/2:M/2-1)*(fs/M);
y2 = x2;
[X2 Y2] = meshgrid(x2, y2);

S1P = strcat('Z1P ', S);
figure('Name', S1P)
maxP = maxValueMatrix(Z1P);
k = 0.05;
Z1P = Z1P/(k*maxP);
surface(X2, Y2, Z1P,'EdgeColor', 'none'), view(3)







