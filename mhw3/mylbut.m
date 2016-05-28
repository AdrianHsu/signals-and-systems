%1.2.1
N = 100;
n_ = 1:1:N;
x(1:N) = 0;
L = 3;
fc = 0.1;
fs = 10;
Ts = 1/fs;

for n = 1:N
    x(n) = cos(2 * pi * (n - 1) * Ts);
end

%(a)