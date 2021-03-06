%function AnimacionD1(t,x,p)
function animacionMalla001

nMA = importdata('nMA-B12N12a.dat');

xnMA = nMA(:,2);
ynMA = nMA(:,3);

xnMA = unique(xnMA);
ynMA = unique(ynMA);

fs = 10;
[XNMA YNMA] = meshgrid(xnMA, ynMA);
x = min(xnMA):1/fs:max(xnMA);
y = min(ynMA):1/fs:max(ynMA);
[Xpol Ypol] = meshgrid(x,y);


t = 1:5000;
load('zp-B12N12a.mat');
Zp = inter2;
Z = -1*Zp(:,:,1);
h = surf(Xpol,Ypol,Z, 'ZDataSource', 'Z', 'EdgeColor', 'none');
axis([-inf inf -inf inf -1 1])
hold on

for m=2:length(t)
    m
    Z = -1*Zp(:,:,m);
    refreshdata(h,'caller')
    drawnow; 
    pause(.035)
end


