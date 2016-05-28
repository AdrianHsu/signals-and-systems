%1.2.1
N = 100;
x(1:N) = 0;
L = 3;
fc = 0.1;
fs = 10;
Ts = 1/fs;

for n = 1:N
    x(n) = cos(2 * pi * (n - 1) * Ts);
end

%(a)
[b, a] = butter(L, fc);
%(b)
[H, w] = freqz(b, a, N);
stem(20*log(abs(H)));
stem(360*angle(H)/(2*pi));
%(c)
y = filter(b, a, x);
stem(y);

%(d)
L_d = 7;
fc_d = 0.1;
fs_d = 10;
Ts_d = 1/fs_d;

% (d). repeat (a) - (c)

%(a)
[b_d, a_d] = butter(L_d, fc_d);
%(b)
[H_d, w_d] = freqz(b_d, a_d, N);
stem(20*log(abs(H_d)));
stem(360*angle(H_d)/(2*pi));
%(c)
y_d = filter(b_d, a_d, x);
stem(y_d);


%(e)
L_e = 3;
fc_e = 0.5;
fs_e = 10;
Ts_e = 1/fs_e;

% (e). repeat (a) - (c)
%(a)
[b_e, a_e] = butter(L_e, fc_e);
%(b)
[H_e, w_e] = freqz(b_e, a_e, N);
stem(20*log(abs(H_e)));
stem(360*angle(H_e)/(2*pi));
%(c)
y_e = filter(b_e, a_e, x);
stem(y_e);
