%function y = analisisfft001(fs, Z1, X1, Y1, S)

id1 = 'id1';
fs = 100;
fr1 = 2;
fr2 = 7;
t = 0:1/fs:2-1/fs;                    
x = t;
y = x;
[X1 Y1] = meshgrid(x, y);
Z1 = (1.3)*sin(2*pi*fr1*X1)+((1.7)*sin(2*pi*fr2*(X1-2))) ...
+ (1.3)*sin(2*pi*fr1*Y1)+((1.7)*sin(2*pi*fr2*(Y1-2)));

y1 = analisisfft001(fs, Z1, X1, Y1, id1);




