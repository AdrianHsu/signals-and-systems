function y = my1conv(x1, x2)
% y = conv(x1', x2');
N1 = length(x1);
N2 = length(x2);
MAX_RANGE = N1 + N2 - 1;
MAX = max(N1, N2);

y = zeros(1, MAX_RANGE);

for n = 1:MAX_RANGE
    SUM = 0;
    for k = 1:N1
        z = 0;
        if n - k >= 1 && n - k <= MAX
            z = x1(1, k) * x2(1, n - k);
        end
        SUM = SUM + z;
    end
    y(1, n) = SUM;
end

plot(y);