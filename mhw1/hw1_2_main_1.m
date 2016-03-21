x1 = (1:1:500);
for r = 501:999
   x1(1, r) = 999 - r + 1;
end
x2 = (1:1:500);
subplot(1,2,1);
stem(x1);
subplot(1,2,2);
stem(x2);

y = conv(x1', x2');