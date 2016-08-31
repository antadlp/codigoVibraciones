function arr = arrangeAtomsLine(xlinea, ylinea, A, B, dx)
%function distancia = distanciaPuntoLinea001(xlinea, ylinea, P, dx)


for i=1:length(B)

   P = [A(B(i), 1) A(B(i), 2)];
   d(i) = distanciaPuntoLinea001(xlinea, ylinea, P);

end

xmin = min(d);
xmax = max(d);

xpMin = min(A(B, 2));

xArr = xpMin + (xmax - xmin)/2

for i=1:length(B)

   arr(i, :) = [xArr A(B(i), 2)];

end




