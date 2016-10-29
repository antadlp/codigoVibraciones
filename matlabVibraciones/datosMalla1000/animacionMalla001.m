%function AnimacionD1(t,x,p)
function animacionMalla001


t = 1:100;
for i=1:length(t)

   s2 = '/home/toshiba/out003/mallaInter';
   filename2 = strcat(s2, int2str(i));
   Zp(:,:,i) = importdata(filename2);

end

Z = -1*Zp(:,:,1);
h = surf(Xpol,Ypol,Z, 'ZDataSource', 'Z', 'EdgeColor', 'none');
axis([-inf inf -inf inf -1 1])
hold on

for m=2:length(t)
    Z = -1*Zp(:,:,m);
    refreshdata(h,'caller')
    drawnow; 
    pause(.15)
end


