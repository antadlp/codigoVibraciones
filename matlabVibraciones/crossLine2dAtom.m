function lista = crossLine2dAtom(Atoms, xline, yline, radii, ep)

dx = abs(radii/ep);
xmin = min(xline);
xmax = max(xline);

x = xmin:dx:xmax;
m = (yline(length(yline)) - yline(1))/(xline(length(xline)) - xline(1));

y = m*(x - xline(1)) + yline(1);

%y = m*(x - P1(1)) + P1(2); 

A = Atmos;
sz = size(Atmos);
r = radii;

for i=1:sz(1)
   for j=1:length(x)

      xA = A(i, 1);
      yA = A(i, 2);

      rp = (x(j) - xA)^2 + (y(j) - yA)^2;

      if ( rp <= radii^2)

         lista(l) = i;

      end

   end
end


      




