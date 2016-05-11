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
plot(n, w);