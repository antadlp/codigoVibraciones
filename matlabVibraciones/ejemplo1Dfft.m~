
fs = 100;                                % Sample frequency (Hz)
%t = 0:1/fs:10-1/fs;                      % 10 sec sample
t = 0:.1:10;                      % 10 sec sample
x = (1.3)*sin(2*pi*15*t) ...             % 15 Hz component
  + (1.7)*sin(2*pi*40*(t-2)) ...         % 40 Hz component
  + 2.5*gallery('normaldata',size(t),4); % Gaussian noise;

  figure(1), plot(t, x)

m = length(x);          % Window length
n = pow2(nextpow2(m));  % Transform length
y = fft(x,n);           % DFT
f = (0:n-1)*(fs/n);     % Frequency range
power = y.*conj(y)/n;   % Power of the DFT

plot(f,power)
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf Periodogram}')

y0 = fftshift(y);          % Rearrange y values
f0 = (-n/2:n/2-1)*(fs/n);  % 0-centered frequency range
power0 = y0.*conj(y0)/n;   % 0-centered power

figure(2), plot(f0,power0)
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf 0-Centered Periodogram}')

x1 = t;
y1 = x1;
[X1, Y1] = meshgrid(x1, y1);
Z1 = (1.3)*sin(2*pi*15*X1) ...             % 15 Hz component
  + (1.7)*sin(2*pi*40*(X1-2));         % 40 Hz component
%  + 2.5*gallery('normaldata',size(X1),4); % Gaussian noise;

figure(3), surface(X1, Y1, Z1), view(3)





