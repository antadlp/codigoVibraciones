% 2D FFT Demo
% 
% http://matlabgeeks.com/tips-tutorials/how-to-do-a-2-d-fourier-transform-in-matlab/
%
%

imageA = imread('imageA1', 'png');
imageB = imread('imageB', 'png');

figure, imshow(imageA)
title('Image A - Greek Church')

figure, imshow(imageB)
title('Image A - Aishawarya Rai')

fftA = fft2(double(imageA));
fftB = fft2(double(imageB));




