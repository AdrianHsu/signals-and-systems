% 1.2.1
N = 1001;
T = 100;
N1 = 500;
Ts = T / N; %Ts = 0.0999

n = -N1:1:N1;
t = n * Ts;

% Sol1. 
% x = sinc(t);
% Sol2.
x(1:N) = 0;
for i = 1:N
   x(1, i) = sin(pi * t(1, i)) / (pi * t(1, i));
   
   % find(isnan(x)) returns ans = 501
   % i.e. x(1, 501) = NaN
   if i == N1 + 1 % i == 501
       x(1, i) = 1;
   end
end

% (a)
figure;
plot(n, x);

% (b)
X = fft(x, N);
figure;
plot(n * 2 * pi* (1/N)  , fftshift(abs(X)));

% (c)
K = 16;
N1_ = K * N1;
N_ = (2 * N1_) + 1;
n_ = -(N1_):1:(N1_);
t_ = n_ * Ts;
% Sol1.
% x_ = sinc(t_);
% Sol2.
x_(1:N_) = 0;
for i = 1:N_
   x_(1, i) = sin(pi * t_(1, i)) / (pi * t_(1, i));
   
   if i == N1_ + 1
       x_(1, i) = 1;
   end
end

figure;
plot(n_, x_);
X_ = fft(x_, N_);
figure;
plot(n_ * 2 * pi* (1/N_), fftshift(abs(X_)));


