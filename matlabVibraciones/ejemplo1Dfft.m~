
%t = 0:1/fs:10-1/fs;                      % 10 sec sample

fs = 100;                                % Sample frequency (Hz)
fr1 = 2;
fr2 = 7;

P1 = 1/fr1;
P1 = 1/fr2;

tf = max([P1 P2]);

%t = 0:.01:10;                      % 10 sec sample
t = 0:1/fs:10-1/fs;                      % 10 sec sample

x = (1.3)*sin(2*pi*fr1*t).*((1.7)*sin(2*pi*fr2*(t-2)));          % 40 Hz component
%  + 2.5*gallery('normaldata',size(t),4); % Gaussian noise;

figure(1), plot(t, x)
axis([t(1) 12*P2 min(x) max(x)])

%
%P = gcd(P1,P1); 
%
%figure(1), plot(t, x)
%axis([t(1) P min(x) max(x)])

m = length(x);          % Window length
%n = pow2(nextpow2(m))  % Transform length
n = 512;
y = fft(x,n);           % DFT
f = (0:n-1)*(fs/n);     % Frequency range
power = y.*conj(y)/n;   % Power of the DFT

figure(2), plot(f,power)
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf Periodogram}')

y0 = fftshift(y);          % Rearrange y values
f0 = (-n/2:n/2-1)*(fs/n);  % 0-centered frequency range
power0 = y0.*conj(y0)/n;   % 0-centered power

fft1 = fft(x);
power1 = fft1.*conj(fft1);
figure(5), plot(t, power1)
figure(6), plot(t, real(fft1))


figure(3), plot(f0,power0)
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf 0-Centered Periodogram}')

t = t(1):.01:12*P2;
x1 = t;
y1 = x1;
[X1, Y1] = meshgrid(x1, y1);
Z1 = (1.3)*sin(2*pi*fr1*X1).*((1.7)*sin(2*pi*fr2*(Y1-2)));          % 40 Hz component

figure(4), surface(X1, Y1, Z1,'EdgeColor', 'none'), view(3)

Zfft = fft2(Z1);






