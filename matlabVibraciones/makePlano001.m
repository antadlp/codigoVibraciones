% http://stackoverflow.com/questions/3461869/
% plot-a-plane-based-on-a-normal-vector-and-a-point-
% in-matlab-or-matplotlib
%
function Z = makePlano001(X, Y, P, N)

% X = malla X
% Y = malla Y
% P = Punto en el plano
% N = normal al plano

% basado en 
% a*x + b*y + c*z + d = 0;
%

d = -P*N;

Z = (-N(1)*X - N(2)*Y -d)/N(3);



