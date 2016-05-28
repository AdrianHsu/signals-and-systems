% 2.1

Ts = 0.002;
f1 = 100;
M = 1000;

x(1:M) = 0;
for n = 1:M
    x(n) = cos(2* pi * (n-1) * Ts) + 2 * cos(2*pi*f1 * (n-1)*Ts);
end
plot(x);

fc = f1*Ts*1.4;
fp = 0.28; % passband
fs = 0.99; % stopband

[b1,a1] = butter(16, fc, 'low');
% 'bandpass' specifies a bandpass filter of order 2n 
% if Wn is a two-element vector. 
% 'bandpass' is the default when Wn has two elements.
[b2,a2] = butter((16 / 2), [fp fs], 'bandpass');
y1=filter(b1,a1,x);
plot(y1);
y2=filter(b2,a2,x);
plot(y2);