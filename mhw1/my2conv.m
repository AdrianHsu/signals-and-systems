function y = my2conv(x1, x2)
N1 = length(x1);
N2 = length(x2);
MAX_RANGE = N1 + N2 - 1;

m = zeros(MAX_RANGE, N2);

for i = 1:MAX_RANGE
    for j = 1:N2
       if i - j + 1 > 0 && i - j + 1 <= N1
           m(i, j) = x1(1, i - j + 1);
       else
           m(i, j) = 0;
       end
    end
end
y = m * x2';
plot(y);