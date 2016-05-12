%1.2.2
N = 1001;
T = 100;
N1 = 500;
Ts = T / N; % 0.0999
Tw = T / 2; % 50

n = -N1:1:N1;
t = n * Ts;

w(1:N) = 0;
for i = 1:N
    if abs(i - N1) <= (Tw / 2) * (1/Ts) 
        w(1, i) = (1/2) * (1 + cos(2 * pi * abs(t(1, i)) / Tw));
    end
end

% (a)
figure;
plot(n, w);

% (b)

x(1:N) = 0;
y(1:N) = 0;
for i = 1:N
   x(1, i) = sin(pi * t(1, i)) / (pi * t(1, i));
   
   % find(isnan(x)) returns ans = 501
   % i.e. x(1, 501) = NaN
   if i == N1 + 1 % i == 501
       x(1, i) = 1;
   end
   y(1, i) = x(1, i) * w(1, i);
end

figure;
plot(n, y);

% (c)
Y = fft(y, N);
figure;
plot(n * 2 * pi* (1/N), fftshift(abs(Y)));