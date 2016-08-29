function arr = arrangeAtomsLine(xlinea, ylinea, A, B, dx)
%function distancia = distanciaPuntoLinea001(xlinea, ylinea, P, dx)


for i=1:length(B)

   P = [A(B(i), 1) A(B(i), 2)];
   d(i) = distanciaPuntoLinea001(xlinea, ylinea, P, 0.001);

end

ymin = min(d);
ymax = max(d);

yArr = (ymax - ymin)/2;

for i=1:length(B)

   arr(i, :) = [A(B(i), 1) yArr];

end




