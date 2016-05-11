% 1.2.1
N = 1001;
T = 100;
N1 = 500;
Ts = T / N; %Ts = 0.0999

% n ? {?N1,?N1 +1, ¡P ¡P ¡P , 0, ¡P ¡P ¡P , N1 ? 1, N1}
n = -N1:1:N1;
t = n * Ts;

% x = sinc(t)
x(1:1001) = 0;
for i = 1:1001
   x(i) = sin(pi * t(i)) / (pi * t(i));
end

% (a) (10%) Plot x[n].
plot(n, x);
% (b) (20%) Plot the magnitude response of the DFT of x during [?N1,N1]. The zero
% frequency should be centered in your plot. Observe the Gibbs phenomenon here.

