% malla de prueba para transformada
%


x1 = -pi:2:pi;
y1 = x1;
[X1, Y1] = meshgrid(x1, y1);
Z1 = (0.3)*sin(X1);
%figure(1), surface(X1, Y1, Z1), view(3)

x2 = -2:0.2:2;
y2 = x2;
[X2, Y2] = meshgrid(x2, y2);
Z2 = X2.*exp(-X2.^2 - Y2.^2);
%figure(2), surface(X2, Y2, Z2), view(3)


C1 = fft2(Z1);
C2 = fft2(Z2);

Z1i = ifft2(C1);
Z2i = ifft2(C2);

dZ1 = Z1 - Z1i;
dZ2 = Z2 - Z2i;

%figure(3), surface(X1, Y1, dZ1), view(3)
%%figure(4), surface(X2, Y2, dZ2), view(3)
%
%figure(5), surface(X1, Y1, Z1i), view(3)
%figure(6), surface(X2, Y2, Z2i), view(3)


A = 2 + 3*j;
B = A;
C = A*B;

zz = fft2XY(Z1);

difXY = C1 - zz;

C1
zz

%figure(7), surface(X1, Y1, abs(zz)), view(3)

