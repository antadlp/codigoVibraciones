function zz = fft2UV(Z)

% m renglones => x
% n columnas => y

[M N] = size(Z);

MN = 1/(M*N);

for u=1:M
   u
   for v=1:N
      v
      zz(u,v) = 0;
      for x=1:M
         for y=1:N
            Zi = Z(x,y)
            zz(u,v) = zz(u,v) + MN*Z(x,y)*(sin(2*pi*((u-1)*(x-1)/M+(v-1)*(y-1)/N))+j*cos(2*pi*((u-1)*(x-1)/M+(v-1)*(y-1)/N)))
         end
      end
   end
end








